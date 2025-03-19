num_trials = 5; 
matrix_size_rows = 10; 
matrix_size_cols = 20; 
response_keys = {'q', 'w', 'a', 's'}; 

% Define quadrants
quadrants = struct('q', {1:floor(matrix_size_rows/2), 1:floor(matrix_size_cols/2)}, ...   % Top-left quadrant
                   'w', {1:floor(matrix_size_rows/2), floor(matrix_size_cols/2)+1:matrix_size_cols},...  % Top-right quadrant
                   'a', {floor(matrix_size_rows/2)+1:matrix_size_rows, 1:floor(matrix_size_cols/2)}, ...  % Bottom-left quadrant
                   's', {floor(matrix_size_rows/2)+1:matrix_size_rows, floor(matrix_size_cols/2)+1:matrix_size_cols});  % Bottom-right quadrant

trial_order = randperm(num_trials);

% Output
reaction_times = zeros(num_trials, 1);
accuracies = zeros(num_trials, 1);

% Create "+" matrices
matrices = cell(1, num_trials); 
target_positions = cell(1, num_trials); 
for i = 1:num_trials
    matrix2 = repmat('+', matrix_size_rows, matrix_size_cols); 
    % Set target stimulus
    target_row = randi(matrix_size_rows);
    target_col = randi(matrix_size_cols);
    matrix2(target_row, target_col) = 'x'; 
    matrices{i} = matrix2; 
    target_positions{i} = [target_row, target_col]; %n
end

% Fiure window
fig = figure('Name', 'Stimulus Search', 'NumberTitle', 'off', 'MenuBar', 'none', 'ToolBar', 'none');

clf(fig);  

% Trials 
for trial_idx = 1:num_trials
    matrix2 = matrices{trial_order(trial_idx)};
    
    % Target position
    target_position = target_positions{trial_order(trial_idx)};
    target_row = target_position(1);
    target_col = target_position(2);
    
   
    clf(fig); 
    
    % Display matrix in fif window
    text(0.5, 0.5, matrix2, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    axis off;
    
  
   start_timer = tic; 
    
 
    set(fig, 'UserData', struct('matrix_size_rows', matrix_size_rows, 'matrix_size_cols', matrix_size_cols));
    
    % Wait for the participant to press a key
    [key_pressed, time_pressed] = waitforkeypress(fig, t_start);
    
    % Reaction time (if key was pressed)
    if ~isempty(key_pressed)
        reaction_time = toc(t_start); 
        reaction_times(trial_idx) = reaction_time;
        
        % Check if the key corresponds to correct quadrant 
        correct_quadrant = get_quadrant(target_row, target_col, matrix_size_rows, matrix_size_cols);
        
        accuracy = strcmpi(key_pressed, correct_quadrant);
        accuracies(trial_idx) = accuracy;
    else
        % Computing results if no key preses
        reaction_times(trial_idx) = NaN;
        accuracies(trial_idx) = 0; 
    end
    

    pause(0.5);
end

% Results
mean_reaction_time = mean(reaction_times, 'omitnan'); 
overall_accuracy = mean(accuracies) * 100; 
disp('Results:');
disp(['Mean Reaction Time: ', num2str(mean_reaction_time), ' seconds']);
disp(['Overall Accuracy: ', num2str(overall_accuracy), '%']);

% Check if the key coresponds to correct quadrant 
function quadrant = get_quadrant(row, col, matrix_size_rows, matrix_size_cols)

    if row <= matrix_size_rows / 2 && col <= matrix_size_cols / 2
        quadrant = 'q'; 
    elseif row <= matrix_size_rows / 2 && col > matrix_size_cols / 2
        quadrant = 'w';
    elseif row > matrix_size_rows / 2 && col <= matrix_size_cols / 2
        quadrant = 'a'; 
    else
        quadrant = 's'; 
    end
end

% Wait for key press inside the (fig window)
function [key, time] = waitforkeypress(fig, t_start)
    key = '';
    time = NaN; 
    
  
    set(fig, 'KeyPressFcn', @(src, event) keyPressCallback(src, event)
    while isempty(key)
        pause(0.01)
    end
    
   
    set(fig, 'KeyPressFcn', ''); 
    

    function keyPressCallback(src, event)
        key = event.Key; 
        time = toc(t_start); 
      
      
        data = get(fig, 'UserData');
        matrix_size_rows = data.matrix_size_rows;
        matrix_size_cols = data.matrix_size_cols;
        
        % Change the matrix immediately upon key press
        clf(fig); 
        new_matrix = repmat('+', matrix_size_rows, matrix_size_cols);
        text(0.5, 0.5, new_matrix, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
        axis off;
        drawnow; 
    end
end
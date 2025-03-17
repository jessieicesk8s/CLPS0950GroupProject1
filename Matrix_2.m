% Parameters
num_trials = 5; % Number of trials
matrix_size_rows = 10; % Number of rows in the matrix (10)
matrix_size_cols = 20; % Number of columns in the matrix (20)
response_keys = {'q', 'w', 'a', 's'}; % Response keys corresponding to quadrants

% Define the quadrants for the response keys
quadrants = struct('q', {1:floor(matrix_size_rows/2), 1:floor(matrix_size_cols/2)}, ...   % Top-left quadrant
                   'w', {1:floor(matrix_size_rows/2), floor(matrix_size_cols/2)+1:matrix_size_cols},...  % Top-right quadrant
                   'a', {floor(matrix_size_rows/2)+1:matrix_size_rows, 1:floor(matrix_size_cols/2)}, ...  % Bottom-left quadrant
                   's', {floor(matrix_size_rows/2)+1:matrix_size_rows, floor(matrix_size_cols/2)+1:matrix_size_cols});  % Bottom-right quadrant

% Randomize the order of the matrices for the trials
trial_order = randperm(num_trials);

% Prepare the output variables
reaction_times = zeros(num_trials, 1);
accuracies = zeros(num_trials, 1);

% Create the matrices with the target stimuli
matrices = cell(1, num_trials); % To hold the matrices
target_positions = cell(1, num_trials); % To store target positions (row, col)
for i = 1:num_trials
    matrix2 = repmat('+', matrix_size_rows, matrix_size_cols); % Create the matrix with "+"
    % Randomly choose a target location
    target_row = randi(matrix_size_rows);
    target_col = randi(matrix_size_cols);
    matrix2(target_row, target_col) = 'x'; % Place the target stimulus
    matrices{i} = matrix2; % Store the matrix
    target_positions{i} = [target_row, target_col]; % Store the target position
end

% Create a figure window for the experiment
fig = figure('Name', 'Stimulus Search', 'NumberTitle', 'off', 'MenuBar', 'none', 'ToolBar', 'none');

% Clear the figure window and begin the trials immediately
clf(fig); % Clear the figure window

% Trials for trial_idx = 1:num_trials
for trial_idx = 1:num_trials
    % Get the matrix for the current trial in the randomized order
    matrix2 = matrices{trial_order(trial_idx)};
    
    % Get the target position for this trial
    target_position = target_positions{trial_order(trial_idx)};
    target_row = target_position(1);
    target_col = target_position(2);
    
    % Clear the figure window before displaying the next matrix
    clf(fig); % Clear the figure window
    
    % Display the matrix on the figure window
    text(0.5, 0.5, matrix2, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    axis off; % Hide axes
    
    % Start timing as the matrix is displayed
    t_start = tic;  % Start the timer right as the matrix is shown
    
    % Pass matrix size to the figure using 'UserData'
    set(fig, 'UserData', struct('matrix_size_rows', matrix_size_rows, 'matrix_size_cols', matrix_size_cols));
    
    % Wait for the participant to press a key
    [key_pressed, time_pressed] = waitforkeypress(fig, t_start);
    
    % Record the reaction time (if key was pressed)
    if ~isempty(key_pressed)
        reaction_time = toc(t_start); % Time from the start of the display to key press
        reaction_times(trial_idx) = reaction_time;
        
        % Check if the key corresponds to the correct quadrant dynamically based on target position
        correct_quadrant = get_quadrant(target_row, target_col, matrix_size_rows, matrix_size_cols);
        
        accuracy = strcmpi(key_pressed, correct_quadrant);
        accuracies(trial_idx) = accuracy;
    else
        % No key pressed, do not record reaction time
        reaction_times(trial_idx) = NaN; % Use NaN to indicate no response
        accuracies(trial_idx) = 0; % No accuracy as no key was pressed
    end
    
    % Pause briefly before the next trial
    pause(0.5); % Short pause between trials
end

% Compute and display the results
mean_reaction_time = mean(reaction_times, 'omitnan'); % Compute mean, ignoring NaNs
overall_accuracy = mean(accuracies) * 100; % Convert to percentage
disp('Results:');
disp(['Mean Reaction Time: ', num2str(mean_reaction_time), ' seconds']);
disp(['Overall Accuracy: ', num2str(overall_accuracy), '%']);

% Helper function to check the quadrant based on the target location
function quadrant = get_quadrant(row, col, matrix_size_rows, matrix_size_cols)
    
    % Check which quadrant the target is located in
    if row <= matrix_size_rows / 2 && col <= matrix_size_cols / 2
        quadrant = 'q'; % Top left
    elseif row <= matrix_size_rows / 2 && col > matrix_size_cols / 2
        quadrant = 'w'; % Top right
    elseif row > matrix_size_rows / 2 && col <= matrix_size_cols / 2
        quadrant = 'a'; % Bottom left
    else
        quadrant = 's'; % Bottom right
    end
end

% Function to wait for key press inside the figure window
function [key, time] = waitforkeypress(fig, t_start)
    key = '';
    time = NaN; 
    
    % Set the figure to capture key presses
    set(fig, 'KeyPressFcn', @(src, event) keyPressCallback(src, event));
    
    % Wait indefinitely for a key press
    while isempty(key)
        pause(0.01); % Small pause
    end
    
    % Cleanup after key press
    set(fig, 'KeyPressFcn', ''); % Stop capturing keys
    
    % Nested function to handle key press event
    function keyPressCallback(src, event)
        key = event.Key; % Capture the key pressed
        time = toc(t_start); % Record the time when key was pressed
        
        % Get matrix size
        data = get(fig, 'UserData');
        matrix_size_rows = data.matrix_size_rows;
        matrix_size_cols = data.matrix_size_cols;
        
        % Change the matrix immediately upon key press
        clf(fig); % Clear the figure window
        new_matrix = repmat('+', matrix_size_rows, matrix_size_cols);
        text(0.5, 0.5, new_matrix, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
        axis off;
        drawnow; % Immediately update the figure
    end
end

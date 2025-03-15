%Have both tasks run within a singular code..?

%Participant Instructions
fig = figure('Name', 'Stimulus Search', 'NumberTitle', 'off', 'MenuBar', 'none', 'ToolBar', 'none');
instructions = sprintf(['Press the key that corresponds to the quadrant that contains the target ("X")\n\n' ...
    'Q = Top Left, W = Top Right, A = Bottom Left, S = Bottom Right\n\n' ...
    'Press any key to start the experiment.']);
text(0.5, 0.5, instructions, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off;
disp('Instructions displayed in separate window. Press any key to start.')
pause;

clf(fig); %Clear the figure window
text(0.5, 0.5, matrix_1a, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off;

%Below are Matrices 1a-1e
%Matrix 1a, Target Stimulus in Upper Left Quadrant
matrix_1a = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1a(2, 4) = 'X'; %Placing target stimulus in UL Quadrant
disp(matrix_1a)

tic; %Start timer for Matrix 1a Task
while toc < 10
    if waitforbuttonpress
        elapsed_time_a = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'q'
            is_correct_a = true;
            true = 1;
        else
            is_correct_a = false;
            false = 0;
        end
        break;
    end
end

pause(0.5);
clc;

clf(fig);
text(0.5, 0.5, matrix_1b, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off; 

%Matrix 1b, Target Stimulus in Bottom Right Quadrant
matrix_1b = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1b(8, 18) = 'X'; %Placing target stimulus in BR Quadrant
disp(matrix_1b)

tic; %Start timer for Matrix 1b Task
while toc < 10
    if waitforbuttonpress
        elapsed_time_b = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 's'
            is_correct_b = true;
            true = 1;
        else
            is_correct_b = false;
            false = 0;
        end
        break;
    end
end

pause(0.5);
clc;

clf(fig);
text(0.5, 0.5, matrix_1c, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off; 

%Matrix 1c, Target Stimulus in Upper Right Quadrant
matrix_1c = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1c(3, 16) = 'X'; %Placing target stimulus in UR Quadrant
disp(matrix_1c)

tic; %Start timer for Matrix 1c Task
while toc < 10
    if waitforbuttonpress
        elapsed_time_c = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'w'
            is_correct_c = true;
            true = 1;
        else
            is_correct_c = false;
            false = 0;
        end
        break;
    end
end

pause(0.5);
clc;

clf(fig);
text(0.5, 0.5, matrix_1d, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off; 

%Matrix 1d, Target Stimulus in Bottom Left Quadrant
matrix_1d =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1d(10, 8) = 'X'; %Placing target stimulus in BL Quadrant
disp(matrix_1d)

tic; %Start timer for Matrix 1d Task
while toc < 10
    if waitforbuttonpress
        elapsed_time_d = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'a'
            is_correct_d = true;
            true = 1;
        else
            is_correct_d = false;
            false = 0;
        end
        break;
    end
end

pause(0.5);
clc;

clf(fig);
text(0.5, 0.5, matrix_1e, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off; 

%Matrix 1e, Target Stimulus in Bottom Right Quadrant
matrix_1e =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1e(7, 15) = 'X'; %Placing target stimulus in BR Quadrant
disp(matrix_1e);

tic; %Start timer for Matrix 1e Task
while toc < 10
    if waitforbuttonpress
        elapsed_time_e = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 's'
            is_correct_e = true;
            true = 1;
        else
            is_correct_e = false;
            false = 0;
        end
        break;
    end
end

pause(0.5);
clc;
clf(fig);

%Start of Brianna's Code!
%Start of Brianna's Code!
%Start of Brianna's Code!


% Parameters
num_trials = 5; % Number of trials
matrix_size_rows = 10; % Number of rows in the matrix (10)
matrix_size_cols = 20; % Number of columns in the matrix (20)
duration = 5; % Time duration for displaying each matrix (in seconds)
response_keys = {'q', 'w', 'a', 's'}; % Response keys corresponding to quadrants

% Define the quadrants for the response keys
quadrants = struct('q', [1, 1], ...
                   'w', [1, matrix_size_cols / 2 + 1], ...
                   'a', [matrix_size_rows / 2 + 1, 1], ...
                   's', [matrix_size_rows / 2 + 1, matrix_size_cols / 2 + 1]);

% Randomize the order of the matrices for the trials
trial_order = randperm(num_trials);

% Prepare the output variables
reaction_times = zeros(num_trials, 1);
accuracies = zeros(num_trials, 1);

% Create the matrices with the target stimuli
matrices = cell(1, num_trials); % To hold the matrices
for i = 1:num_trials
    matrix = repmat('+', matrix_size_rows, matrix_size_cols); % Create the matrix with "+"
    % Randomly choose a target location
    target_row = randi(matrix_size_rows);
    target_col = randi(matrix_size_cols);
    matrix(target_row, target_col) = 'x'; % Place the target stimulus
    matrices{i} = matrix; % Store the matrix
end

% Trials
for trial_idx = 1:num_trials
    % Get the matrix for the current trial in the randomized order
    matrix = matrices{trial_order(trial_idx)};
    
    % Clear the figure window before displaying the next matrix
    clf(fig); % Clear the figure window
    
    % Display the matrix on the figure window
    text(0.5, 0.5, matrix, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    axis off; % Hide axes for a clean view of the matrix
    
    % Start timing before the matrix is displayed
    t_start = tic;  % Start the timer right before the matrix is shown
    
    % Wait for the participant to press a key or timeout
    [key_pressed, time_pressed] = waitforkeypress(duration, fig);
    
    % Record the reaction time (if key was pressed)
    if ~isempty(key_pressed)
        reaction_time = toc(t_start); % Time from the start of the display to key press
        reaction_times(trial_idx) = reaction_time;
        
        % Check if the key corresponds to the correct quadrant
        correct_quadrant = get_quadrant(target_row, target_col, matrix_size_rows, matrix_size_cols);
        accuracy = strcmpi(key_pressed, correct_quadrant); 
        accuracies(trial_idx) = accuracy;
    else
        % No key pressed, record reaction time as duration (indicating timeout)
        reaction_times(trial_idx) = duration;
        accuracies(trial_idx) = 0; % No accuracy as no key was pressed
    end
    
    % Show when trials are completed? idk if that really helps anything
    disp(['Finished Trial ', num2str(trial_idx)]);
    
    % Pause briefly before the next trial (optional)
    pause(0.5); % Short pause between trials
end

% Helper function to check the quadrant based on the target location
function quadrant = get_quadrant(row, col, matrix_size_rows, matrix_size_cols)
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

% Function to wait for key press or timeout (inside the figure window)
function [key, time] = waitforkeypress(timeout, fig)
    key = ''; % Initialize
    time = NaN;
    
    % Set the figure to capture key presses
    set(fig, 'KeyPressFcn', @(src, event) keyPressCallback(src, event));
    
    t_start = tic;
    
    while toc(t_start) < timeout
        % Wait for key press
        pause(0.01); % Small pause to allow the figure to process events
    end
    
    % Cleanup after timeout or key press
    set(fig, 'KeyPressFcn', ''); % Stop capturing keys
    
    function keyPressCallback(src, event)
        key = event.Key; % Capture the key pressed
        time = toc(t_start); % Record the time when key was pressed
    end
end

clc;
clf(fig);

%Jessica's Matrix 1 Task Results
ET = ([elapsed_time_a, elapsed_time_b, elapsed_time_c, elapsed_time_d, elapsed_time_e]);
IC = ([is_correct_a, is_correct_b, is_correct_c, is_correct_d, is_correct_e]);

mean_reactiontime = mean(ET);
overall_accuracy1 = mean(IC) * 100;

%Brianna's Matrix 2 Results
mean_reaction_time = mean(reaction_times);
overall_accuracy = mean(accuracies) * 100; % Convert to percentage


final_results = sprintf(['Matrix 1 Results\n\n' ...
    'Mean Reaction Time: ', num2str(mean_reactiontime), ' seconds\n'...
    'Overall Percent Accurate: ', num2str(overall_accuracy1), '\n\n\n' ...
    'Matrix 2 Results\n\n' ...
    'Mean Reaction Time: ', num2str(mean_reaction_time), ' seconds\n' ...
    'Overall Percent Accurate: ', num2str(overall_accuracy)]);
text(0.5, 0.5, final_results, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
axis off;
disp('Experiment is complete. Thank you for your partcipation!')
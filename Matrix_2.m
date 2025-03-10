% Parameters
num_trials = 5; % Number of trials
matrix_size = 12; % Size of the matrix (12x12)
duration = 5; % Time duration for displaying each matrix (in seconds)
response_keys = {'Q', 'W', 'A', 'S'}; % Response keys corresponding to quadrants

% Define the quadrants for the response keys
quadrants = struct('Q', [1, 1], 'W', [1, matrix_size/2 + 1], 'A', [matrix_size/2 + 1, 1], 'S', [matrix_size/2 + 1, matrix_size/2 + 1]);

% Randomize the order of the matrices for the trials
trial_order = randperm(num_trials);

% Prepare the output variables
reaction_times = zeros(num_trials, 1);
accuracies = zeros(num_trials, 1);

% Create the matrices with the target stimuli
matrices = cell(1, num_trials); % To hold the matrices

for i = 1:num_trials
    matrix = repmat('+', matrix_size, matrix_size); % Create the matrix with "+"
    
    % Randomly choose a target location
    target_row = randi(matrix_size);
    target_col = randi(matrix_size);
    matrix(target_row, target_col) = 'X'; % Place the target stimulus
    
    matrices{i} = matrix; % Store the matrix
end

% Participant Instructions (up for debate)
disp('Press the key that corresponds to the quadrant that contains the target ("X")');
disp('Q = Top left, W = Top right, A = Bottom left, S = Bottom right');
disp('Press any key to start the experiment.');
pause; % Wait for participant to be ready

% Trials
for trial_idx = 1:num_trials
    % Get the matrix for the current trial in the randomized order
    matrix = matrices{trial_order(trial_idx)};
    
    % Display the matrix
    clc; % Clear the command window to simulate the display of the matrix
    disp(matrix);
    
    % Start the timer and wait for a key press
    tic;
    [key_pressed, time_pressed] = waitforkeypress(duration);
    
    % Record the reaction time (if key was pressed)
    if ~isempty(key_pressed)
        reaction_time = toc; % Time from the start of the display to key press
        reaction_times(trial_idx) = reaction_time;
        
        % Check if the key corresponds to the correct quadrant
        correct_quadrant = get_quadrant(target_row, target_col);
        accuracy = strcmp(key_pressed, correct_quadrant);
        accuracies(trial_idx) = accuracy;
    else
        % No key pressed, record reaction time as duration (indicating timeout)
        reaction_times(trial_idx) = duration;
        accuracies(trial_idx) = 0; % No accuracy as no key was pressed
    end
    
    % Pause briefly before the next trial
    pause(0.5);
end

% Compute and display the results
mean_reaction_time = mean(reaction_times);
overall_accuracy = mean(accuracies) * 100; % Convert to percentage

disp('Results:');
disp(['Mean Reaction Time: ', num2str(mean_reaction_time), ' seconds']);
disp(['Overall Accuracy: ', num2str(overall_accuracy), '%']);

% Helper function to check the quadrant based on the target location
function quadrant = get_quadrant(row, col)
    if row <= matrix_size / 2 && col <= matrix_size / 2
        quadrant = 'Q'; % Top left
    elseif row <= matrix_size / 2 && col > matrix_size / 2
        quadrant = 'W'; % Top right
    elseif row > matrix_size / 2 && col <= matrix_size / 2
        quadrant = 'A'; % Bottom left
    else
        quadrant = 'S'; % Bottom right
    end
end

% Function to wait for key press or timeout
function [key, time] = waitforkeypress(timeout)
    key = ''; % Initialize
    time = NaN;
    t_start = tic;
    
    while toc(t_start) < timeout
        % Check if a key was pressed
        if waitforbuttonpress
            key = get(gcf, 'CurrentKey'); % Get the key that was pressed
            time = toc(t_start); % Record the time when key was pressed
            break;
        end
    end
end

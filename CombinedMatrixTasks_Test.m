%Consolidating Jessica's Matrix1 and Brianna's Matrix_2 Tasks into one cohesive experiment

%Participant Instructions for the Experiment
fig = figure('Name', 'Stimulus Search', 'NumberTitle', 'off', 'MenuBar', 'none', 'ToolBar', 'none'); %Create a figure window
instructions = sprintf(['Press the key that corresponds to the quadrant that contains the target ("X")\n\n' ...
    'Q = Top Left, W = Top Right, A = Bottom Left, S = Bottom Right\n\n' ...
    'Press any key to start the experiment.']); %Define instructions variable
text(0.5, 0.5, instructions, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display instructions in figure window
axis off;
disp('Instructions displayed in separate window. Press any key to start.')
pause; %Wait for participant to press a key to start

clc; %Clear command window
clf(fig); %Clear the figure window


%Below are Matrices 1a-1e (Jessica's Matrices)
%Matrix 1a, Target Stimulus in Upper Left Quadrant
matrix_1a = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1a(2, 4) = 'X'; %Placing target stimulus in UL Quadrant

text(0.5, 0.5, matrix_1a, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display Matrix 1a
axis off;


tic; %Start timer for Matrix 1a Task
while toc < 10 %Setting a duration of max 10 seconds
    if waitforbuttonpress %Wait for participant to press a key
        elapsed_time_a = toc; %Timer stops when key is pressed and time is recorded
        key = get(gcf, 'CurrentCharacter'); %Recognize which key is pressed
        if key == 'q' %Check if key pressed was the correct one
            is_correct_a = true;
            true = 1;
        else
            is_correct_a = false;
            false = 0;
        end
        break;
    end
end

pause(0.5); %Brief pause between matrices
clc; %Clear command window

clf(fig); %Clear figure window


%Matrix 1b, Target Stimulus in Bottom Right Quadrant
matrix_1b = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1b(8, 18) = 'X'; %Placing target stimulus in BR Quadrant

text(0.5, 0.5, matrix_1b, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display Matrix 1b
axis off; 

tic; %Start timer for Matrix 1b Task
while toc < 10 %Set duration of max 10 seconds
    if waitforbuttonpress %Wait for key to be pressed
        elapsed_time_b = toc; %Timer stops when key is pressed and time is recorded
        key = get(gcf, 'CurrentCharacter'); %Recognize which key is pressed
        if key == 's' %Check if key pressed was correct one
            is_correct_b = true;
            true = 1;
        else
            is_correct_b = false;
            false = 0;
        end
        break;
    end
end

pause(0.5); %Brief pause between matrices
clc; %Clear command window

clf(fig); %Clear figure window


%Matrix 1c, Target Stimulus in Upper Right Quadrant
matrix_1c = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1c(3, 16) = 'X'; %Placing target stimulus in UR Quadrant

text(0.5, 0.5, matrix_1c, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display Matrix 1c
axis off; 

tic; %Start timer for Matrix 1c Task
while toc < 10 %Set duration of max 10 seconds
    if waitforbuttonpress %Wait for key press from participant
        elapsed_time_c = toc; %Timer stops when key is pressed and time is recorded
        key = get(gcf, 'CurrentCharacter'); %Recognize which key is pressed
        if key == 'w' %Check if key pressed was correct one
            is_correct_c = true;
            true = 1;
        else
            is_correct_c = false;
            false = 0;
        end
        break;
    end
end

pause(0.5); %Brief pause between matrices
clc; %Clear command window

clf(fig); %Clear figure window


%Matrix 1d, Target Stimulus in Bottom Left Quadrant
matrix_1d =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1d(10, 8) = 'X'; %Placing target stimulus in BL Quadrant

text(0.5, 0.5, matrix_1d, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display Matrix 1d
axis off; 

tic; %Start timer for Matrix 1d Task
while toc < 10 %Set duration of max 10 seconds
    if waitforbuttonpress %Wait for key press
        elapsed_time_d = toc; %Timer stops when key is pressed and time is recorded
        key = get(gcf, 'CurrentCharacter'); %Recognize which key is pressed
        if key == 'a' %Check if key pressed was correct one
            is_correct_d = true;
            true = 1;
        else
            is_correct_d = false;
            false = 0;
        end
        break;
    end
end

pause(0.5); %Brief pause between matrices
clc; %Clear command window

clf(fig); %Clear figure window

%Matrix 1e, Target Stimulus in Bottom Right Quadrant
matrix_1e =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1e(7, 15) = 'X'; %Placing target stimulus in BR Quadrant

text(0.5, 0.5, matrix_1e, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display Matrix 1e
axis off; 


tic; %Start timer for Matrix 1e Task
while toc < 10 %Duration of max 10 seconds
    if waitforbuttonpress %Wait for key press
        elapsed_time_e = toc; %Timer stops when key is pressed and time is recorded
        key = get(gcf, 'CurrentCharacter'); %Recognize which key is pressed
        if key == 's' %Check if key pressed was correct
            is_correct_e = true;
            true = 1;
        else
            is_correct_e = false;
            false = 0;
        end
        break;
    end
end

pause(0.5); %Brief pause between matrices
clc; %Clear command window
clf(fig); %Clear figure window

%Start of Brianna's Edited Code
num_trials = 5; % Number of trials
matrix_size_rows = 10; % Number of rows in the matrix (10)
matrix_size_cols = 20; % Number of columns in the matrix (20)
response_keys = {'q', 'w', 'a', 's'}; % Response keys corresponding to quadrants

% Define the quadrants 
quadrants = struct('q', {1:floor(matrix_size_rows/2), 1:floor(matrix_size_cols/2)}, ...   % Top-left quadrant
                   'w', {1:floor(matrix_size_rows/2), floor(matrix_size_cols/2)+1:matrix_size_cols},...  % Top-right quadrant
                   'a', {floor(matrix_size_rows/2)+1:matrix_size_rows, 1:floor(matrix_size_cols/2)}, ...  % Bottom-left quadrant
                   's', {floor(matrix_size_rows/2)+1:matrix_size_rows, floor(matrix_size_cols/2)+1:matrix_size_cols});  % Bottom-right quadrant

% Randomize order of the matrices 
trial_order = randperm(num_trials);

% Ouput
reaction_times = zeros(num_trials, 1);
accuracies = zeros(num_trials, 1);

% Create the matrices with the target stimuli
matrices = cell(1, num_trials); 
target_positions = cell(1, num_trials); 
for i = 1:num_trials
    matrix2 = repmat('+', matrix_size_rows, matrix_size_cols); % Create the matrix with "+"
    
    target_row = randi(matrix_size_rows);
    target_col = randi(matrix_size_cols);
    matrix2(target_row, target_col) = 'x'; 
    matrices{i} = matrix2; 
    target_positions{i} = [target_row, target_col]; 
end


% Trials 
for trial_idx = 1:num_trials
    matrix2 = matrices{trial_order(trial_idx)};
    
    %Target position
    target_position = target_positions{trial_order(trial_idx)};
    target_row = target_position(1);
    target_col = target_position(2);
    

    clf(fig); 
    
    % Display matrix onf giure window
    text(0.5, 0.5, matrix2, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    axis off;
    
    % Reaction time
    start_timer = tic;
    set(fig, 'UserData', struct('matrix_size_rows', matrix_size_rows, 'matrix_size_cols', matrix_size_cols));
    
    % Wait for key press
    [key_pressed, time_pressed] = waitforkeypress(fig, start_timer);
    
    % Record reaction time (if key was pressed)
    if ~isempty(key_pressed)
        reaction_time = toc(start_timer); 
        reaction_times(trial_idx) = reaction_time;
        
        % Check if the key corresponds to correct quadrant 
        correct_quadrant = get_quadrant(target_row, target_col, matrix_size_rows, matrix_size_cols);
        
        accuracy = strcmpi(key_pressed, correct_quadrant);
        accuracies(trial_idx) = accuracy;
    else
        % Output data if no key was pressd
        reaction_times(trial_idx) = NaN;
        accuracies(trial_idx) = 0;
    end
    
    
    pause(0.5); 
end

%Reults
mean_reaction_time = mean(reaction_times, 'omitnan'); % Compute mean, ignoring NaNs
overall_accuracy = mean(accuracies) * 100; % Convert to percentage


% Check quadrant 
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

% Wait for key press (fig) 
function [key, time] = waitforkeypress(fig, t_start)
    key = '';
    time = NaN; 
    
 
    set(fig, 'KeyPressFcn', @(src, event) keyPressCallback(src, event));
    
    %=
    while isempty(key)
        pause(0.01);
    end
    
    set(fig, 'KeyPressFcn', ''); 
    
    % For any pressed key
    function keyPressCallback(src, event)
        key = event.Key; 
        time = toc(t_start)
        
       
        data = get(fig, 'UserData');
        matrix_size_rows = data.matrix_size_rows;
        matrix_size_cols = data.matrix_size_cols;
        
        % Matrix switch as soon as key is pressed
        clf(fig); 
        next_matrix = repmat('+', matrix_size_rows, matrix_size_cols);
        text(0.5, 0.5, next_matrix, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
        axis off;
        drawnow; 
    end
end


clc; 
clf(fig);

%end of Brianna's code 

%Jessica's Matrix 1 Task Results
ET = ([elapsed_time_a, elapsed_time_b, elapsed_time_c, elapsed_time_d, elapsed_time_e]); %Assign elapsed time data to variable ET
IC = ([is_correct_a, is_correct_b, is_correct_c, is_correct_d, is_correct_e]); %Assign accuracy data to variable IC

mean_reactiontime = mean(ET); %Calculate mean of previously defined ET data
overall_accuracy1 = mean(IC) * 100; %Calculate mean of previously defined IC data

%Brianna's Matrix 2 Results

% Compute and display the results
mean_reaction_time = mean(reaction_times, 'omitnan'); % Compute mean, ignoring NaNs
overall_accuracy = mean(accuracies) * 100; % Convert to percentage

%Display final results in figure window
final_results = sprintf(['Matrix 1 Results\n\n' ...
    'Mean Reaction Time: ', num2str(mean_reactiontime), ' seconds\n'...
    'Overall Percent Accurate: ', num2str(overall_accuracy1), '\n\n\n' ...
    'Matrix 2 Results\n\n' ...
    'Mean Reaction Time: ', num2str(mean_reaction_time), ' seconds\n' ...
    'Overall Percent Accurate: ', num2str(overall_accuracy)]); %Define final_results to be displayed
text(0.5, 0.5, final_results, 'FontSize', 15, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); %Display previously defined final results of experiment
axis off;
disp('Experiment is complete. Thank you for your participation!') %Display this final message for participants in the command window

save("Participant1", "mean_reactiontime", "overall_accuracy1", "mean_reaction_time", "overall_accuracy");
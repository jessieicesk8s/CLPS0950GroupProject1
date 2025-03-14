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

ET = ([elapsed_time_a, elapsed_time_b, elapsed_time_c, elapsed_time_d, elapsed_time_e]);
IC = ([is_correct_a, is_correct_b, is_correct_c, is_correct_d, is_correct_e]);

mean_reactiontime = mean(ET);
overall_accuracy = mean(IC) * 100;

disp('Results:');
disp(strcat('Mean Reaction Time:', num2str(mean_reactiontime), ' seconds'))
disp(strcat('Overall Accuracy: ', num2str(overall_accuracy), '%'))

% Participant Instructions
disp('Press the key that corresponds to the quadrant that contains the target ("X")')
disp('Q = Top Left, W = Top Right, A = Bottom Left, S = Bottom Right')
disp('Press any key to start the experiment.')
pause; % Wait for participant to be ready; any key will make code continue running

%Below are Matrices 1a-1e
%Matrix 1a, Target Stimulus in Upper Left Quadrant
%f = figure;
matrix_1a = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1a(2, 4) = 'X'; %Placing target stimulus in UL Quadrant
disp(matrix_1a)

tic; %Start timer for Matrix 1a Task
while toc < 10
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'q'
            is_correct = true;
            %true = 1;
        else
            is_correct = false;
            %false = 0;
        end
        break;
    end
end

pause(0.5);
clc;

%Matrix 1b, Target Stimulus in Bottom Right Quadrant
matrix_1b = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1b(8, 18) = 'X'; %Placing target stimulus in BR Quadrant
disp(matrix_1b)

tic; %Start timer for Matrix 1b Task
while toc < 10
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 's'
            is_correct = true;
        else
            is_correct = false;
        end
        break;
    end
end

pause(0.5);
clc;

%Matrix 1c, Target Stimulus in Upper Right Quadrant
matrix_1c = repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1c(3, 16) = 'X'; %Placing target stimulus in UR Quadrant
disp(matrix_1c)

tic; %Start timer for Matrix 1c Task
while toc < 10
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'w'
            is_correct = true;
        else
            is_correct = false;
        end
        break;
    end
end

pause(0.5);
clc;

%Matrix 1d, Target Stimulus in Bottom Left Quadrant
matrix_1d =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1d(10, 8) = 'X'; %Placing target stimulus in BL Quadrant
disp(matrix_1d)

tic; %Start timer for Matrix 1d Task
while toc < 10
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'a'
            is_correct = true;
        else
            is_correct = false;
        end
        break;
    end
end

pause(0.5);
clc;

%Matrix 1e, Target Stimulus in Bottom Right Quadrant
matrix_1e =  repmat('0', 10, 20); %Base 10x20 matrix of zeros
matrix_1e(7, 15) = 'X'; %Placing target stimulus in BR Quadrant
disp(matrix_1e)

tic; %Start timer for Matrix 1e Task
while toc < 10
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 's'
            is_correct = true;
        else
            is_correct = false;
        end
        break;
    end
end

pause(0.5);
clc;

mean_reactiontime = mean(elapsed_time);
overall_accuracy = mean(num2str(is_correct)) * 100;

disp('Results');
disp(strcat('Mean Reaction Time:', num2str(mean_reactiontime)))
disp(strcat('Overall Accuracy: ', num2str(overall_accuracy), '%'))
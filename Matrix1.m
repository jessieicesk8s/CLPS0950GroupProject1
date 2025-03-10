%Figure out way to randomize order of matrices?

%Matrix 1a, Upper Left
figure;
matrix_1a = repmat('0', 10, 20);
matrix_1a(2, 4) = 'X';
disp(matrix_1a)

tic;
elapsed_time = 0;
while toc < 5
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'q'
            is_correct = true;
            disp('Correct!')
        else 
            is_correct = false;
            disp('Incorrect.')
        end
        break;
    end
end

pause(0.5);
clc;

%Matrix 1b, Bottom Right
matrix_1b = repmat('0', 10, 20);
matrix_1b(8, 18) = 'X';
disp(matrix_1b)

elapsed_time = 5;
tic;
while toc < 5
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

%Matrix 1c, Upper Right
matrix_1c = repmat('0', 10, 20);
matrix_1c(3, 16) = 'X';
disp(matrix_1c)

elapsed_time = 5;
tic;
while toc < 5
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

%Matrix 1d, Bottom Left
matrix_1d =  repmat('0', 10, 20);
matrix_1d(10, 8) = 'X';
disp(matrix_1d)

elapsed_time = 5;
tic;
while toc < 5
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

%Matrix 1e, Bottom Right
matrix_1e =  repmat('0', 10, 20);
matrix_1e(7, 15) = 'X';
disp(matrix_1e)
%pause(5);
%clc;

elapsed_time = 5;
tic;
while toc < 5
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

mean_reactiontimes = mean(elapsed_time);
disp(mean_reactiontimes)
%disp(random order of matrices)
%Matrix 1a, Upper Left
matrix_1a = repmat('0', 10, 20);
matrix_1a(2, 4) = 'X';
disp(matrix_1a)

disp('1a')

tic;
while toc < 5
    if waitforbuttonpress
        elapsed_time = toc;
        key = get(gcf, 'CurrentCharacter');
        if key == 'q'
            is_correct = true;
        else
            is_correct = false;
        end
        break;
    end
end

%Matrix 1b, Bottom Right
matrix_1b = repmat('0', 10, 20);
matrix_1b(8, 18) = 'X';
disp(matrix_1b)

disp('1b')

%Matrix 1c, Upper Right
matrix_1c = repmat('0', 10, 20);
matrix_1c(3, 16) = 'X';
disp(matrix_1c)

disp('1c')

%Matrix 1d, Bottom Left
matrix_1d =  repmat('0', 10, 20);
matrix_1d(10, 8) = 'X';
disp(matrix_1d)

disp('1d')

%Matrix 1e, Bottom Right
matrix_1e =  repmat('0', 10, 20);
matrix_1e(7, 15) = 'X';
disp(matrix_1e)
%pause(5);
%clc;

disp('1e')
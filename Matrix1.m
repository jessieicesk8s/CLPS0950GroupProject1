%Matrix 1a, Upper Left
matrix_1a = repmat('0', 10, 20);
matrix_1a(2, 4) = 'X';
disp(matrix_1a)

disp('Next One')

%Matrix 1b, Bottom Right
matrix_1b = repmat('0', 10, 20);
matrix_1b(8, 18) = 'X';
disp(matrix_1b)

disp('Next One')

%Matrix 1c, Upper Right
matrix_1c = repmat('0', 10, 20);
matrix_1c(3, 16) = 'X';
disp(matrix_1c)

disp('Next One')

%Matrix 1d, Bottom Left
matrix_1d =  repmat('0', 10, 20);
matrix_1d(10, 8) = 'X';
disp(matrix_1d)

disp('Next One')

%Matrix 1e, Bottom Right
matrix_1e =  repmat('0', 10, 20);
matrix_1e(7, 15) = 'X';
disp(matrix_1e)
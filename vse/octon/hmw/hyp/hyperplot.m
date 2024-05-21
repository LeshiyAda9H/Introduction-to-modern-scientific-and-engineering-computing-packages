function hyperplot(A)

  val_first = sum(diag(A)) - A(4, 4);
  val_second = det(A([1 2], [1 2])) + det(A([2 3], [2 3])) + det(A([1 3], [1 3]));
  val_third = det(A(1:3, 1:3));
  val_fourth = det(A);

  eigen_val = eig(A(1:3, 1:3));
  if (val_third != 0 && (val_second <= 0 || val_first * val_third <= 0) && 0 < val_fourth)

    alfa = sqrt(abs(val_fourth / (eigen_val(1) * val_third)));
    beta = sqrt(abs(val_fourth / (eigen_val(2) * val_third)));
    gamma = sqrt(abs(val_fourth / (eigen_val(3) * val_third)));

    for i = 1:100

      A1 = 1 / alfa; B1 = - i / beta; C1 = 1 / gamma; D1 = i;
      A2 = 1 / alfa; B2 = 1 / (i * beta); C2 = - 1 / gamma; D2 = 1 / i;

      v1 = [A1, B1, C1];
      v2 = [A2, B2, C2];

      direction = cross(v1, v2);

      A = [v1; v2];
      b_1 = [-D1; -D2];

      point = pinv(A) * b_1;
      t = linspace(-10, 10, 100);

      X = point(1) + t * direction(1);
      Y = point(2) + t * direction(2);
      Z = point(3) + t * direction(3);

      plot3(X, Y, Z, 'r', 'LineWidth', 2);
      hold on;
    endfor

  endif

endfunction

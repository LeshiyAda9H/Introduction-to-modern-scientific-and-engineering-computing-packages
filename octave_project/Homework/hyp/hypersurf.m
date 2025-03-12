function hypersurf(A)

  x0 = -10;
  x1 = 10;
  xx = 100;

  y0 = -10;
  y1 = 10;
  yy = 100;

  x = linspace(x0, x1, xx);
  y = linspace(y0, y1, yy);

  [X, Y] = meshgrid(x, y);

  val_first = sum(diag(A)) - A(4, 4);
  val_second = det(A([1 2], [1 2])) + det(A([2 3], [2 3])) + det(A([1 3], [1 3]));
  val_third = det(A(1:3, 1:3));
  val_fourth = det(A);

  if (val_third != 0 && (val_second <= 0 || val_first * val_third <= 0) && 0 < val_fourth)
    eigen_val = eig(A(1:3, 1:3));
    Z_POS = sqrt(abs((-val_fourth / val_third) - eigen_val(1) * X.^2 - eigen_val(2) * Y.^2) / eigen_val(3));
    Z_NEG = - Z_POS;

    surf(X, Y, Z_POS);
    hold on;
    surf(X, Y, Z_NEG);

  endif


endfunction

function res = comp(a, b)
  res = abs(a) < abs(b);
endfunction

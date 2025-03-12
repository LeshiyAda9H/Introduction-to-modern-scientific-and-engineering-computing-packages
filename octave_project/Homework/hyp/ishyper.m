function res = ishyper(A)

  val_first = sum(diag(A)) - A(4, 4);

  val_second = det(A([1 2], [1 2])) + det(A([2 3], [2 3])) + det(A([1 3], [1 3]));

  val_third = det(A(1:3, 1:3));

  val_fourth = det(A);

  res = false;


  if ((val_third != 0 && (val_first * val_third <= 0 || val_second <= 0) && val_fourth > 0) || (val_third == 0 && val_fourth > 0))
    res = true;

  else
    res = false;
  endif

endfunction

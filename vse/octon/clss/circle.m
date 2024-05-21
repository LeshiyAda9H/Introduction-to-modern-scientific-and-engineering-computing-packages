function matr = circle(n, r)
  matr = false(n, n);
  disp(n * n / 2 + n / 2)
  for i = 1:n
    for j = 1:n
      if sqrt((i-(n + 1) /2)^2 + (j-(n + 1)/2)^2) < r
        matr(i, j) = true
      end
    end
  end
end

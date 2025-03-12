function matr = random_matr(n, min, max)
  for i = 1:n
    for j = 1:n
      matr(i, j) = randi([min, max])
    end
  end
end

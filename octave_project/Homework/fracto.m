x = -10:0.1:10;
f = @(x) x.^3 - 1;
plot(x, f(x))
hold on
# FZERO METHOD
##for i = -5:0.1:5
##  ans = fzero(f, i)
##  plot(ans, 0, 'o', 'color', 'm')
##end

# BIN SEARCH METHOD
##roots = []
##eps = 1e-6
##for i = -5:0.05:(5 - 0.05)
##  left = i
##  right = i + 0.05
##  while left < right
##    middle = (left + right) / 2;
##    if abs(f(middle)) < eps
##      roots = [roots middle]
##      break
##    elseif f(middle) < 0
##      left = middle + eps*0.01
##    else
##      right = middle - eps*0.01
##    end
##  end
##end
##
##plot(roots, zeros(size(roots)), 'o', 'color', 'm')

#NEWTON METHOD
C = [1 0 0; 0 1 0; 0 0 1]
colormap(C)
eps = 1e-12
r = []
iter = 40;
df = @(x) 3*x.^2
for real_i = -2:0.1:2
  for image_i = -2:0.1:2
    x0 = complex(real_i, image_i)
    x = x0 - f(x0) / df(x0)
    count = 0
    while abs(x - x0) > eps && count < iter
      x0 = x
      x = x0 - f(x0) / df(x0)
      count++
    end
    if real(x) >= -2 && real(x) <= 2 && count < iter
      image(x0)
    end
  end
end

hold off

f = @(x) x.^3 - 1;
x = -10:0.1:10;
p = [1 0 0 -1];
rooter = roots(p)

##plot(x, f(x));
eps = 1e-4;

roots_x = [];
a = -2;
b = 2;
step = 1;
M1 = zeros((b - a)/step);

for i = a:step:b
  for j = a:step:b
    fdif = 2*(i + 1i * j)^2 - 1
    xprev = i + 1i*j;
    xn = i + 1i * j - (f(i + 1i * j) / fdif)
    REAL = real(xn);
    COMP = imag(xn);
    iter = 0;
    
    while (abs(xn - xprev) > eps && iter < 40)
        xprev = xn;
        fdif = 2 * xn ^2 - 1;
        xn = xn - (f(xn) / fdif);
        iter += 1;
    end
        abs(xn - rooter(1))
    if (abs(xn - rooter(1)) == 0)
        M1(i + 3, j + 3) = 1;
    elseif (abs(xn - rooter(2)) < 0.1)
        M1(i + 3, j + 3) = 2; 
    elseif (abs(xn - rooter(3)) < 0.1)
        M1(i + 3, j + 3) = 3;
    else
        M1(i + 3, j + 3) = 4;
    end
   
    roots_x = [roots_x, xn];
  end
end
CM = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
colormap(CM);
figure;
imag(M1);
res = unique(roots_x);
##plot(res, f(res), 'ro');
##11

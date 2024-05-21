[X, Y] = meshgrid(-pi:0.1:pi, -pi:0.1:pi);
Z = 20 - X.*X - Y.*Y;

surf(X, Y, Z);
hold on

t = linspace(0,1);

fx = 1;
fy = 1;

x0 = 0;
y0 = -1;

x = x0 + fx*t;
y = y0 + fy*t;

dZdX = f(2*X);
dZdY = f(2*Y);

nx = -dZdX(x);
ny = -dZdY(y);
nz = 1;

n = [nx; ny; nz] ./ sqrt(nx.^2 + ny.^2 + nz.^2);

plot3(n(1), n(2), n(3))

hold off


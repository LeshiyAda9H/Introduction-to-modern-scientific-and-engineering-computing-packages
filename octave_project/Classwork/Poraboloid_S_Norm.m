clear
x = -pi:0.01:pi
y = -pi:0.01:pi
[X,Y] = meshgrid(x,y);
Z = 20 .- X.^2 .- Y.^2;
surf(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');
shading interp;
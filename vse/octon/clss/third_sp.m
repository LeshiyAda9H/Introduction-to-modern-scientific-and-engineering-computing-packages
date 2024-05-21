##t = 0:0.05:9*pi;
##x = 2*sin(t);
##y = 3*cos(t);
##plot3(x,y,t);
##grid on
##hold on
##xlabel('x')
##ylabel('y')
##zlabel('z')
##k = 1:5;
##z = 1:5;
## hold off


##clear
##[x, y] = meshgrid(-5:0.5:5, -5:0.5:5);
##plot(x, y);

x = -10:0.9:10;
y = -10:0.9:10;
[X, Y] = meshgrid(x, y);
Z = sin(sqrt(X.^2 + Y.^2)) ./ sqrt((X.^2+Y.^2))
# subplot(1,3,1)
#contour(X, Y, Z)
# surf(X,Y,Z)
# surfc(X,Y,Z)
# mesh(X,Y,Z)
surf(X, Y, Z);
#colorbar
colormap('summer')
# hidden off
shading flat

##subplot(1,3,2)
##surf(X, Y, Z)
##shading faceted
##
##subplot(1,3,3)
##surf(X, Y, Z)
##shading interp






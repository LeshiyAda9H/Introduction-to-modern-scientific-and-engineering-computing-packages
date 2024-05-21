clear
theta = -pi:0,01:pi;
rho(1,:) = 2*sin(5*theta).^2;
rho(2,:) = cos(10*theta).^3;
rho(3,:) = sin(theta).^2;
rho(4,:) = 5* cos(3.5*theta).^3
for i = 1:4
    polar(theta, rho(i,:))
    pause(2)
    
end
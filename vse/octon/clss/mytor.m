[phi, ksi] = meshgrid(0:0.1:2.1*pi, -pi:0.1:pi);
R = 5
r = 2
##x = (R + r.*cos(ksi)) .* cos(phi);
##y = (R + r.*cos(ksi)) .* sin(phi);
##z = r.*sin(ksi);

x = (R + r.*cos(ksi)) .* cos(phi) + (R + r.*cos(phi)) .* cos(ksi) + (R + r.*cos(ksi)) .* cos(phi);
y = (R + r.*cos(ksi)) .*sin(phi) + (R + r.*cos(phi)) .*sin(ksi) + (R + r.*cos(ksi)) .* sin(phi);
z = r.*sin(phi) + r.*sin(ksi) + r.*sin(phi);


surf(x,y,z);

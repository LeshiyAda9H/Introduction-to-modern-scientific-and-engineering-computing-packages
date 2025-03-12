R = 8;
theta = linspace(0, 2*pi, 100);
xlabel('x')
ylabel('y')
circles = [];
for i = -150:8:150
    x = i + R*cos(theta);
    y = sin(i) + R*sin(theta);
    c = plot(x, y, 'LineWidth', 2);
    circles = [circles c];
    if length(circles) > 5
        delete(circles(1));
        #circles(1) = [];
    end
    drawnow;
    axis([-150 150 -40 40]);
    pause(0.5);
end


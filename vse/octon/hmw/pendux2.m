function doublependulum(theta1, theta2, L1, L2, dt, duration)
    
    if(exist("theta1")==0)
      theta1=45;
    
    end
    
    if(exist("theta2")==0)
      theta2=-30;
    end
    
    if(exist("L1")==0)
      L1=1;
    end
    
    if(exist("L2")==0)
      L2=1;
    end
    
    if(exist("dt")==0)
      dt=0.01;
    end
    
    if(exist("duration")==0)
      duration=30;
    end

    theta1 = deg2rad(theta1);
    theta2 = deg2rad(theta2);

    t = 0:dt:duration;

    x1 = zeros(size(t));
    y1 = zeros(size(t));
    x2 = zeros(size(t));
    y2 = zeros(size(t));

    x1(1) = L1*sin(theta1(1));
    y1(1) = -L1*cos(theta1(1));
    x2(1) = L1*sin(theta1(1)) + L2*sin(theta2(1));
    y2(1) = -L1*cos(theta1(1)) - L2*cos(theta2(1));

    figure;


    for i = 2:length(t)
      
        alpha1 = doublePendulumAlpha1(theta1(i-1), theta2(i-1), 0, 0, L1, L2);
        alpha2 = doublePendulumAlpha2(theta1(i-1), theta2(i-1), 0, 0, L1, L2);

        theta1(i) = theta1(i-1) + dt * doublePendulumOmega1(theta1(i-1),theta2(i-1), L1, L2, alpha1, alpha2);
        theta2(i) = theta2(i-1) + dt * doublePendulumOmega2(theta1(i-1), theta2(i-1), L1, L2, alpha1, alpha2);

        x1(i) = L1*sin(theta1(i));
        y1(i) = -L1*cos(theta1(i));
        x2(i) = L1*sin(theta1(i)) + L2*sin(theta2(i));
        y2(i) = -L1*cos(theta1(i)) - L2*cos(theta2(i));

        plot([0, x1(i)], [0, y1(i)], 'b', 'LineWidth', 2);
        hold on;
        plot([x1(i), x2(i)], [y1(i), y2(i)], 'r', 'LineWidth', 2);
        hold off;

        axis([-1.5*(L1+L2), 1.5*(L1+L2), -1.5*(L1+L2), 0]);

        title('Double Pendulum Animation');
        xlabel('x');
        ylabel('y');

        pause(dt);
    endfor
endfunction

function alpha1 = doublePendulumAlpha1(theta1, theta2, omega1, omega2, L1, L2)
    m1 = 1;
    m2 = 1; 
    g = 9.8; 

    num1 = -g * (2 * m1 + m2) * sin(theta1);
    num2 = -m2 * g * sin(theta1 - 2 * theta2);
    num3 = -2 * sin(theta1 - theta2) * m2;
    num4 = omega2^2 * L2 + omega1^2 * L1 * cos(theta1 - theta2);
    den = L1 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2));

    alpha1 = (num1 + num2 + num3 * num4) / den;
endfunction

function alpha2 = doublePendulumAlpha2(theta1, theta2, omega1, omega2, L1, L2)
    m1 = 1; 
    m2 = 1; 
    g = 9.8; 

    num1 = 2 * sin(theta1 - theta2);
    num2 = (omega1^2 * L1 * (m1 + m2)) + g * (m1 + m2) * cos(theta1);
    num3 = omega2^2 * L2 * m2 * cos(theta1 - theta2);
    den = L2 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2));

    alpha2 = (num1 * (num2 + num3)) / den;
endfunction

function omega1 = doublePendulumOmega1(theta1, theta2, L1, L2, alpha1, alpha2)
    omega1 = L2 * (alpha1 * cos(theta1 - theta2) - alpha2) / L1;
endfunction

function omega2 = doublePendulumOmega2(theta1, theta2, L1, L2, alpha1, alpha2)
    omega2 = (alpha2 * L1 * cos(theta1 - theta2) - alpha1 * L2) / L2;
endfunction

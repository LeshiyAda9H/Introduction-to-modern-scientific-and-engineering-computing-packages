function B = tangenta(fd, dmin, dmax, n)


    p = linspace(dmin, dmax, 2*n+1);
    pointCurve = fd(p);
    pContact = p(n+1);

    h = 1e-8;
    ts = [pContact, pContact+h];
    val_of_deriv = diffi(fd,ts, h);

    k = val_of_deriv(2)/val_of_deriv(1);

    coord = num2cell(fd(p(n+1)));
    [x_0, y_0] = coord{:};

    b = -k * x_0 + y_0;
    syms x_s y_s;

    g = @(x) k*x + b;
    g_syms = k * x_s + b - y_s;

    fy_min = min(pointCurve(2,:));
    fy_max = max(pointCurve(2,:));
    fx_min = min(pointCurve(1,:));
    fx_max = max(pointCurve(1,:));

    figure()
    hold on

    axis([fx_min, fx_max, fy_min, fy_max]);

    set(gca, 'LineWidth', 2);
    plot(pointCurve(1,:), pointCurve(2,:))

    if abs(k) == inf
        t_vec = ones(1, 10) *x_0;
        plot(t_vec, linspace(fy_min,fy_max,10));

    elseif abs(k) == 0
        t_vec = ones(1, 10) * y_0;
        plot(linspace(fx_min, fx_max, 10), t_vec);

    else
        gy_min = subs(g_syms, y_s, fy_min);
        gy_max = subs(g_syms, y_s, fy_max);

        xTang_min = single(solve(gy_min, x_s));
        xTang_max = single(solve(gy_max, x_s));

        gxTang_min = g(xTang_min);
        gxTang_max = g(xTang_max);
        ex = sort([fx_min, xTang_min, xTang_max, fx_max]);
        start = ex(2);
        finish = ex(3);

        xTagn = linspace(start, x_0);
        xTagn = [xTagn(1:end-1), linspace(x_0, finish, 10)];
        plot(xTagn, g(xTagn))
    endif

grid on;

hold off

endfunction


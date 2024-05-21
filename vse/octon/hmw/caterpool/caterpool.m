function retval = caterpool (n, fun, x0, xf, R)

    list = []
    h = 1e-8

    prevX = x0 * ones(n)
    prevY = fun(x0) * ones(n)

    t = 0:pi/50:2*pi

    x = R .* cos(t) + prevX(1)
    y = R .* sin(t) + prevY(1)

    ph = plot(x,y)

    list(1) = ph

    axis([0 50 -50 50])
    axis equal

    hold on

    count = 2

    while count <= n
        df = (fun(prevX(count - 1) + h) - fun(prevX(count - 1)))/h
        alpha = atan(df)
        alphaX = R * cos(alpha)
        alphaY = R * sin(alpha)
        prevX(count) = prevX(count - 1) + alphaX * 2
        prevY(count) = prevY(count - 1) + alphaY * 2
        count = count + 1;
        list(end + 1) = circleDrawer(prevX(count), prevY(count), R, ph)
    endwhile

    prevX
    prevY

    t = 0:pi/50:2*pi;
    pause(0.05);

    while prevX + R < xf
      for i = 1:n - 1
          x = R .* cos(t) + prevX(i + 1);
          prevX(i) = prevX(i + 1);
          y = R .* sin(t) + prevY(i + 1);
          prevY(i) = prevY(i + 1);
          set(list(i),'YDATA', y,'XDATA', x);
       drawnow
      endfor

      df = (fun(prevX(n) + h) - fun(prevX(n)))/h;

      alpha = atan(df);

      x += 2 .* R .* cos(alpha);

      prevX(n) += 2 .* R .* cos(alpha);

      y += 2 .* R .* sin(alpha);

      prevY(n) += 2 .* R .* sin(alpha);

      set(list(n),'YDATA', y,'XDATA', x);
      pause(0.05);
      drawnow
    endwhile

endfunction

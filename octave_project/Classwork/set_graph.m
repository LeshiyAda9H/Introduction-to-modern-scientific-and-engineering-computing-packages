function set_graph(s)
  t = -5:0.05:5;
  n = 8;
  m = 8;
  a = 1/10;
  b = 1/16;
  x = cos(t) - a*cos(m*t) + b*sin(n*t);
  y = sin(t) + a*sin(m*t) + b*cos(n*t);
  hold on
  grid on
  for k = 1:s
    plot(x/k, y/k, 'Color', 'g');
  end
  hold off
end

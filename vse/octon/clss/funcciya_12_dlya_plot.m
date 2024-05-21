function retval = funcciya_12_dlya_plot (s)
  a = 1./4;
  b = 1./16;
  m = 8;
  n = 8;
  hold on
  t = -5:0.05:5
  
  for k = 1:s
     x = (cos(t) - a * cos(m * t) + b * sin(n * t))/k;
     y = (sin(t) + a * sin(m * t) + b * cos(n * t))/k;
     z = k;
     plot3(x,y,z)
  endfor
  
  hold off
endfunction

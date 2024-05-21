function array = diagsn(r,c)

  rows = r;
  cols = c;

  array = zeros(rows, cols);
  num = 1;

  for i = 1:(rows+cols-1)

    if mod(i, 2) == 1
      if i <= cols
        rowBegin = 1;
        colBegin = i;
      else
        rowBegin = i - cols + 1;
        colBegin = cols;
      end

      while rowBegin <= rows && colBegin >= 1
        array(rowBegin, colBegin) = num;
        num = num + 1;
        rowBegin = rowBegin + 1;
        colBegin = colBegin - 1;
      endwhile

    else
      if i <= rows
        rowBegin = i;
        colBegin = 1;
      else
        rowBegin = rows;
        colBegin = i - rows + 1;
      end

      while rowBegin >= 1 && colBegin <= cols
        array(rowBegin, colBegin) = num;
        num = num + 1;
        rowBegin = rowBegin - 1;
        colBegin = colBegin + 1;
      endwhile
    end
  endfor

endfunction

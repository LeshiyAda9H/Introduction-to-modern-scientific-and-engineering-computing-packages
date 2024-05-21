function MA = mirrorm (A, l)

    [rows,cols] = size(A);

    a_ud = flipud(A);

    a_lr = fliplr(A);

    a_c = flipud(a_lr).'

    a_t = A.'

    A = [a_c(cols - l + 1:end, rows - l + 1:end), a_ud(rows-l+1:end, :), a_t(cols - l + 1:end, 1:l);

    a_lr(:, cols - l + 1:end), A, a_lr(:, 1:l);

    a_t(1:l, rows - l + 1:end), a_ud(1:l, :), a_c(1:l, 1:l)];

    MA = uint32(A);
endfunction

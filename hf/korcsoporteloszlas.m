     L = gallery('leslie', a, b); %létrehoz egy Leslie-mátrixot
    
    d = eig(L);
    D = eig(L, 'matrix');
    r = d(imag(d) == 0 & d > 0);
    R = NaN;

% todo: value of R
% progress:
% [vectors, values] = eig(L, 'matrix')
% V(:, imag(d) == 0 & d > 0)

function [c,d,e,f] = vectorIndexing1(x,y)
    a = y(1);
    b = y(2);
    is_in_interval = a <= x & x <= b;
    c = x(is_in_interval);
    d = mean(c);
    [val, idx] = max(c);
    e = [val, idx];
    f = length(c);
end

function [B,C,d,e]=myFunction(A)
    B = A(:, 1, :);
    B = squeeze(B);
    C = A(:, 2, :);
    C = squeeze(C);

    maxs_of_row = max(B');
    d = sum(maxs_of_row);

    mins_of_col = cummin(C);
    mins_of_col = mins_of_col(end, :);
    % or
    mins_of_col = min(C);

    e = mean(mins_of_col);
    
end

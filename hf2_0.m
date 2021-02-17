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

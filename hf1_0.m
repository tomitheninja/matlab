function [c,d,e,f,g,h,k,l,m,n,o,p]=assignment1Solution(a, b)
    c = nthroot(b, a);
    d = a^b;
    e = log(b) / log(a);
    f = 5.21 ^ ((log(nthroot(pi, 3)) / log(b)) ^ a);
    g = atan(a / b);
    h = atand(a / b);
    k = pi/2 - g;
    l = atand(b / a);
    m = primes(b^a - 1);
    n = factorial(a*b);
    o = factor(10*a*b);
    p = b^2 * pi;
end

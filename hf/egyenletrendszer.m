function [x,y,z]=gyak4_f43(a,b,c,d,e,f,g)
    %  x   y   z  =  result
    %  a   b   0  =  e
    %  c   a   b  =  f-d
    %  a   b   0  =  g+d
    A = [a, b, 0; c, a, b; 0, b, a];
    v = [e; f-d; g+d];
    xs = A\v;
    x = xs(1);
    y = xs(2);
    z = xs(3);
end

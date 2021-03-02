function [D, V, U, Vi, B] = stochastic(A)
    [V, D, U] = eig(A)
    Vi = inv(V);
    B = V*D*Vi;
end

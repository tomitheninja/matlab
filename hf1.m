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

% https://chemistry.stackexchange.com/questions/146088/how-to-interpret-this-formula-about-hydrogen-bond-energy

x_NH = x_H - x_N;
y_NH = y_H - y_N;
z_NH = z_H - z_N;
x_HO = x_O - x_H;
y_HO = y_O - y_H;
z_HO = z_O - z_H;
d_NH = sqrt(x_NH^2 + y_NH^2 + z_NH^2);
d_HO = sqrt(x_HO^2 + y_HO^2 + z_HO^2);
cos_alpha = dot([x_NH, y_NH, z_NH], [x_HO, y_HO, z_HO]) / (d_NH * d_HO);
alpha = acos(cos_alpha);
energy = (d_HO^-10 - d_HO^-12)*cos_alpha;

harom_hibas = nchoosek(1000, 3) * 0.001^3 * 0.999^997;
hanyfele = nchoosek(1000, 2);
ketto_500_888 = 1/hanyfele;
ketto_hibas = nchoosek(1000, 2) * 0.001^2 * 0.999^998;
szomszedos = 999/nchoosek(1000, 2) * ketto_hibas;

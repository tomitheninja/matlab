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

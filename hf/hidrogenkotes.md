# Hidrogénkötés

Fehérjékben a hidrogénkötés gyakran egy aminosav oxo-csoportjának \=O oxigénje, és egy másik aminosav α\-aminocsoportja (N−H) között jön létre. A kötés energiáját egyrészt az oxigén és a hidrogén közötti távolság, valamint a N\-H és a H\-Okötések által bezárt szög határozza meg.

![](\"https://lcms-files.mathworks.com/content/images/d0a1314f-69cb-4bd0-b6d6-6bc2975793e2.png\")

Írj függvényt, amelynek bemenő paraméterei rendre az O, a N és a H atomok középpontjainak térbeli koordinátái (x\_O, y\_O, z\_O, x\_N, y\_N, z\_N, x\_H, y\_H, z\_H), és amelyik kiszámolja

*   a N atom középpontjából a H atom középpontjába mutató rNH vektor koordinátáit (x\_NH, y\_NH, z\_NH),
*   a H atom középpontjából az O atom középpontjába mutató rHO vektor koordinátáit (x\_HO, y\_HO, z\_HO),
*   a N és H atom dNH távolságát (d\_NH),
*   a H és O atom dHO távolságát (d\_HO),
*   a N\-H és a H\-O kötések által bezárt \[azaz a (xNH,yNH,zNH), (xHO,yHO,zHO) vektorok által bezárt\] α szöget szöget (alpha),
*   valamint a hidrogénkötés E kötési energiáját, ha feltételezzük, hogy a kötési energiát a E\=(1d10HO−1d12HO)cosα egyszerűsített modell írja le (energy)!

https://chemistry.stackexchange.com/questions/146088/how-to-interpret-this-formula-about-hydrogen-bond-energy

```matlab
function [x_NH, y_NH, z_NH, x_HO, y_HO, z_HO, d_NH, d_HO, alpha, energy] = ...
          hidrogenkotes(x_O, y_O, z_O, x_N, y_N, z_N, x_H, y_H, z_H)
   x_NH = x_H - x_N;
   y_NH = y_H - y_N;
   z_NH = z_H - z_N;
   x_HO = x_O - x_H;
   y_HO = y_O - y_H;
   z_HO = z_O - z_H;
   d_NH = (x_NH^2 + y_NH^2 + z_NH^2)^0.5;
   d_HO = (x_HO^2 + y_HO^2 + z_HO^2)^0.5;
   alpha = acos(dot([x_NH y_NH z_NH], [x_HO y_HO z_HO]) / (d_NH * d_HO));
   energy = (d_HO^-10 - d_HO^-12) * cos(alpha);
end
```

```matlab
[x_NH, y_NH, z_NH, x_HO, y_HO, z_HO, d_NH, d_HO, alpha, energy] = ...
    hidrogenkotes(76.47, 66.71, 78.47, 77.82, 67.40, 81.14, 77.39, 66.99, 80.33)
```

# 3D feladat

Készíts egy függvényt, mely 4 bemeneti paraméterrel es 2 visszatérési értekkel rendelkezik, és ábrázolja az alábbi képlettel megadott felületet:

z\=sin(x)e−sin(x)−y2

A bemeneti paraméterek rendre az értelmezési tartomány végpontjai: \[x\_min,x\_max\] x \[y\_min,y\_max\] , a felbontás mindkét tengely mentén 0.25 legyen.

Az ábrát feliratozd megfelelően (cím 14-es betűméret, tengelyfeliratok 12-es betűméret félkövér szedéssel); jelenítsd meg a z-értékeket kódoló színskálat is. A címet LaTeX interpreter segítségével jelenítsd meg.

A visszatérési érték az ábra (abra) és a felület (sf) hivatkozása legyen.

![](https://lcms-files.mathworks.com/content/images/84c4f81e-15d2-4ebd-9980-d7c7092bd204.jpg)

```matlab
function [abra, sf] = gyak7_f71_(x_min, x_max, y_min, y_max)
    abra = figure;
    [X, Y] = meshgrid(x_min:0.25:x_max, y_min:0.25:y_max); % XY sík
    Z = sin(X) .* exp(-sin(X) - Y.^2); % z kifejezése
    sf = surf(X, Y, Z); % megjelenítés
    colorbar(); % idk
    xlabel('X koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    title('$z = \sin(x)\cdot e^{- \sin(x) - y^2}$ felulet', 'interpreter', 'latex', 'FontSize', 14);
end
```

```matlab
xmin = -10;
xmax = 5;
ymin = -3;
ymax = 3;
fig = gyak7_f71_(xmin, xmax, ymin, ymax);
%close(fig);
```

# 3D feladat 2.

Készíts egy függvényt, mely 6 bemeneti paraméterrel és 2 visszatérési értekkel rendelkezik, és ábrázolja az alábbi képlettel megadott felületet, szintvonalaival együtt:

z\=0,5sin(r)cos(r)

(Elképzelhetjük úgy is, mint egy z=f(x) függvény az y=0 síkban, amit aztán a Z-tengely körül megforgatunk.)

A bemeneti paraméterek rendre az értelmezési tartomány végpontjai: \[x\_min,x\_max\] x \[y\_min,y\_max\] , valamint az ábra nézőpont-szögei (az, el). A felbontás mindkét tengely mentén 0.02 legyen.

A visszatérési érték az ábra (abra) és a felületrajzoló visszatérési értékeként kapott hivatkozása (sfc) legyen.

Az ábrát feliratozd megfelelően (cim 14-es betűméret, tengelyfeliratok 12-es betűméret félkövér szedéssel); jelenítsd meg a z-értékeket kódoló színskálát is, valamint feliratozd a szintvonalakat, és állítsd be a nézőpontot. A címet LaTeX interpreter segítségével jelenítsd meg.

Az eredmény az alábbi ábrahoz hasonló legyen:

![](https://lcms-files.mathworks.com/content/images/a8e1a39f-9187-4dc5-9b1d-16d71e841811.jpg)

```matlab
function [abra, sfc] = gyak7_f72_(x_min, x_max, y_min, y_max, Az, El)
    abra = figure;
    [X Y] = meshgrid(x_min:0.02:x_max, y_min:0.02:y_max);
    r = (X.^2 + Y.^2) .^ 0.5;
    Z = 0.5 * sin(r) .* cos(r);
    sfc = surfc(X, Y, Z);
    title('$z = 0.5 \sin(r) \cos(r)$', 'interpreter', 'latex', 'FontSize', 14)
    xlabel('X koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    colorbar;
    view(Az, El);
end
```

```matlab
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
Az = 20;
El = 20;
gyak7_f72_(xmin, xmax, ymin, ymax, Az, El);
```

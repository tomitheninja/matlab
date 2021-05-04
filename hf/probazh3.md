# 3. Feladat (30 pont)

A feladatot megoldó függvénynek 0 bemeneti paramétere és 4 visszatérési értéke (abra, X,Y,Z) legyen.
Ábrázold az alábbi képlettel megadott felületet és kontúrjait az  intervallumon -ös felbontással!

Állítsd be a nézetet azimut = 50°, bólintás szög = 60°-ra! Add vissza a felület ,  és koordinátáit tartalmazó X, Y és Z mátrixokat, az abra változóban pedig az ábra handlerjét!
Pontozás:
X, Y és Z: 15 pont
abra: 15 pont

```matlab
function [abra, X,Y,Z] = f3_2019_pentek_0810()
    abra = figure;
    [X, Y] = meshgrid(-10:0.25:5, -3:0.25:3);
    Z = sin(X) .* exp(-sin(X)-Y.^2+3);
    hold on;
    surfc(X, Y, Z);
    view(50, 60);
    hold off;
end
```

score: 30/30

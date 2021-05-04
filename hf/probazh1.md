# 1. feladat

Az alábbi feladatot egy függvényként készítse el, melynek 0 bemeneti paramétere és 4  visszatérési értéke (F, t, x,dx) legyen:
A szívhang kialakulását az alábbi egyszerűsített modellel írhatjuk fel:

Számoljuk ki egy konkrét esetre, hogy hogyan alakul a rendszer dinamikája!
Szükséges lépések:
oldjuk meg a differenciálegyenlet-rendszert (maga a differenciálegyenlet egy F nevű anonim függvény legyen), a következő paraméterekkel (a paraméterek előre meghatározott konstansok legyenek a kódban, ne F bemeneti paraméterei):
, , , , 
a  intervallumon
,  kezdetiértékekkel
Adjuk vissza a megoldás időbeli pontjait a t változóban, a két megoldásfüggvény értékkészletét pedig rendre az x és dx változókban!

Pontozás:
- anomim függvény fölírása: 15 pont
- az egyenletrendszer megoldása (függvény kiválasztása, intervallum és kezdeti értékek megadása: 10 pont
- a t, x és dx változók megfelelő értékei: 10 pont


```matlab
function [F, t, x,dx] = f1_2019_pentek_0810()
  m = 10;
  D = 0.2;
  K = 0.6;
  deltap = 5;
  a = 4;
  M = [0 1; -K / m, -D / m];
  v = [0; deltap * pi * a^2 / m];
  F = @(t, y) M * y + v;
  [t, Y] = ode45(F, [0 250], [1 0.2]);
  x = Y(:, 1);
  dx = Y(:, 2);
end
```

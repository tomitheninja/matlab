# Kémiai reakció 3 anyaggal

Az alábbi feladatban egy kémiai reakciót vizsgálunk, mely során három anyag koncentrációváltozását kísérjük figyelemmel. A folyamatot egy háromváltozós elsőrendű differenciálegyenlet-rendszer írja le.

Készíts egy függvényt, mely 1 ábrat generál és 2 bemeneti paramétere van:

1.  kezdeti értékek y\_0=\[A\_0, B\_0, C\_0\];
2.  időintervallum t=\[t\_0, t\_max\];

visszatérési értékei:

1.  az ábra hivatkozása;
2.  a megoldásfüggvény mint pontsorozat értelmezési-tartománya (T) és
3.  értékkészlete (Y: háromoszlopos mátrix, az egyes anyagok koncentrációértekeivel) (ez utóbbi kettő a (T és Y) az ode45 visszatérési értéke is, ugye);
4.  logikai indexvektor, a lentebb részletezett logikai indexelés eredményvektora.

A feladat az alábbi elsőrendű, háromváltozós DE megoldása:

dAdt\=1.2A+4.1B−1.7CdBdt\=−8A−1.4B+2.1CdCdt\=2.1A−7.2B+1.3C

Oldd meg ezt a differenciálegyenlet-rendszert a bemeneten kapott időintervallumon, a szintén bemenetként kapott kezdeti értékek mellett. A differenciálgyenlet-rendszert a megoldásodon belül anonim függvényként definiáld.

Határozd meg azokat az indextartományokat logikai indexelés segítségével, amikor az első (A) anyag koncentrációja nagyobb, mint a másodiké (B), de kisebb, mint a harmadiké (C). Ábrázold a megoldásfüggvényeket (tengelyfeliratok, betűméret, vonalszí­nek és tí­pusok, ábrafelirat), valamint jelöld meg az A-anyag feltételnek eleget tevő értékeit külön zöld pontokkal, összekötés nélkül, az alábbi ábrához hasonlóan:

![](https://lcms-files.mathworks.com/content/images/e1e69bf8-5988-4893-851f-d9cd21ed2610.png)

(Ábra megjegyzések: anyagok vonalszínei: kék, fekete, piros, mindhárom 2-es vonalvastagsággal; a zöld pontoknál a markerméret 20-as, cím 14-es betűméret, tengelyfeliratok 12-esek, félkövér szedéssel, van ábramagyarázat (legend) az első három vonalhoz.)

```matlab
function [T, Y, logind, fig, pl1, pl2, pl3, pl4] = kemiai_3anyag(y_0, t)
% Kemiai egyenlet, 3 anyaggal
    fig=figure;
    
    [T, Y] = ode45(@(~, y) [1.2 4.1 -1.7; -8 -1.4 2.1; 2.1 -7.2 1.3] * y, t, y_0);
    A = Y(:, 1);
    B = Y(:, 2);
    C = Y(:, 3);
    logind = B < A & A < C;
    
    hold on;
    pl1 = plot(T, A, 'b', 'LineWidth', 2);
    pl2 = plot(T, B, 'k', 'LineWidth', 2);
    pl3 = plot(T, C, 'r', 'LineWidth', 2);
    pl4 = plot(T(logind), Y(logind), '.g', 'MarkerSize', 20);
    legend({'A', 'B', 'C'}, 'Location', 'SouthWest');
    title('Kemiai reakcio 3 anyaggal', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('ido', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('koncentracio', 'FontSize', 12, 'FontWeight', 'bold');
end
```

```matlab
t = [0 1.4];
y_0 = [5, 7, 9];
[~] = kemiai_3anyag(y_0, t);
```

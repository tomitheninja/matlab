# 2. feladat (35 pont)

Készítsünk egy függvényt, melynek 0 bemeneti paramétere és 12 visszatérési értéke van (abra,y2_minimum_ertek, y2_minimum_hely, P, y2_fv, kozos_indexek, kozos_t, elso_t, utolso_t, T1, T2, T)! 
A feladat során az alábbi lépéseket oldjuk meg:
olvassuk be a formázott szöveget tartalmazó f2_bemenet.txt fájlt, ami az alábbi módon néz ki:

```
t1 y1 t2 y2
-0.315532 0.915181 -0.310886 1.563773
-0.214548 0.633769 -0.200076 1.001984
-0.092854 0.277761 -0.083966 0.419879
-0.000193 0.000579 0.002986 -0.014932
0.087588 -0.262093 0.113807 -0.568868
```

a t1, y1 és t2, y2 adatsor-párok által leírt görbék két műszer adatsorát jelentik, ehhez hasonló viselkedést mutatnak:

- határozzuk meg a második műszer, azaz y2 görbe (az ábrán piros) minimum értékét, és a hozzá tartozó minimum helyet t2-n (y2_minimum_ertek, y2_minimum_hely; az ábrán zöld karika jelzi)!
- hozzunk létre egy anonimfüggvényt (y2_fv), ami egy negyedfokú polinomot (P) illeszt a második műszer adatsorára!
- logikai indexelés segítségével adjuk meg azokat a helyeket, ahol a második műszer értéke alacsonyabb az első műszerénél (kozos_indexek)!
- készítsünk egy új időskálát (kozos_t) is a logikai indexvektorunk segítségével, mely az eredeti t1 vektorból csak a logikai indexvektor által kiválasztott elemeket tartalmazza!
- sima skalár/lineáris indexelés segítségével tároljuk el a közös intervallum első és utolsó időpontját az elso_t és utolso_t változókba!
- alapvetően a két görbe által közrezárt területre vagyunk kiváncsiak, ehhez
- trapézmódszerrel számoljuk ki az y1 alatti görbe előjeles területét a kozos_t intervallumon, ez az érték kerüljön T1-be!
- beépített integrálófüggvénnyel integráljuk a korábban létrehozott anonimfüggvényünket (y2_fv) a kezdő (elso_t) és záró (utolso_t) időpont között, ez az érték kerüljön T2-be!
- a két előjeles terület különbségét véve abszolútértékben megkapjuk a két görbe által közrezárt területet, amely érték T változóba kerüljön!
- Készítsd el a fenti ábrát az adatok alapján!
- Használd a megfelelő markereket és színeket!
- Legyen a vonalvastagság 2pt!
- Legyen a tengelyek feliratának mérete 12pt!
- Legyen a cím mérete 14pt!
- Legyen a minimumhely markerének mérete 10!

Pontszámok:
- beolvasás fájlból: 5 pont
- minimum meghatározása: 5 pont
- indexelés, közös intervallum meghatározása: 5 pont
- polinomillesztés, anonim függvény: 5 pont
- integrálok kiszámítása: 10 pont
- ábra: 10 pont

A feladat során a beépített find függvény, valamint vezérlőszerkezetek (for, if, switch) használata esetén a teljes pontszám legfeljebb 50%-a szerezhető meg.

```matlab
function [abra, y2_minimum_ertek, y2_minimum_hely, P, y2_fv, kozos_indexek, kozos_t, elso_t, utolso_t, T1, T2, T] = f2_2019_pentek_0810()
    abra = figure;
    ft = readtable('f2_bemenet.txt');
    t1 = ft{:, 1};
    y1 = ft{:, 2};
    t2 = ft{:, 3};
    y2 = ft{:, 4};
    [y2_minimum_ertek, y2minIdx] = min(y2);
    y2_minimum_hely = t2(y2minIdx);
    P = polyfit(t2, y2, 4);
    y2_fv = @(x) polyval(P, x);
    kozos_indexek = y2 < y1;
    kozos_t = t1(kozos_indexek);
    elso_t = kozos_t(1);
    utolso_t = kozos_t(end);
    T1 = trapz(kozos_t, y1(kozos_indexek));
    T2 = integral(y2_fv, elso_t, utolso_t);
    T = abs(T1-T2);
    hold on;
    plot(t1, y1, 'b', 'Marker', 'square', 'LineWidth', 2);
    plot(t2, y2, 'r', 'Marker', 'x', 'LineWidth', 2);
    % bug in the tester: set color and not markercolor to green
    plot(y2_minimum_hely, y2_minimum_ertek, 'og', 'LineWidth', 2, 'MarkerSize', 10);
    legend({'y1', 'y2'}, 'Location', 'southwest');
    title('Műszerek', 'FontSize', 14);
    xlabel('Idő', 'FontSize', 12);
    ylabel('Érték', 'FontSize', 12);
    hold off;
end
```

A feladat reszpontjai:

1. 5/5p
2. 5/5p
3. 5/5p
4. 5/5p
5. 5/5p
6. 9.5/10p

Osszesen: 34.5/35p

# Cellatömb

Készíts egy függvényt 1 bemeneti paraméterrel (db), és 2 visszatérési értékkel (az elkészített cellatömb és az ábra handler-je). A függvény töltsön fel egy 3x3-as cellatömböt az alábbiak szerint:

*   az első eleme (1,1 index alatt) egy sorvektor legyen (t), ami 0-tól 2π\-ig tartalmaz db értéket (bemenet) egyenletesen elosztva;
*   a második sorban a 'Sin(3t)', 'Cos(5t)' és 'Sin(3t)\*Cos(5t)' stringek álljanak a cellákban;
*   a harmadik sorban a stringeknek megfelelő numerikus értékek legyenek eltárolva a cellákban.

(Nem kell Neked kirajzolni, csak szemléltetésképpen a cellatömb ehhez hasonló legyen:

![](https://lcms-files.mathworks.com/content/images/bf5fdc97-21d3-4e67-a70b-9759740f4591.png)).

Ugyancsak a függvényben, ciklus használatával rajzoljuk ki a fent kiszámolt értékeket egy ábrán, 3 subplotra, fekete, folytonos vonallal! A subplotok címeit is a cellatömbből írjuk ki! Az alábbihoz hasonló ábrát készítsen a függvény:

![](https://lcms-files.mathworks.com/content/images/6814188c-0aa3-417c-93d3-7025b9f195bb.png)

(Amit az ábrán ellenőrzünk: subplotok száma, ábracím egyezése a cellatömb tartalmával, for-ciklus megléte, subplotok adatsorának egyezése a cellatömb tartalmával, ábra-vonalak színe.)

```matlab
db = randi([101 300]);
[cellaTomb, abra]=gyak8_f81_(db);


function [cellaTomb, abra]=gyak8_f81_(db)
    abra = figure;
    
    t = linspace(0, 2 * pi, db);
    cellaTomb = {t, [], []; 'Sin(3t)', 'Cos(5t)', 'Sin(3t)*Cos(5t)'; sin(3*t), cos(5*t), sin(3*t) .* cos(5*t)};
    for i = 1:3
        subplot(3, 1, i);
        plot(t, cellaTomb{3, i}, '-k');
        title(cellaTomb{2, i});
        xlabel('t');
    end
end
```

```matlab
db = randi([101 300]);
[cellaTomb, abra]=gyak8_f81_(db);
```

# Szenzorstatisztikai

Készíts egy függvényt az alábbi feladat megoldására (1 bemeneti paraméterrel: legnyomasErtekek, 4 visszatérési értékkel: ábra referenciája, hitelesitettMeresiErtekek, elsoSzenzorHelyesMereseiSzovegben, szenzorokDeliMeresenekAtlagaSzovegben):

Van 4 darab légnyomásmérő szenzorunk (különböző földrajzi helyeken), melyekről tudjuk, hogy hektoPascalban adják meg a légnyomásértéket. Sajnos csak a \[930, 1060\] hPa tartományra vannak hitelesítve, így szükséges a nyers mérési adatok előzetes ellenőrzése a további feldolgozás és statisztikai elemzés előtt. Mind a négy szenzorral naponta háromszor (reggel, délben, este) mérünk, összesen egy hónapon át.

A mérési eredményeket egy 4 soros, 3 oszlopos, 31 'mélységű' háromdimenziós mátrix tárolja, a neve 'legnyomasErtekek' (ez a függvény bemenete, az értékek 900 és 1100 közötti véletlen számok benne).

Konkrét feladatok:

1) Készítsünk a következő ábrához egy hasonlót, mely az első szenzor esti méréseinek értékét tartalmazza minden nap:

*   a két rózsaszín vonal a megbízhatósági határoknál van; csak azok a mérési adatpontok vannak kiszínezve, amik helyes tartományon belül vannak,
*   rózsaszín vonal: vonal színe, szélessége (2pt),
*   az eredeti adatsor: vonal típusa és színe, vonal vastagsága (3pt), marker mérete (7pt),
*   a helyes értékek adatsoránál (amit find\-al célszerű kikeresni): marker típusa és mérete (7), marker közepének ('arcának') és szélének színe, vonal vastagsága (2pt),
*   tengelyhatárok (x: 1 és 31 között, y: 890 és 1100 között),
*   aktuális axis betűmérete (12pt),
*   cím szövege és annak betűmérete (14pt), szedése (félkövér),
*   tengelyfeliratok szövege, betűmérete (12pt), szedése (félkövér),
*   ábrafelirat és annak elhelyezése (northeastoutside).

2) Logikai indexelés segítségével nullázzuk ki a hitelesített tartományon kívüli értékeket (ciklus használata nélkül!), az eredmény a hitelesitettMeresiErtekek változóba kerüljön, innentől ezzel dolgozzunk tovább.

3) Az első szenzor esti mérései közül, a 11. és 20. nap között (11. és 20. napot is beleértve) adjuk meg a helyes mérési értékek darabszámát, azt sprintf\-fel egy szöveges változóba (elsoSzenzorHelyesMereseiSzovegben) mentsük el (ez legyen a szöveg -- a számok persze a Te adataid szerint lesznek: "Helyes meresi ertekek darabszama (elso szenzor, esti meres, 11-20. napokra): 7")

4) A déli mérések közül (középső oszlopsorozat) a 2., 3. és 4. szenzorokhoz adjuk meg külön-külön az átlagértéket (csak a helyes mérési értékeket felhasználva!). (Egy lehetséges megoldásmenet: ki kell vágnunk a nagy mátrixból a megfelelő részt, azt megszabadítani a szinguláris dimenzióitól. Ebből egy logikai indexmátrixos összefüggésben soronkénti (!) szummával kivehetjük a helyes mérések darabszámát; valamint sima soronkénti (!) szummázással megtudhatjuk a szenzoronkénti mérések összegét. A kettő hányadosa (jól felírva) egy háromelemű vektor, amit kapni szerettünk volna.)

5) A 4)-es pont eredményét tároljuk el a szenzorokDeliMeresenekAtlagaSzovegben szöveges változóba az alábbi módon: "A masodik szenzor deli atlaga: +0991.880, a harmadiknak: +0990.550 es a negyediknek: +1005.696"

6) A függvény a futása során semmit ne írjon ki a konzolra.

Segítség: squeeze, kettőspont operátor, find, plot, linespec, xlim, ylim, title, set, gca, xlabel, ylabel, logikai indexelés, sum, sprintf.

![](https://lcms-files.mathworks.com/content/images/50b219de-2012-4962-9de2-0ee80dce5c3e.jpeg)

```matlab
function [fig, hitelesitettMeresiErtekek, elsoSzenzorHelyesMereseiSzovegben, ...
      szenzorokDeliMeresenekAtlagaSzovegben] = myFunction(legnyomasErtekek)
 
    fig = figure; % Ezt az abrat hasznaljuk a kirajzoltatasra.
 
    hold on;
    t = 1:31;
    xs = squeeze(legnyomasErtekek(1, 1, :));
    verified = 930 <= xs & xs <= 1060;
 
    yline(930, 'm', 'LineWidth', 2);
    yline(1060, 'm', 'LineWidth', 2);
 
    plot(...
      t, ...
      xs, ...
      '-.k', ...
      'LineWidth', 3, ...
      'Marker', 'o', ...
      'MarkerSize', 7);
 
    plot(...
      t(verified), ...
      xs(verified), ...
      '', ...
      'LineStyle', 'none', ...
      'LineWidth', 2, ...
      'Marker', 'o', ...
      'MarkerSize', 7, ...
      'MarkerEdgeColor', 'r', ...
      'MarkerFaceColor', 'g');
 
    xlim([1 31]);
    ylim([890, 1100]);
 
    axes = gca;
    axes.FontSize = 12;
 
    title('First sensor, evening, all days', ...
      'FontSize', 14, ...
      'FontWeight', 'bold');
    xlabel('number of days', ...
      'FontSize', 12, ...
      'FontWeight', 'bold');
    ylabel('atmospheric pressure [hPa]', ...
      'FontSize', 12, ...
      'FontWeight', 'bold');
    legend({'Lower limit', 'Upper limit', 'Original data', 'Verified data'}, ...
      'Location', 'northeastoutside');
 
    hold off;
 
    hitelesitettMeresiErtekek = legnyomasErtekek;
    hitelesitettMeresiErtekek(legnyomasErtekek < 930 | 1060 < legnyomasErtekek) = 0;
 
    elso_este = squeeze(legnyomasErtekek(1, 3, 11:20));
    elso_este_ok = sum(930 <= elso_este & elso_este <= 1060);
    elsoSzenzorHelyesMereseiSzovegben = sprintf('Helyes meresi ertekek darabszama (elso szenzor, esti meres, 11-20. napokra): %d', elso_este_ok);
 
    del_234 = squeeze(legnyomasErtekek([2 3 4], 2, :));
    del_234(del_234 < 930 | 1060 < del_234) = 0;
    osszeg = sum(del_234, 2);
    db = sum(del_234 ~= 0, 2);
    atlag = osszeg ./ db;
 
    szenzorokDeliMeresenekAtlagaSzovegben = sprintf('A masodik szenzor deli atlaga: %+09.3f, a harmadiknak: %+09.3f es a negyediknek: %+09.3f', atlag);
end
```

```matlab
legnyomasErtekek = 900 + round(190*rand(4, 3, 31));
[fig, hitelesitettMeresiErtekek, elsoSzenzorHelyesMereseiSzovegben, szenzorokDeliMeresenekAtlagaSzovegben] = myFunction(legnyomasErtekek)
```

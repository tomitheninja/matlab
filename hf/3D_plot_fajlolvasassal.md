# 3D plot fajlolvasassal

A feladat soran egy fajlbol beolvasott adatok alapjan 3D plotot kell elkesziteni, amely abranak bizonyos adatait egy strukturaban el kell tarolnod. A fuggveny amit keszitesz rendelkezik

*   1 bemeneti parameterrel --- egy fajlnev (bemenetiFajlNev),
*   2 visszateresi ertekkel --- abra-referencia + a kesobbiekben reszletezett struktura.

Feladatok:

*   nyisd meg a parameterkent kapott szovegfajlt (ha MATLAB-ban dolgozol, a bemenetkent hasznalt 84.text fajlt megtalalod a wiki-n, a csatolmanyok kozott);
*   olvasd be (formazott szoveg olvasasa) belole a benne talalhato elso 6 lebegopontos szamot, melyek megmondjak a szukseges meshgridhez az adatokat (ezek rendre xmin, xlepes, xmax, ymin, ylepes, ymax);
*   olvasd be az osszes tobbi szamot is (szinten lebegopontosak), melyek egy felulet pontjait adjak vissza (javaslat: 21 soros, "ismeretlen" oszlopszamu matrixba olvasd be, azaz az olvasasi meretnel \[21, Inf\]);
*   zard be a fajlt;
*   a beolvasott adatokat es a majdani tengelyfeliratokat egy strukturaban tarold le, es ezt hasznald az abrazolasnal, lehetoleg a strukturad az alabbi mezonevekkel rendelkezzen: meshgridpoints, zdata, cim, xfelirat, yfelirat, zfelirat;
*   az abran szerepeljen: 3D pontfelho (stilus: zold "pont" marker) es feliratos 3D konturvonalak szinskalaval (contour3 + clabel + colorbar), tengelyfeliratok 12-es meretben felkoveren, abracim 14-es meretben, a latoszoget allitsd \[-41, 28\] azimuth es elevation szogekre;
*   az elkeszitett strukturadat mentsd el binaris matlab archivumkent az alabbi neven: "gyak8\_f84\_kimenet.mat" (valamint ugyelj, hogy a strukturad neve megegyezzen a fuggvenyed 2. visszateresi ertekevel).

Ehhez hasonlo abrat kellene kapnod:

![](https://lcms-files.mathworks.com/content/images/c449ff60-993b-4c69-ba01-1d574b5d5262.png)

```matlab
function [abra, feluletStruktura] = f84_(bemenetiFajlNev)
    abra = figure;
    % a sturkturadnal lehetoleg az alabbi mezoneveket hasznald:
    % - meshgridpoints - a bemeneti fajlbol beolvasott elso 6 szam, ami a meshgrid parametereit jelenti
    % - zdata - a bemeneti fajlbol beolvasott tobbi szam, ami a terbeli feluleted magassagi pontjait jelenti
    % - cim, xfelirat, yfelirat, zfelirat - stringek, amiket majd a 3D abrad feliratozasanal hasznalj
    %pl: feluletStruktura.meshgridpoints = ...
    fIn = fopen(bemenetiFajlNev, 'r');
    header = fscanf(fIn, '%f', [6]);
    xPlate = header(1):header(2):header(3);
    yPlate = header(4):header(5):header(6);
    [X, Y] = meshgrid(xPlate, yPlate);
    Z = fscanf(fIn, '%f', [21 inf]);
    fclose(fIn);
    
    feluletStruktura = struct( ...
        'meshgridpoints', header, ...
        'zdata', Z, ...
        'cim', 'a betoltott adatpoint-felho', ...
        'xfelirat', 'x', ...
        'yfelirat', 'y', ...
        'zfelirat', 'z' ...
    );
    
    hold on;
    plot3(X, Y, feluletStruktura.zdata, '.g');
    [C, h] = contour3(X, Y, feluletStruktura.zdata);
    clabel(C, h);
    colorbar;
    view(-41, 28);
    grid on;
    title(feluletStruktura.cim, 'FontSize', 14);
    xlabel(feluletStruktura.xfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    ylabel(feluletStruktura.yfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    zlabel(feluletStruktura.zfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    hold off;
    
    save('gyak8_f84_kimenet.mat', 'feluletStruktura');
end
```
```matlab
bemenetiFajlNev =  '84.text';
[abra, feluletStruktura] = f84_(bemenetiFajlNev);
feluletStruktura
```

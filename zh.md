# 2021/ZH 1/I.

Olvasd be az adatfajl.xlsx, a sorfajl.xlsx és az oszlopfajl.xlsx fájlok tartalmát, és tedd az adatokat rendre az adat nevű, táblázat típusú változóba, valamint a sorok és az oszlopok nevű változóba! (Figyelj rá, hogy adatfajl, sorfajl, ill. oszlopfajl nem maguk a fájlnevek, hanem változók, amelyek a fájlneveket – kiterjesztés nélkül – tartalmazzák!)

```matlab
function [adat] = f_1_1(adatfajl)
  adat = readtable(adatfajl);
end

function [sorok] = f_1_2(sorfajl)
  sorok = readtable(sorfajl);
end

function [oszlopok] = f_1_3(oszlopfajl)
  oszlopok = readtable(oszlopfajl);
end
```

Az első ábra egy példa adatfájl, a második pedig egy példa sor-, ill. oszlopfájl első néhány sorát mutatja. Add meg azoknak a soroknak az indexeit, ahol a sorok táblázat f és g oszlopában legalább egy, de nem minden érték kisebb, mint 7 (sorindex változó)! 

`xor`: a kettőből pontosan egy igaz

```matlab
function [sorindex] = f_1_4(sorok)
  sorindex = find(xor(sorok.f < 7, sorok.g < 7));
% vagy:
% sorindex = find((sorok.f < 7) ~= (sorok.g < 7));
end
```

Add meg azoknak a soroknak az indexeit, ahol az oszlopok táblázat utolsó három oszlopában minden érték benne van a {'van', 'nem kell'} halmazban (oszlopindex változó)!

```matlab
% nulla pont
function [oszlopindex] = f_1_5(oszlopok)
  oszlopindex = find( ...
      (constains(oszlopok.i, {'van'}) | contains(oszlopok.i, {'nem kell'})) ...
      & (constains(oszlopok.j, {'van'}) | contains(oszlopok.j, {'nem kell'})) ...
      & (constains(oszlopok.k, {'van'}) | contains(oszlopok.k, {'nem kell'})) ...
      );
end
```

Hozz létre egy mátrixot adat sorindex által meghatározott sorait (azokat a sorokat, amelyeknek indexe benne van sorindex|ben), és |oszlopindex által meghatározott oszlopait (azokat az oszlopokat, amelyeknek indexe benne van oszlopindex|ben) tartalmazó résztáblázatból (|adatmatrix változó)!

```matlab
function [adatmatrix] = f_1_6(adat, sorindex, oszlopindex)
  table = adat(sorindex, oszlopindex);
  adatmatrix = table{:, :};
end
```

Oldd meg a `x * A^T = v` lineáris egyenletrendszert, ahol az adatmatrix mátrix,  a v vektor megfelelő alakja,  pedig a megoldásvektor! A megoldásvektort írd az x változóba!

```matlab
¯\_(ツ)_/¯
```

Számítsd ki adatmatrix transzponáltjának sajátértékeit oszlopvektor alakban (sajatertek) és jobb oldali sajátvektorait sajatvektor, és add meg a legkisebb valós sajátértékhez tartozó jobb oldali sajátvektort (leg változó)!

```matlab
function [sajatertek, sajatvektor] = f_1_8(adatmatrix)
  sajatertek = eig(adatmatrix');
  [V, D] = eig(adatmatrix');
  sajatvektor = V;
end
```

Számold ki adatmatrix minden elemére az  függvény értékét, és az eredményt írd az elemenkent változóba!

```matlab
% jó de nulla pontot kaptam rá
function [elemenkent] = f_1_10(adatmatrix)
  elemenkent = sin(adatmatrix) .* cos(adatmatrix);
end
```

Hozd létre az `[a_{11}u_1, a_{12}u_2, a_{13}u_3; a_{21}u_1, a_{22}u_2, a_{23}u_3; a_{31}u_1, a_{32}u_2, a_{33}u_3]` mátrixot, ahol `A = {A_{ij}}`  az adatmatrix mátrix,  pedig az u vektor, és az eredményt írd a szorzat változóba! 

```matlab
function [szorzat] = f_1_11(adatmatrix, u)
  szorzat = adatmatrix .* u;
end
```

Mentsd ki az adat változó utolsó három oszlopa és a kettővel és hárommal osztható sorszámú (itt logikai indexelést várunk) sora által meghatározott részmátrixot bin formátumban. A fájlnév legyen fajlnev.bin! 
```matlab
% nulla pont, nem ellenőriztem
function f_1_12(adat, fajlnev)
fOut = fopen(fajlnev, 'w');
A = adat{:,:};
disp(A);
s = size(adat);
i1 = 2:2:s(1);
i2 = 3:3:s(1);
i3 = s(1)-3:s(1);
idx = unique([i1, i2, i3]);
fwrite(fOut, A(:, idx), 'double');
fclose(fOut);
end
```

# 2021/ZH 1/II.

Hozz létre egy (x) vektort a(z) [0.0, 14.5] intervallumon 0.055 lépésközzel. Készíts el három vektort (f1, f2, f3) a ,  és  függvények alapján!
Hozz létre egy figure-t, három egymás melletti alábrával.
Hozd létre az első alábrát (p1) és rajzold ki az f1 függvényt x függvényében szaggatott vonallal, x markerrel és magenta színnel. A vonal szélessége legyen 1.5. Az alábra -tengelyére -et, -tengelyére pedig a függvényt írd ki. Használj tizedespontot! A szorzást külön ne írd ki a feliratban és a függvény neve ne legyen dőlt betű. Mindkét esetben használj LaTeX interpretert!
Hozd létre a második alábrát (p2). Az alábrák sorendjét sorfolytonosan értjük! Rajzold ki az f2 függvényt x függvényében szaggatott-pontozott vonallal, rombusz (gyémánt) markerrel és piros színnel. A vonal szélessége legyen 1.2. Az alábra -tengelyére -et, -tengelyére pedig a függvényt írd ki. Használj tizedespontot!A szorzást külön ne írd ki a feliratban és a függvény neve ne legyen dőlt betű. Mindkét esetben használj LaTeX interpretert!
Hozd létre a harmadik alábrát (p3) és rajzold ki az összes függvényt x függvényében. Figyelj a plotok sorrendjére, legyenek rendre f1, f2, f3 (mint a mellékelt ábrán)! Az f3 függvényt pontozott vonallal, négyzet markerrel és zöld színnel ábrázold, f1-et és f2-t pedig az előző alábráknak megfelelően! A vonal szélessége legyen 1.3. Az alábra  tengelyére -et,  tengelyére pedig -t írj ki! Mindkét esetben használj LaTeX interpretert!
Adj jelmagyarázatot a harmadik plothoz, , ,  hivatkozásokkal. A függvények sorszámai legyenek alsó indexben. A legend tájolása legyen É-i elhelyezkedésű. Használj LaTeX interpretert! Szorzásjelet a \cdot kifejezéssel lehet írni.

```matlab
function [x, f1, f2, f3] =  f_2_1()
  x = 0:0.055:14.5;
  f1 = sin(8*x);
  f2 = 0.5 * cos(9.5 * x);
  f3 = f1 .* f2;
end

function [abra, p1, p2, p3] = f_2_2(x, f1, f2, f3)
  abra = figure;
  subplot(1, 3, [1]);
  p1 = plot(x, f1, '--m', 'Marker', 'x', 'LineWidth', 1.5);
  xlabel('$x$', 'Interpreter', 'latex');
  ylabel('$1.0sin(8.0x)$', 'Interpreter', 'latex');
  subplot(1, 3, [2]);
  p2 = plot(x, f2, '.-r', 'Marker', 'diamond', 'LineWidth', 1.2);
  xlabel('$x$', 'Interpreter', 'latex');
  ylabel('$0.5sin(9.5x)$', 'Interpreter', 'latex');
  subplot(1, 3, [3]);
  p3 = plot( ...
      x, f1, '--m', ...
      x, f2, '.-r', ...
      x, f3, ':g');
  p3(1).Marker = 'x';
  p3(1).LineWidth = 1.5;
  p3(2).Marker = 'diamond';
  p3(2).LineWidth = 1.2;
  p3(3).Marker = 'square';
  p3(3).LineWidth = 1.3;
  xlabel('$x$', 'Interpreter', 'latex');
  ylabel('$y$', 'Interpreter', 'latex');
  legend({'$f_1$', '$f_2$', '$f_3 = f_1\cdot f_2$'}, 'Location', 'north', 'Interpreter', 'latex');
end
```

# 2021/ZH 1/III.

Az első függvényben:
olvasd be a pointCloud4.mat fájlból az x, y és z változókat! Ábrázold a pontfelhőt kék színnel és pont markerrel! Állítsd be a nézőpontot a következőképpen: azimuth=178 és elevation=33!
A második függvényben:
hozz létre egy térhálót ,  irányban a [-4.6, 5.2] intervallumon! A lépésköz legyen 0.6. (X és Y)
A térháló minden pontjához rendeld hozzá a következő (Z) függvényt: 
Az így létrejött függvényt ábrázold a meshc függvénnyel!
Az xlimet és ylimet állítsd be -4.5 és 5.1 értékekre!
A tengelyekre írd fel a tengely nevét (x, y, z), a plot címe pedig legyen a z függvény. Használj tizedespontot! A szorzásokat ne írd ki, a függvények pedig egyenes betűvel legyenek szedve. Használj latex interpretert (csak a címhez)!

```matlab
function [abra1, x, y, z] = f_3_1()
  load('pointCloud4.mat', 'x', 'y', 'z');
  abra1 = figure;
  plot3(x, y, z, '.b');
  view(178, 33);
end

function [abra2, X, Y, Z] = f_3_2()
  abra2 = figure;
  [X, Y] = meshgrid(-4.6:0.6:5.2, -4.6:0.6:5.2);
  Z = 1.3 * sin(X) .* cos(Y);
  meshc(X, Y, Z);
  xlim([-4.5 5.1]);
  ylim([-4.5 5.1]);
  xlabel('x'); 
  ylabel('y');
  zlabel('z');
  title('$1.3\sin(x)\cos(y)$', 'Interpreter', 'latex');
end
```

# 2021/ZH 1/IV.

Oldd meg beépített megoldófüggvény segítségével az alábbi differenciálegyenlet-rendszert: , , . A megoldás időintervalluma: [0 70] A változók kezdeti értékei: , , . A kimeneteket a t (időpontok) és az x (megoldások) nevű változókba mentsd el!

```matlab
function [t, x] = f_4_1()
  f = @(~, y) [9*y(1)/2 + y(3); (3*y(1) - y(3))/4; -y(2)];
  [t, x] = ode45(f, [0 70], [100 10 1/10]);
end
```

# 2020/???/I.

```matlab
function [adat] = f_1_1(adatfajl)
    adat = readtable('_adat.csv', 'Delimiter', ',');
end

function [sorok] = f_1_2(sorfajl)
    sorok = readtable('M_sorok.xlsx', "ReadVariableNames", true);
end

function [oszlopok] = f_1_3(oszlopfajl)
    oszlopok = readtable('_oszlopok.xlsx', "ReadVariableNames", true);
end

function [sorindex] = f_1_4(sorok)
    sorindex = find(ismember(sorok.i, {'van', 'nem kell'}) | ismember(sorok.j, {'van', 'nem kell'} | ismember(sorok.k, {'van', 'nem kell'})));
end

function [oszlopindex] = f_1_5(oszlopok)
    oszlopindex = find((oszlopok.e < 7 & oszlopok.f < 7));
end

function [adatmatrix] = f_1_6(adat, sorindex, oszlopindex)
    adatmatrix = adat(sorindex, oszlopindex);
end

function [x] = f_1_7(adatmatrix, v)
    x = v / adatmatrix;
end

function [sajatertek, sajatvektor] = f_1_8(adatmatrix)
    sajatertek = eig(adatmatrix');
    [A, B, C] = eig(adatmatrix');
    sajatvektor = C;
end

function [leg] = f_1_9(sajatertek, sajatvektor)
    index = imag(sajatertek) ~= 0;
    [minimum I] = min(sajatertek(index));
    leg = sajatvektor(:, I);
end

function [elemenkent] = f_1_10(adatmatrix)
    elemenkent = log2(adatmatrix) .^ 3;
end

function [szorzat] = f_1_11(adatmatrix, u)
    szorzat = adatmatrix .* u;
end

function f_1_12(adat, fajlnev)
    reszt = array2table(adat(1:3, [1 4 5]));
    nev = strcat(fajlnev, '.csv');
    writetable(reszt, nev);
end
```

# 2020/???/II.

```matlab
function [x, f1, f2, f3] = f_2_1()
  x = 0:0.9:11;
  f1 = 0.5 * sin(5 * x);
  f2 = 4 * cos(5 * x);
  f3 = f1 .^ f2;
end

function [abra, p1, p2, p3] = f_2_2(x, f1, f2, f3)
  abra = figure;
  p1 = subplot(1, 3, 1);
  plot(x, f1, 'c--+', 'LineWidth', 1.8);
  xlabel('$x$', 'interpreter', 'latex');
  ylabel('$0.5\sin (5.0x)$', 'interpreter', 'latex');
  p2 = subplot(1, 3, 2);
  plot(x, f2, 'c--d', 'LineWidth', 1.8);
  xlabel('$x$', 'interpreter', 'latex');
  ylabel('$4.0\cos (5.0x)$', 'interpreter', 'latex');
  p3 = subplot(1, 3, 3);
  plot(x, f1, 'c--+', 'LineWidth', 1.8);
  hold on;
  plot(x, f2, 'c--d', 'LineWidth', 1.8);
  plot(x, f3, 'g--o', 'LineWidth', 1.8);
  xlabel('$x$', 'interpreter', 'latex');
  ylabel('$y$', 'interpreter', 'latex');
  legend('$f_{1}$', '$f_{2}$', '$f_{3}=f_{1}^{f_{2}}$', 'interpreter', 'latex', 'Location', 'north');
end
```

# 2020/???/III.

```matlab
function [abra1, XYZ] = f_3_1()
    load('pointCloud1.mat');
    abra1 = figure;
    plot3(x, y, z, 'm.');
    view(227, 27);
end

function [abra2, XYZ] = f_3_2()
    [X Y] = meshgrid(- 4.7:0.3:4.7, - 4.7:0.3:4.7);
    Z = 0.6 * sin(X) .* cos(Y);
    abra2 = figure;
    contour(X, Y, Z);
    xlim([- 4.6, 4.6]);
    ylim([- 4.6, 4.6]);
    xlabel('x');
    ylabel('y');
    title('$0.6\sin(X)\cos(Y)$', 'interpreter', 'latex');
end
```

# 2020/???/IV.

```matlab
function [t, x] = f_4_1()
    tm = [0:20];
    a = 33;
    b = 67 / 10;
    c = 3 / 10;
    x0 = [a; b; c];
    %M=[b/3-9/2,0,0;0,1-a/2,0;0,0,2-((a+b)/7)];
    M = @(t, y) [(y(2) / 3 - 9 / 2) * y(1);
    (1 - + y(1) / 2) * y(2);
    y(3) * (2 - ((y(1) + y(2)) / 7))];
    %fv = @(t, x) M*x;
    [t45 x45] = ode45(M, tm, x0);
    t = t45;
    x = x45;
end
```

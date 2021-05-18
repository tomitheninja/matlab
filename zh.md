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

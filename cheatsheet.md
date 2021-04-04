# MatLab cheatsheet

## MatLab cuccok

Az `ans` változó tárolja a legutóbbi művelet eredményét.

a `clear` parancs kitörli a memóriát.

a `clc` parancs törli a konzol historyt.

a `help <függvény neve>` parancs megjelenít egy rövíditett dokumentációt. (ez nem az, ami a helpben van)

a `0`-val val való osztáskor hiba dobás helyett, kiszámolja az osztás "határértékét" (`1/0 == Inf`, `-1/0 == -Inf`)

### Konzolra iratás

a `disp(x)` függvénnyel lehet a konzolra írni egy előre megadott értéket: `disp('Hello world!')` , vagy egy változó értékét: `disp(a)`.

Ha nem teszel egy sor végére `;`-őt, akkor annak értéke meg fog jelenni a konzolon.

Ennek a trükknek a segítségével és az `sprintf('format string', param1, param2, ...)` függvénnyel lehet változókat tartalmazó szöveget (*=template*) a konzolra iratni: `sprintf('Petinek %d almája van.', num_apples)`.

# Adat típusok

## Valós szám (=[1x1] mátrix)

Jelölés: `3.14`

* `^`: hatványozás -> `a^(1/b)` == gyökvonás
* `*`, `/`: szorzás, osztás
* `+`, `-`: összeadás, kivonás
* `==`, `~=`: egyenlő, nem egyenlő

## Logikai

Ez csak egy, a programozó fejében létező dolog. Igazából valós számként van eltárolva és megjelenítve.

### Felvehető értékek:

* `true` (1)

* `false` (0)

### Műveletek:

legyen bool = egy 0 vagy 1 értéket tároló változó.

`~bool` (tagadás)

`bool && bool` (és)

`bool || bool` (vagy)

## Vektorok (=[1xn] mátrix)

Jelölés: `[1 2 3]` vagy `[1, 2, 3]` (a vessző opcionális)

### Műveletek a vektor egészén

Legyenek v1 és v2 [1xk] típusú vektorok.
Legyen m egy [kxk] típusú mátrix.

* `v1 + v2`: Vektorok összege
* `v1 * m`: Szorzás mátrixxal.

#### Logikai műveletek egy vektoron

* `[1 2 3] == 2`: `[0 1 0]`
* `[1 2 3]  > 2`: `[0 0 1]`

### Műveletek a vektor elemein

#### A `.` operátor működése 

A dot operátort követő műveletet, ahelyett, hogy a műveletet az operátor bal oldalán lévő vektorra hajtaná végre, ahelyett egyesével, a vektor összes elemére hajta végre (olyan mint egy for ciklus).

```c++
// op(a, b) helyett ez: 
for (int i = 0; i < a.size(); i++) {
  op(a[i], b)
}
```

Például, legyen s egy skalár.

Ekkor `[a b c] .* s = [a*s, b*s, c*s]` (Látható, hogy a *s műveletet nem magára a vektorra hajtotta végre, hanem annak elemeire, egyesével)

#### Logikai műveletek a vektor elemein.

Az egyszeres logikai operátorokat akkor használjuk, amikor két feltételt szeretnénk összefűzni.

Pl: alma & finom kiértékése: `[1 0] & [1 1] = [1 0]`

### Vektorok skalár-indexelése

Eredménye a vektor egy eleme.

```matlab
v = [10 15 30]; % three rand nums
v(1) == 10;
v(2) == 15;
v(3) == 30;
v(end) == 30;
```

### Vektorok tartomány-indexelése

Eredménye a vektor egy része (=slice=szelete).

```matlab
v = [10 15 30]; % three rand nums
v(1:2) == [10 15];
```

### Vektorok létrehozása

* Elemeinek felsorolásával: `v = [1 2 3]`
* Index-tartomány segítségével: `v = 1:10`
* Okos-tartomány segítségével: `v = linspace(1, 10, 5)` első elem = 1, utolsó = 10, size = 5
* Csak nulla vektor: `v = zeros([1 5])`
* Csak egy vektor: `v = ones([1 5])`
* Bármely szám: `v = zeros([1 5]) + 10`
* Rand szám: `v = rand([1 5])`

## Mátrixok

```matlab
m = [1, 2; 3, 4];
% [1 2]
% [3 4]
```

## Gyakori műveletek mátrixokkal:

#### Egy elem lekérése

```matlab
% első sor
% második oszlop
x = m(1, 2);
```

#### Több elem lekérése

```matlab
% minden sor
% második oszlop
first_row = m([1 end], 2);
```

#### Egy sor lekérése

A speciális `:` (all / row) operátor használatával:

```matlab
first_row = m(:, 2);
```

#### Trimming

Az első és az utolsó elem elhagyása:

```matlab
first_row = v(2:end-1);
```

#### Feltétel az elemeire:

```matlab
megfelel_e_a_feltetelnek = m > 2;
```

#### Szűrés

Csak a feltételnek megfelelő elemek:

```matlab
filtered = m(m > 2);
```

#### Keresés

Azon elemek indexei, amelyek megfelelnek egy feltételnek.

```matlab
idxs = find(m > 2); 
```

Ezzel is megvalósítható a szűrés, de az előző módszer gyorsabb.

#### Frissítés, Cserélés

Az adott indexű elemeknek értéket ad.

```matlab
m(:, 1) = 0;
A2(A2 == 0) = Inf; % replace zeros with Infinity
```

#### Átlag, Minimum, Maximum

```matlab
5 == mean([0 5 10])

% melyik dimenzió (irány) mentén fusson le?
% általában a második dim kell (sorok átlaga)
[1 15] == mean([0 2; 10 20], 2)

[min_val, min_idx] = min(M) % a szélsőérték indexének (is) lekérdezése
```

#### Lapítás, Átméretezés

`squeeze(A)` returns an array with the same elements as the input array M, but with dimensions of length 1 removed.

# Grafikonok

## 1. Figure (rajzvászon)

```matlab
fig = figure;
```

## 2. Subplot (rácsrendszer) *- opcionális*

```matlab
subplot(grid_width, grid_height, [use these indexes]);
```

## 3. Plot (grafikon)

Adottak az azonos hosszúságú xs és ys tömbök.

```matlab
pl = plot(xs,ys, '<style using code>', <style name>,<style value>, <style name>,<style value>, ...);
```

### Több vonal

Adottak az azonos hosszúságú xs és ys tömbök.

```matlab
hold on; % Az előző plot újrafelhasználása a hold off;-ig
pl1 = plot(xs,ys, '-g', 'LineWidth',2);
pl2 = plot(xs,ys, '-b', 'LineWidth',2);
hold off;
```

### Megadható tulajdonságok

```matlab
xlim([t(1), t(end)]); % min x, max x
ylim([-2, 1]); % min y, max y

title('upperLeft', 'FontWeight', 'bold');
xlabel('t');
ylabel('y value');

p.Marker = 'square';
p.MarkerSize = 7;
p.MarkerEdgeColor = 'red';

p.Color = 'blue';
p.LineStyle = '--';
p.LineWidth = 2;

grid on; % or: axes = gca; axes.FontSize = 12;

legend({'zsakmany', 'ragadozo'}, 'Location', 'northeast');
```

### Gauss elemináció

1. Rendezd az egyenletet `A * x = b` alakba.
2. `x = A\b`

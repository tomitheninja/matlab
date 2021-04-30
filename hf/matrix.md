# Mátrix

Készíts egy függvényt, aminek egyetlen bemenete egy A mátrix lesz (dimenziónként 5, 2 és 3 véletlen számmal), 5 visszatérési értékkel (B, C mátrixok, d\-f skalárok), és az alábbi lépéseket tartalmazza:

*   két különálló változóba kimenti az eredeti mátrixnak a 2. dimenzió mentén található két részmátrixát (szemléletesen: az első és második oszlop közötti síknál kettévágjuk a téglatestet; ne felejtsd el az egyke dimenziók eltávolítását, hogy két darab, valódi 2D-s mátrixod legyen), --- B és C
*   kiszámítja az első részmátrixban a sorok maximumának összegét (beépített függvényekkel, ciklushasználat nélkül), --- d
*   kiszámítja a második részmátrixban az oszlopok minimumának átlagát (beépített függvényekkel, ciklushasználat nélkül), --- e

Hasznos lehet: squeeze, kettőspont operátor, max, sum, min, mean.

```matlab
function [B,C,d,e]=myFunction(A)
    
B = A(:, 1, :);
B = squeeze(B);
C = A(:, 2, :);
C = squeeze(C);

maxs_of_row = max(B');
d = sum(maxs_of_row);

mins_of_col = cummin(C); % Could be solved with min(B'), but I have a bias against cummin
mins_of_col = mins_of_col(end, :);
e = mean(mins_of_col);
    
end
```

```matlab
A=rand(5,2,3);
[B, C, d, e] = myFunction(A)
```

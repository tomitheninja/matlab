# Vektorok; skalár és logikai indexelés

Készíts el egy függvényt az alábbiak szerint:

1.  2db bemeneti vektor (x: tízelemű, y: kételemű, y elemeinek neve legyen a és b); 4 db visszatérési érték (c\-f);
2.  logikai indexeléssel határozzuk meg azokat a vektorelemeket, amik az \[a, b\] zárt intervallumba esnek, ezek az elemek kerüljenek a c vektorba (tehát nem az indexvektor maga, hanem már az indexvektorral kiválasztott elemek);
3.  számoljuk ki az \[a, b\] zárt intervallum feletti értékek átlagát, ez kerüljön a d kimeneti változóba;
4.  egyetlen függvényhívással határozzuk meg a korábban készített c vektor maximumának értékét és vektoron belüli pozícióját (indexét), ez a kettő egy vektorként legyen az e kimeneti változó;
5.  egy beépített függvénnyel határozzuk meg x azon elemeinek számát, amik az \[a, b\] zárt intervallumba esnek, ez a szám kerüljön az f kimeneti változóba.

```matlab
function [c,d,e,f] = vectorIndexing1(x,y)
    a = y(1);
    b = y(2);
    c = x(a <= x & x <= b);
    d = mean(c);
    [e(1) e(2)] = max(c);
    f = length(c);
end
```

```matlab
x=linspace(1,25,10)
y=sort(randi(25,2,1))
[c,d,e,f] = vectorIndexing1(x,y)
```

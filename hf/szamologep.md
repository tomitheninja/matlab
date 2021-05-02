# MATLAB mint számológép

Készíts egy függvényt 2 bemeneti \[a-b\] és 11 kimeneti \[c-h; k-p\] paraméterrel, az alábbi összefüggések alapján:

1.  c\=aGb
2.  d\=ab
3.  e\=logab
4.  f\=5.21((logb3Gπ)a)
5.  Egy derékszögű háromszög két szára a és b. Számítsd ki a befogókkal szemközti szögeket radiánban és fokban is --- ez a négy érték kerüljön a g,h,l,k változókba az alábbi ábrának megfelelő sorrendben. ![](https://lcms-files.mathworks.com/content/images/72422e5e-d1f1-4a4f-931a-320a96ebbe0c.png)
6.  Számítsd ki a ba -nál kisebb prímeket egy beépített MATLAB függvénnyel, és tárold el őket az m változóba.
7.  Faktoriális számolás: n\=(a∗b)!
8.  Készítsd el a10∗a∗b érték prímtényezős felbontását (prím-faktorizáció) egy beépített MATLAB függvénnyel, az eredményt tárold el az o változóba.
9.  Számold ki a b sugarú kör területét, az eredményt tárold el a p változóba. Használj beépített kulcsszót a π állandó helyén!


```matlab
function [c,d,e,f,g,h,k,l,m,n,o,p]=assignment1Solution(a,b)
    c = b^(1/a);
    d = a^b;
    e = log(b) / log(a);
    f = 5.21^((log(pi^(1/3)) / log(b))^a);
    g = atan(a / b);
    h = atand(a / b);
    k = acot(a / b);
    l = acotd(a / b);
    m = primes(a^b);
    n = factorial(a*b);
    o = factor(10*a*b);
    p = pi*b^2;
end
```

```matlab
a=5; b=2.4;
[c,d,e,f,g,h,k,l,m,n,o,p]=assignment1Solution(a,b)
a=4.5; b=4;
[c,d,e,f,g,h,k,l,m,n,o,p]=assignment1Solution(a,b)
a=4.5; b=2;
[c,d,e,f,g,h,k,l,m,n,o,p]=assignment1Solution(a,b)
```

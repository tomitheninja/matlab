# Equations, polynomials, numerical integration, text display

Oldd meg az alábbi egyenletrendszert egy függvényben. Ahol a bemeneti változók: a, b, c, d.
```
  ax \+ bz \= 79
  cy + dz + 9 \= 18
  ax + dy +cz - 1 \= 496
```
Tedd a kimenetet egy sorvektorba, amelyet pCoefficients-nek hívnak. (x, y, z)

Ez után vedd az x, y, z értékeket egy másodrendű polinom együtthatójaként, és értékeld ki a \[-5; 5\] zárt intervallumban, 1000 egyenlő távolságra elosztott ponttal. Ezt a vektort a pDomain-ba, az erre illesztett polinomot a pValues-ba mentsd.

Add meg a kiszámított polinom értékek által megadott görbe alatti területet, és tedd a pArea változóba.

Számítsd ki a pValues maximális értékét, és azt a pDomain értéket ahol ez a maximális érték található, és tedd ezeket a pMax változóba.

Írd ki a számítások eredményeit egy szövegben (pText), például (sortöréseket tartalmaz):

The coefficients of the polynomial are: \[383.500, 61.000, -43.500\].

The maximum is 9849.000 at 5.000.

The area is 3.152e+04.

```matlab
function [pCoefficients, pDomain, pValues, pArea, pMax, pText] = myFunction(a, b, c, d)
    pCoefficients = [a, 0, b; 0, c, d; a, d, c] \ [79; 9; 497];
    pDomain = linspace(-5, 5, 1000);
    pValues = polyval(pCoefficients, pDomain);
    fv = @(t) pCoefficients(1) .* t .* t + pCoefficients(2) .* t + pCoefficients(3);
    pArea = integral(fv, pDomain(1), pDomain(end));
    [maxVal, maxIdx] = max(pValues);
    pMax = [maxVal, pDomain(maxIdx)];
    pText = sprintf('The coefficients of the polynomial are: [%.3f, %.3f, %.3f].\nThe maximum is %.3f at %.3f.\nThe area is %.3e.', pCoefficients(1), pCoefficients(2), pCoefficients(3), pMax(1), pMax(2), pArea);
end
```

```matlab
coeffs=randi(100,1,4);
[pCoefficients,pDomain,pValues,pArea,pMax,pText] = myFunction(coeffs(1),coeffs(2),coeffs(3),coeffs(4));
disp(pText)
```

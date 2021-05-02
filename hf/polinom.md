# Polinom

Készíts egy függvényt, ami az alábbi feladatokat valósítja meg polinom-műveletek használatával:

Bemeneti paraméterek (6db): a, b, c, d, e, f;

visszatérési érték (7db):

*   az ábra handler\-je,
*   P: polinomot leíró vektor,
*   x1 és x2: a két értelmezési tartomány,
*   y1 és y2: a két polinomkiértékelés eredménye,
*   r a polinom gyökei.

A függvény létrehozza x1 és x2 értelmezési tartományokat, amik az \[e, f\] zárt intervallumot jelentik rendre 1-es és 0.001-es lépésközzel.

A függvény kiértékeli P(x)\=ax3+bx2+cx+d polinomot x1 és x2 felett (az eredmények rendre y1 és y2 változókba kerüljenek).

A függvény kiszámítja P polinom gyökeit, r változóban eltárolja azokat.

Ábrázolja a két polinomkiértékelés eredményét az alábbiak szerint:

*   a görbék színe legyen: piros (1) és kék (0.001) (mindkét görbe folytonos vonal, nincs markerjelölés);
*   ugyanezen az ábrán jelölje be a polinom gyökeit fekete körökkel; és a 0-szintet egy fekete szaggatott vonallal;
*   ábracím 14-es betűmérettel;
*   tengelyfeliratok 12-es betűmérettel, félkövéren szedve;
*   ábrafelirat doboza 'Location'-nel Délkeletre igazítva.

NB: az ellenőrzés miatt számít a kirajzolás sorrendje, ez legyen: piros vonal, kék vonal, gyökök körei, szaggatott vonal.

NB2: az ábrán ne használj ékezetes betűt (most).

![](https://lcms-files.mathworks.com/content/images/a0291879-3296-4405-87bb-179ba3fb669c.png)

```matlab
function [abra, P, x1, x2, y1, y2, r] = gyak5_f51_(a,b,c,d,e,f)

    P = [a b c d];
    x1 = e:f;
    x2 = e:0.001:f;
    y1 = polyval(P, x1);
    y2 = polyval(P, x2);
    r = roots(P);
 
    abra = figure; % ne használjunk másik figure utasítást, ez után a sor után jöjjenek a kirajzolás részletei
 
    hold on;
    plot(x1, y1, '-r');
    plot(x2, y2, '-b');
    plot(r, r ~= r, 'k', 'LineStyle', 'none', 'Marker', 'o');
    yline(0, '--k');
    legend({'1-es lepeskoz', '0.001-es lepeskoz', 'gyokok'}, 'Location', 'southeast');
    title('Polinom', 'FontSize', 14);
    xlabel('x ertek', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('y ertek', 'FontSize', 12, 'FontWeight', 'bold');
    hold off;

end
```

```matlab
[abra, P, x1, x2, y1, y2, r] = gyak5_f51_(1,2,-2,-2,-3,1.5)
```

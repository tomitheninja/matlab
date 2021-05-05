# Ragadozó-zsákmány

Az alabbi feladatban a ragadozó-zsákmány modellt vizsgáljuk meg, mely kétváltozós differencialegyenletként irható le. (Ez a Lotka-Volterra modell, amely egy adott területen a ragadozó-zsákmány egyedszám-viszonyt irja le: https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra\_equations )

Készíts egy függvényt mely 1 ábrát generál, 2 bemeneti paraméterrel:

1.  kezdeti ertékek y\_0=\[y1\_0, y2\_0\];
2.  időintervallum t=\[t\_0, t\_max\];

visszatérési értékei:

1.  az ábra hivatkozása;
2.  a megoldásfüggvény mint pontsorozat értelmezési-tartománya (T) és
3.  értékkészlete (Y) (ez utóbbi kettő az ode45 visszatérési érteke, ugye).

A feladat az alábbi elsőrendű, kétváltozós DE megoldása:

dy1dt\=(1−y2μ2)y1dy2dt\=−(1−y1μ1)y2

y1: zsákmány egyedszám, y2: ragadozó egyedszám;

μ1: zsákmány környezeti eltartóképessége, μ2: ragadozó környezeti eltartóképessége

Legyen most μ1\=200 es μ2\=300;

a differenciálegyenlet-rendszert a kódodban anonim függvényként definiáld.

A megoldásod az alábbihoz hasonló módon rajzolja ki a felső alábrán az egyedszámok időfüggő értékét, míg az alsó alábrán az egyedszámokon felvett síkban a fázisportrét (ragadozók száma az zsákmányok függvényében):

![](https://lcms-files.mathworks.com/content/images/b27882d4-c8e2-4c16-9de2-62cdacae382a.png)

(Elvárások körülbelül: felül folytonos zöld és kék vonal 2-es vastagsággal, ábrafelirat 14-es beűmérettel, tengelyfeliratok félkövéren szedve 12-es méretben, felső alábrához ábramagyarázat (legend).)

Problem description

```matlab
    fv = @(t, y) [1-y(2)/300; -1+y(1)/200] .* y;
    [T, Y] = ode45(fv, t, y_0);
    
    ax1 = subplot(2, 1, [1]);
    hold on;
    pl1 = plot(T, Y(:, 1), 'g', 'LineWidth', 2);
    pl2 = plot(T, Y(:, 2), 'b', 'LineWidth', 2);
    title('Predator-Prey model', 'FontSize', 14,'FontWeight', 'bold');
    legend({'zsakmany', 'ragadozo'});
    xlabel('t', 'FontSize', 12, 'FontWeight','bold');
    ylabel('egyedszam', 'FontSize', 12, 'FontWeight','bold');
    hold off;
    
    ax2 = subplot(2, 1, [2]);
    pl3 = plot(Y(:, 1), Y(:, 2)); 
    title('Fazisgorbe', 'FontSize', 14,'FontWeight','bold');
    xlabel('zsakmanyok szama','FontSize', 12,'FontWeight','bold');
    ylabel('ragadozok szama','FontSize', 12,'FontWeight','bold');
end
```

```matlab
y_0 = [100, 150];
t = [0, 20];
[~] = LotkaVolterra(y_0, t);
```

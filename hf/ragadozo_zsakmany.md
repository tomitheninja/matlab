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
function [T, Y, fig, ax1, ax2, pl1, pl2, pl3] = LotkaVolterra(y_0, t)
% elsorendu, ketvaltozos differencialegynelet megoldasa,
% Lotka-Volterra ragadozo-zsakmany modell
    fig = figure;
    u1 = 200;
    u2 = 300;
    
    [T, Y] = ode45(@(t,y) (diag([1 - y(2)/u2, -1 + y(1)/u1]) * y), t, y_0);
    
    ax1 = subplot(2, 1, [1]);
    pl = plot(T, Y(:, 1), 'green', T, Y(:, 2), 'blue');
    title('Predator-Prey model', 'FontSize', 14,'FontWeight','bold');
    legend('zsakmany', 'ragadozo');
    xlabel('t', 'FontSize', 12,'FontWeight','bold');
    ylabel('egyedszam', 'FontSize', 12,'FontWeight','bold');
    pl1 = pl(1);
    pl1.LineWidth = 2;
    pl2 = pl(2);
    pl2.LineWidth = 2;
    
    ax2 = subplot(2, 1, [2]);;
    pl3 = plot(Y(:,1), Y(:,2));
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

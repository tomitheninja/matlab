# 2D ábrázolás

Készíts egy szkriptet, amely az alábbi ábrát állítja elő:

![](https://lcms-files.mathworks.com/content/images/087d804a-3e4f-445f-8a79-877241c0d1eb.png)

ahol minden alábrán időfüggő (t) adatsorokat láthatunk az alábbi összefüggések szerint:

bal felső: 0.5−0.2eln(t)cos(t)

bal alsó: π0.1t−3sin(t)

jobb oldali: cos(t))esin(t)

Kérjük ne feledkezz meg a címekről, feliratokról, a vonal/görbe stílusáról, rácsozásról, tengelyhatárokról.

Megjegyzés: a jobb oldali ábrán a 0-szinten van egy vízszintes, fekete, szaggatott vonal.

```matlab
s = figure;
t = 2:14;

fun1 = 0.5 - 0.2 * exp(log(t) .* cos(t));
subplot(2, 2, [1]);
plot(t, fun1, '--bs');
ylabel('y value');
xlabel('t');
title('upperLeft');
xlim([t(1) t(end)]);
ylim([-2 1]);

fun2 = pi .^ (0.1 * t - 3) .* sin(t);
subplot(2, 2, [3]);
plot(t, fun2, '-black^');
ylabel('y value');
xlabel('t');
title('lowerLeft');
xlim([t(1) t(end)]);
ylim([-0.2 0.2]);

fun3 = cos(t) ./ exp(sin(t));
subplot(2, 2, [2 4]);
plot(t, fun3, '-r*', t, zeros(size(t)), '--black');
ylabel('y value');
xlabel('t');
title('right');
xlim([t(1) t(end)]);
ylim([-1.5 1.5]);
grid on;
```

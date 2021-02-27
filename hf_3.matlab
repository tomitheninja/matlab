t = 2:14;
s = figure; % the canvas
% plot 1
fun1 = 0.5 - 0.2*exp(log(t).*cos(t));
subplot(2, 2, 1); % [grid size] [use these]
p = plot(t, fun1); % [xs] [ys] fn displayer
xlim([t(1), t(end)]); % min x, max x
ylim([-2, 1]); % min y, max y
title('upperLeft', 'FontWeight', 'bold');
xlabel('t');
ylabel('y value');
p.Marker = 'square';
p.Color = 'blue';
p.LineStyle = '--';
% plot 2
fun2 = sin(t).*pi.^(0.1*t-3);
subplot(2, 2, 3);
p = plot(t, fun2);
xlim([t(1), t(end)]);
ylim([-0.2, 0.2]);
title('lowerLeft', 'FontWeight', 'bold');
xlabel('t');
ylabel('y value');
p.Marker = '^';
p.Color = 'black';
% plot 3
fun3 = cos(t).*exp(-sin(t));
subplot(2, 2, [2 4]);
p = plot(t, fun3, '-' ,t, t.*0);
ax = gca; % enable grid
ax.XGrid = 'on';
ax.YGrid = 'on';
xlim([t(1), t(end)]);
ylim([-1.5, 1.5]);
title('right', 'FontWeight', 'bold');
xlabel('t');
ylabel('y value');
p(1).Marker = '*';
p(1).Color = 'red';
p(2).Color = 'black';
p(2).LineStyle = '--';

P = [a, b, c, d];
x1 = e:f;
x2 = e:0.001:f;
y1 = polyval(P, x1);
y2 = polyval(P, x2);
r = roots(P);

abra = figure; % ne használjunk másik figure utasítást, ez után a sor után jöjjenek a kirajzolás részletei
p = plot( ...
    x1, y1, 'r', ...
    x2, y2, 'b', ...
    r, zeros([1 length(r)]), 'oblack');
yline(0, '--black');

title('Polinom', 'FontSize', 14);
xlabel('x ertek', "FontSize", 12, 'FontWeight', 'bold');
ylabel('y ertek', "FontSize", 12, 'FontWeight', 'bold');

legend('1-es lepeskoz', '0.001-es lepeskoz', 'gyokok', 'Location', 'southeast');

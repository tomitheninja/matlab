function [fig, hitelesitettMeresiErtekek, elsoSzenzorHelyesMereseiSzovegben, ...
        szenzorokDeliMeresenekAtlagaSzovegben] = myFunction(legnyomasErtekek)

fig = figure; % Ezt az abrat hasznaljuk a kirajzoltatasra.

lower_bound = 930;
upper_bound = 1060;

subplot(); % csak egy van, maradhatnak alap értékek (1, 1, 1)
days = 1:31; % range(1:31)
ys = legnyomasErtekek(1, 3, :);
ys = squeeze(ys)'; % 31x1x1 -> 1x31: same as days
is_ok = lower_bound <= ys & ys <= upper_bound; % bool array
lower_line = zeros([1 31])+lower_bound;
upper_line = zeros([1 31])+upper_bound;
p = plot( ...
    days, lower_line, 'magenta', ...
    days, upper_line, 'magenta', ...
    days, ys, '-.oblack', ...
    days(is_ok), ys(is_ok));

xlim([1, 31]);
ylim([890, 1100]);

% lower and upper line
p(1).LineWidth = 2;
p(2).LineWidth = 2;

% all data
p(3).Color = 'black';
p(3).LineWidth = 3;
p(3).MarkerSize = 7;
p(3).LineStyle = '-.';

% verified data
p(4).LineStyle = 'none';
p(4).Marker = 'o';
p(4).MarkerSize = 7;
p(4).LineWidth = 2;
p(4).MarkerEdgeColor = 'red';
p(4).MarkerFaceColor = 'green';

% axes labels
axes = gca; % gca = get current axes
axes.FontSize = 12;

% legend
leg = legend('Lower limit', 'Upper limit', 'Original data', 'Verified data');
leg.Location = 'northeastoutside';

% labels
title('First sensor, evening, all days', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('number of days', 'FontWeight', 'bold', 'FontSize', 12);
ylabel('atmospheric pressure [hPa]', 'FontWeight', 'bold', 'FontSize', 12);

hitelesitettMeresiErtekek = legnyomasErtekek;
hitelesitettMeresiErtekek(legnyomasErtekek < lower_bound | upper_bound < legnyomasErtekek) = 0;

ok_days = lower_bound <= ys(11:20) & ys(11:20) <= upper_bound;
num_ok_days = length(find(ok_days));
elsoSzenzorHelyesMereseiSzovegben = sprintf('Helyes meresi ertekek darabszama (elso szenzor, esti meres, 11-20. napokra): %d', num_ok_days);

% TODO:
del_234 = squeeze(legnyomasErtekek([2,3,4], 2, :));
del_234(del_234 < lower_bound | upper_bound < del_234) = 0;

m_sum = sum(del_234, 2);
m_n =  sum(del_234~=0, 2); % count = sum of booleans
m_avg = m_sum./m_n;

% the sign = 1
% int part length = 4
% the dot = 1
% number of digits after the dot = 3
szenzorokDeliMeresenekAtlagaSzovegben = sprintf('A masodik szenzor deli atlaga: %+09.3f, a harmadiknak: %+09.3f es a negyediknek: %+09.3f', m_avg);
end

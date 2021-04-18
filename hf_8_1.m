db = randi([101 300]);
[cellaTomb, abra]=gyak8_f81_(db);


function [cellaTomb, abra]=gyak8_f81_(db)
    abra = figure;
    
    t = linspace(0, 2 * pi, db);
    cellaTomb = {t, [], []; 'Sin(3t)', 'Cos(5t)', 'Sin(3t)*Cos(5t)'; sin(3*t), cos(5*t), sin(3*t) .* cos(5*t)};
    for i = 1:3
        subplot(3, 1, i);
        plot(t, cellaTomb{3, i}, '-k');
        title(cellaTomb{2, i});
        xlabel('t');
    end
end

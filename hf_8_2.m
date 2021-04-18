function [strukturaTomb, abra] = fgy_82_(db)
    abra = figure;
    t = linspace(0, 2*pi, db);
    strukturaTomb = [ ...
        struct('x', t, 'y', sin(3*t), 'nev', 'Sin(3x)') ...
        struct('x', t, 'y', cos(5*t), 'nev', 'Cos(5x)') ...
        struct('x', t, 'y', sin(3*t) .* cos(5*t), 'nev', 'Sin(3x)*Cos(5x)')]
    for i = 1:3
        subplot(3, 1, i);
        plot(strukturaTomb(i).x, strukturaTomb(i).y, '-k');
        title(strukturaTomb(i).nev);
        xlabel('x');
    end
end

db = randi([101 300]);
[strukturaTomb, abra] = fgy_82_(db);
strukturaTomb

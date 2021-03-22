function [T, Y, logind, fig, pl1, pl2, pl3, pl4] = kemiai_3anyag(y_0, t)
% Kemiai egyenlet, 3 anyaggal
    fig=figure;
    
    [T, Y] = ode45(@(~, y) [1.2, 4.1, -1.7; -8, -1.4, 2.1; 2.1, -7.2, 1.3] * y, t, y_0);
    logind = Y(:,2) < Y(:,1) & Y(:,1) < Y(:,3);
    
    pl = plot( ...
        T, Y(:, 1), '-blue', ...
        T, Y(:, 2), '-black', ...
        T, Y(:, 3), '-red', ...
        T(logind), Y(logind), '.green' ...
    );
    legend('A', 'B', 'C', 'Location', 'SouthWest');
    title('Kemiai reakcio 3 anyaggal', 'FontSize', 14,'FontWeight','bold');
    xlabel('ido','FontSize', 12,'FontWeight','bold');
    ylabel('koncentracio','FontSize', 12,'FontWeight','bold');
    pl1 = pl(1);
    pl1.LineWidth = 2;
    pl2 = pl(2);
    pl2.LineWidth = 2;
    pl3 = pl(3);
    pl3.LineWidth = 2;
    pl4 = pl(4);
    pl4.MarkerSize = 20;
end

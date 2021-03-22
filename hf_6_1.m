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

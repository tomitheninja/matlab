function [abra, T, Y] = f83_(bemenetiFajlNev)
    %[T, Y] = ode45(... erdemes a diffegyenletet ilyen formaban megoldani, igy egybol be lesznek allitva a visszateresi ertekek is
    
    abra = figure;
    f_in = fopen(bemenetiFajlNev, 'r');
    data = fscanf(f_in, '%f', 4);
    fclose(f_in);
    x = [data(1) data(2)];
    y = [data(3) data(4)];
    f = @(x,y) [5 * log(y(2)) * y(1); (1 - 1.2 * y(1)) * y(2)];
    
    [T, Y] = ode45(f, x, y);
    
    subplot(2, 1, [1]);
    hold on;
    plot(T, Y(:, 1), '-.m', 'LineWidth', 2);
    plot(T, Y(:, 2), 'g:', 'LineWidth', 2);
    legend({'y1', 'y2'});
    title('Idobeli lefutasok', 'fontsize', 14);
    xlabel('ido', 'fontsize', 12, 'fontweight', 'bold');
    ylabel('ertek', 'fontsize', 12, 'fontweight', 'bold');
    hold off;
    
    subplot(2, 1, [2]);
    plot(Y(:,1), Y(:,2), 'r-', 'LineWidth', 2);
    title('Fazisportre -- allapotter', 'FontSize', 14);
    xlabel('y1', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('y2', 'FontSize', 12, 'FontWeight', 'bold');
    
    f_out = fopen('gyak_f83_kimenet.bin', 'w');
    fwrite(f_out, T, 'double');
    fwrite(f_out, Y, 'double');
    fclose(f_out);
end

bemenetiFajlNev = '83.text'
[abra, T, Y] = f83_(bemenetiFajlNev);

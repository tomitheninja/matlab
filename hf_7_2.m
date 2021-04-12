function [abra, sfc] = gyak7_f72_(x_min, x_max, y_min, y_max, Az, El)
    abra = figure;
    [X Y] = meshgrid(x_min:0.02:x_max, y_min:0.02:y_max);
    r = (X.^2 + Y.^2) .^ 0.5;
    Z = 0.5 * sin(r) .* cos(r);
    sfc = surfc(X, Y, Z);
    title('$z = 0.5 \sin(r) \cos(r)$', 'interpreter', 'latex', 'FontSize', 14)
    xlabel('X koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    colorbar;
    view(Az, El);
end

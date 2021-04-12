    abra = figure;
    [X Y] = meshgrid(x_min:0.25:x_max, y_min:0.25:y_max);
    Z = sin(X) .* exp(-sin(X) - Y.^2);
    sf = surf(X, Y, Z);
    title('$z = \sin(x)\cdot e^{-\sin(x)-y^2}$ felulet', 'interpreter', 'latex', 'FontSize', 14)
    xlabel('X koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z koordinata', 'FontSize', 12, 'FontWeight', 'bold');
    colorbar;

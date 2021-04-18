function [abra, feluletStruktura] = f84_(bemenetiFajlNev)
    abra = figure;
    % a sturkturadnal lehetoleg az alabbi mezoneveket hasznald:
    % - meshgridpoints - a bemeneti fajlbol beolvasott elso 6 szam, ami a meshgrid parametereit jelenti
    % - zdata - a bemeneti fajlbol beolvasott tobbi szam, ami a terbeli feluleted magassagi pontjait jelenti
    % - cim, xfelirat, yfelirat, zfelirat - stringek, amiket majd a 3D abrad feliratozasanal hasznalj
    %pl: feluletStruktura.meshgridpoints = ...
    f_in = fopen(bemenetiFajlNev, 'r');
    x_meta = fscanf(f_in, '%f', 6);
    ys = fscanf(f_in, '%f', [21 Inf]);
    feluletStruktura = struct( ...
      'meshgridpoints', x_meta, ...
      'zdata', ys, ...
      'cim', 'a betoltott adatpont-felho', ...
      'xfelirat', 'x', ...
      'yfelirat', 'y', ...
      'zfelirat', 'z');
    fclose(f_in);

    [X Y] = meshgrid(x_meta(1) : x_meta(2) : x_meta(3), x_meta(4) : x_meta(5) : x_meta(6));
    
    hold on;
    plot3(X, Y, feluletStruktura.zdata, 'g.');
    xlabel(feluletStruktura.xfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    ylabel(feluletStruktura.yfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    zlabel(feluletStruktura.zfelirat, 'FontSize', 12, 'FontWeight', 'bold');
    title(feluletStruktura.cim, 'FontSize', 14);
    grid on;
    colorbar;
    [C h] = contour3(X, Y, feluletStruktura.zdata);
    view(-41, 28);
    clabel(C, h);
    hold off;
   
    save('gyak8_f84_kimenet.mat', 'feluletStruktura')
end

bemenetiFajlNev =  '84.text';
[abra, feluletStruktura] = f84_(bemenetiFajlNev);
feluletStruktura

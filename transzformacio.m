function [H1, H2, H3, H4, abra, ax1, ax2, ax3, ax4]=gyak4_f42(archivum)
    
    % load függvény használata -> lásd help; külső tesztelésnél fontos, hogy a house.mat
    % a house.mat ugyanabban a mappában legyen, mint a függvény, különben teljes elérési
    % utat kell adni neki.
    load(archivum);
    % H1,H2,H3,H4 rendre az A1,A2,A3,A4 transzformációk eredménye
    H1 = kep*A1; % scaleX(0.5);
    H2 = kep*A2; % scaleY(2);
    H3 = kep*A3; % rotate(pi/2);
    H4 = kep*A4; % scaleX(-1);
    %% Ide kerüljön az ábra kirajzoltatása
    
    abra = figure; % ez után
    ax1 = subplot(2, 2, 1);
    plot(H1(:, 1), H1(:, 2));
    title('house*A1', 'FontWeight', 'bold');
    xlim([-15, 15]);
    ax2 = subplot(2, 2, 2);
    plot(H2(:, 1), H2(:, 2));
    title('house*A2', 'FontWeight', 'bold');
    xlim([-15, 15]);
    ax3 = subplot(2, 2, 3);
    plot(H3(:, 1), H3(:, 2));
    title('house*A3', 'FontWeight', 'bold');
    xlim([-15, 15]);
    ax4 = subplot(2, 2, 4);
    plot(H4(:, 1), H4(:, 2));
    title('house*A4', 'FontWeight', 'bold');
    xlim([-15, 15]);
    
end

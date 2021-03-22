function [fig1,antSpeed,antStatistics,fig2, ax1, ax2, ax3, ax4, pl1, pl2, pl3, pl4,...
          pl5, pl6, pl7, pl8]=myFunction(antRecords)
%% 1) Draw the path of the ants, based on the original matrix, with different colors (Do not forget to remove singleton dimensions for plotting).
fig1=figure;

p = plot( ...
    squeeze(antRecords(1,1,:)), squeeze(antRecords(1,2,:)), '.-b', ...
    squeeze(antRecords(2,1,:)), squeeze(antRecords(2,2,:)), '.-r', ...
    squeeze(antRecords(3,1,:)), squeeze(antRecords(3,2,:)), '.-g', ...
    squeeze(antRecords(4,1,:)), squeeze(antRecords(4,2,:)), '.-black' ...
);
axis equal;
title('Movement of Ants');
xlabel('X [cm]');
ylabel('Y [cm]');
grid on;
legend('ant 1', 'ant 2', 'ant 3', 'ant 4');
pl1 = p(1);
pl2 = p(2);
pl3 = p(3);
pl4 = p(4);

%% 2) Calculate the speed of the ants at every point of their travel using numerical derivation.
arr = antRecords;


t = (1:5999) / 100;
antSpeed = diff(arr, 1, 2) ./ 100;
dx = diff(squeeze(antRecords(:,1,:)), 1, 2);
dy = diff(squeeze(antRecords(:,2,:)), 1, 2);
antSpeed = sqrt(dx.^2 + dy.^2);
%% 3) Calculate the average, the maximum, and the minimum speed of all ants, and store them in a variable, where the first column is the average the second is the maximum and the third is the minimum.
means = [ ...
    mean(antSpeed(1,:)); ...
    mean(antSpeed(2,:)); ...
    mean(antSpeed(3,:)); ...
    mean(antSpeed(4,:)); ...
];
antStatistics = [means, max(antSpeed, [], 2) min(antSpeed, [], 2)];
%% 4) Draw the speed curves for each ant.
fig2 = figure;
t = 300:400;
v = dy./abs(dy) .* antSpeed;

hold on;

ax1 = subplot(4, 1, 1) ;
pl5 = plot(t ./ 100, 100 .* squeeze(v(1,t)),'b.-');
grid on;
ax2 = subplot(4, 1, 2);
pl6 = plot(t ./ 100, 100 .* squeeze(v(2,t)),'r.-');
grid on;

ax3 = subplot(4, 1, 3);
pl7 = plot(t ./ 100, 100 .* squeeze(v(3,t)),'g.-');
grid on;

ax4 = subplot(4, 1, 4);
pl8 = plot(t ./ 100, 100 .* squeeze(v(4,t)),'k.-');
grid on;

hold off;
xlabel(ax4, 'time [s]');
ylabel(ax2, 'velocity [m/s]');
title(ax1, 'Speed of Ants', "FontWeight","bold");

end

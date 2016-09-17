clc;
clear;
close all;

postFEC = 10e-12*ones(1, 91);
preFEC = 10.^(-10:0.1:-1);
codeRate = calcRateRSLowPrecision(preFEC, postFEC);

figure1 = figure;
axes1 = axes('parent', figure1);
semilogx(preFEC, codeRate, 'linewidth', 2, 'displayname', 'RS (255, k)');
grid on;
box on;
xlabel('pre-FEC')
ylabel('code rate')
% title('RS (255, k)')
ytick = get(axes1, 'ytick');
set(axes1, 'ytick', ytick(1:2:end));
h = legend('show', 'location', 'southwest');
h.FontSize = 12;
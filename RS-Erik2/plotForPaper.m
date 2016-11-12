clc;
clear;
close all;

preFecExactBer = importBER('preFECBER.csv');
% codeRate = [];
% for i=1:127
%     codeRate(i) = findRSCodeRateExact(preFecExactBer(i));
% end
t = 127:-1:1;
rate = (255-2*t)/255;
figure1 = figure();
box on; 
semilogx(preFecExactBer,rate, 'linewidth', 2);%, 'displayname', 'Ebel');
% hold on;
% semilogx(preFecExactBer,codeRate, 'linewidth', 2, 'linestyle', '--')
xlabel('pre-FEC BER', 'fontsize', 14)
ylabel('code rate', 'fontsize', 14)
grid on; hold on;
h1 = plot([0.02, 0.02], [0, 1], 'linewidth', 1, ...
    'displayname', 'pre-FEC BER=0.02');
hold on;
h2 = plot([0.01, 0.01], [0, 1], 'linewidth', 1, ...
    'displayname', 'pre-FEC BER=0.01');
h3 = plot([0.001, 0.001], [0, 1], 'linewidth', 1, ...
    'displayname', 'pre-FEC BER=0.001');
h = legend([h1, h2, h3], 'location', 'southwest');
h.FontSize = 12;
grid on;
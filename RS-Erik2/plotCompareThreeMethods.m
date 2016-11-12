clc;
clear;
close all;

preFecExactBer = importBER('preFECBER.csv');
preFecApproxBer = importBER('preFECBERref.csv');
t = 127:-1:1;
rate = (255-2*t)/255;
figure1 = figure();
box on; 
semilogx(preFecExactBer,rate, 'linewidth', 1, 'displayname', 'Ebel');
hold on;
semilogx(preFecApproxBer,rate, 'linewidth', 1, 'displayname', 'ITU-T');
xlabel('pre-FEC BER', 'fontsize', 14)
ylabel('code rate', 'fontsize', 14)

postFEC = 10e-12*ones(1, 91);
preFEC = 10.^(-10:0.1:-1);
for i=1:length(preFEC)
    codeRate(i) = searchRateRS(preFEC(i), postFEC);
end
semilogx(preFEC, codeRate, 'linewidth', 1, 'displayname', ...
    'curve in draft');
h = legend('show', 'location', 'southwest');
h.FontSize = 12;
grid on;

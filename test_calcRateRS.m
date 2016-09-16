clc;
clear;
close all;

postFEC = 10e-12*ones(1, 91);
preFEC = 10.^(-10:0.1:-1);
codeRate = calcRateRS(preFEC, postFEC);


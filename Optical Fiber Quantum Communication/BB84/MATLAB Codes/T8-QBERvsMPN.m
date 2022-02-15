%QBER vs MPN
x = 15;%Distance=15km
alpha = 2.5;%Attenuation
N = 10^(-alpha*x/10 + 8/10)*0.5;%Transmission efficiency
mu = [0:0.00001:1];%Varying mean photon number
psignal = 1 - exp(-N.*mu);
pdark = 10^-9;  
edet = 0.01;
qber = (0.5*pdark + edet*psignal)./(psignal+pdark);
semilogx(mu,qber);
xlabel('Mean Photon Number');
ylabel('Quantum Bit Error Rate');
title('QBER vs MPN');
%The data is according to T8's paper

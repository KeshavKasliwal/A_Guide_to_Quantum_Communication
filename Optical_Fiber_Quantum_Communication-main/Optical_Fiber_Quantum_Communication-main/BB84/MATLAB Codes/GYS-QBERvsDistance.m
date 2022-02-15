%QBER vs Distance
x = [10:10:125];%Varying Distance
alpha = 0.21;%Attenuation 
N = 10.^(-alpha.*x/10)*0.045;%Transmission Efficiency
mu = 0.1;%Mean Photon Number
psignal = 1 - exp(-N.*mu);
pdark = 2*8.5*10^-7;
edet = 3.3/100;
qber = (0.5*pdark + edet*psignal)./(psignal+pdark);
plot(x,qber);
xlabel('Distance(km)');
ylabel('Quantum Bit Error Rate');
title('QBER vs Distance');
%The data is according to GYS's paper

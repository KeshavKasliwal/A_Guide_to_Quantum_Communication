%Dr = 0.7m , Dt = 0.08m, Wavelength = 780nm , m = 1.318
Dr = 0.7;%Aperture Diameter of the Receiver
Dt = 0.08;%Aperture Diameter of the Transmitter
m = 1.318;%Beam Quality Factor
lambda = 780*10^-9;%Wavelength
x = [5:0.5:2500];%Distance
alpha = 20*log10((Dr*Dt)./(Dt^2 + 2.44*m.*x.*10^3*lambda)); 
N = 10.^(alpha/10 - 8/10);%Transmission Efficiency
mu = 0.8;%Signal Mean Photon Number
v1 = 0.5;%Decoy Mean Photon Number
v2 = 0;%Vacuum Mean Photon Number
%muper = 0.85;%Percentage of occurence of signal
%v1per = 0.075;%Percentage of occurence of decoy
%v2per = 0.075;%Percentage of occurence of vacuum
fe = 1.22;%Error Correction Efficiency
pdark = 10^-6;
edet = 0.01;
Qu = (Y(N,0,pdark).*exp(-mu) + Y(N,1,pdark).*exp(-mu).*mu + Y(N,2,pdark).*exp(-mu).*(mu^2)/2); %Overall Gain of the signal state
Eu = (1./Qu).*(Y(N,0,pdark).*exp(-mu).*e(N,0,pdark,edet) + Y(N,1,pdark).*exp(-mu).*mu.*e(N,1,pdark,edet) + (Y(N,2,pdark).*exp(-mu).*(mu^2).*e(N,2,pdark,edet))./2);%Overall QBER of the signal state
Qv1 = (Y(N,0,pdark).*exp(-v1) + Y(N,1,pdark).*exp(-v1).*v1 + Y(N,2,pdark).*exp(-v1).*(v1^2)/2); %Overall Gain of the decoy state
Ev1 = (1./Qv1).*(Y(N,0,pdark).*exp(-v1).*e(N,0,pdark,edet) + Y(N,1,pdark).*exp(-v1).*v1.*e(N,1,pdark,edet) + (Y(N,2,pdark).*exp(-v1).*(v1^2).*e(N,2,pdark,edet))./2);%Overall QBER of the decoy state
Qv2 = (Y(N,0,pdark).*exp(-v2) + Y(N,1,pdark).*exp(-v2).*v2 + Y(N,2,pdark).*exp(-v2).*(v2^2)/2); %Overall Gain of the vacuum state
Ev2 = (1./Qv2).*(Y(N,0,pdark).*exp(-v2).*e(N,0,pdark,edet) + Y(N,1,pdark).*exp(-v2).*v2.*e(N,1,pdark,edet) + (Y(N,2,pdark).*exp(-v2).*(v2^2).*e(N,2,pdark,edet))./2);%Overall QBER of the vacuum state
Y0L = (v1.*Qv2.*exp(v2) - v2.*Qv1.*exp(v1))./(v1-v2);
Y1L = (mu./(mu.*v1 - mu.*v2 - v1^2 + v2^2)).*(Qv1.*exp(v1) - Qv2.*exp(v2) - ((v1^2 - v2^2)/(mu^2)).*(Qu.*exp(mu) - Y0L));
Q1L = Y1L.*exp(-mu).*mu;
e1U = (Ev1.*Qv1.*exp(v1) - Ev2.*Qv2.*exp(v2))./((v1-v2).*Y1L);
r = -Qu.*fe.*entroppy(Eu) + Q1L.*(1-entroppy(e1U));
semilogy(x,r);
xlabel('Distance in km')
ylabel('Key Rate(per pulse)')
title('Key Rate vs Distance')
function x = eta(N,n) %Function for calculating the efficiency
x = 1-(1-N).^n;
end
function a = Y(N,n,pdark)%Function for calculating yield
a = [eta(N,n) + (1-eta(N,n)).*pdark]./2 ; 
end

function c = e(N,n,pdark,edet)%Function for calculating the error
c = (eta(N,n).*edet/2 + (1-eta(N,n)).*pdark/4)./Y(N,n,pdark);
%c = (edet*eta(N,n) + pdark/2)/Y(N,n,pdark); %TO BE DISCARDED
end

function y = entroppy(x)%Function for calculating the binary entropy
y = (-x.*log2(x) - (1-x).*log2(1-x));
end
 
 

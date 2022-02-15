%Secure Key Rate vs Zenith Angle
dm2t = 0.01; %Radius of the secondary mirror of the transmitting telescope
dm1t = 0.15; %Radius of the primary mirror of the transmitting telescope
dm2r = 0.05; %Radius of the secondary mirror of the receiving telescope
dm1r = 0.5;  %Radius of the primary mirror of the receiving telescope
w0 = 0.05; %Beam waist
L = 500000;%Length between the telescopes
theta = [-pi/2:pi/100:pi/2];
mu = 0.1;%Mean Photon Number
fe = 1.22;%Error Correction Efficiency
edet = 0.05;%Error of the detector 
pdark = 10^-6;%Dark Count
w = 650*10^(-9).*(L./cos(theta))./(pi*w0); %Waist Radius of the Gaussian Beam
ndiff = (exp(-2.*(dm2t^2)./w.^2) - exp(-2.*(dm1t^2)./w.^2)).*(exp(-2.*(dm2r^2)./w.^2) - exp(-2.*(dm1r^2)./w.^2));%Attenuation due to beam diffraction and obscuration
N = ndiff*0.5;%Efficiency
Qu = Y(N,0,pdark)*exp(-mu) + Y(N,1,pdark)*exp(-mu)*mu + Y(N,2,pdark)*exp(-mu)*(mu^2)/2; %Overall Gain of the photon system
%Qu = Y(N,1,pdark)*exp(-mu)*mu; %TO BE DISCARDED
Eu = (1./Qu).*(Y(N,0,pdark)*exp(-mu)*e(N,0,pdark,edet) + Y(N,1,pdark)*exp(-mu)*mu*e(N,1,pdark,edet) + (Y(N,2,pdark)*exp(-mu)*(mu^2)*e(N,2,pdark,edet))./2);%Overall QBER of the photon system
%Eu = e(N,1,pdark,edet); %TO BE DISCARDED
r = -Qu.*fe.*entroppy(Eu) + Y(N,1,pdark).*exp(-mu).*mu.*(1-entroppy(e(N,1,pdark,edet)));%Key Rate
semilogy(theta,r);%Plotting the graph
xline(0)
xlabel('Zenith Angle in rad')
ylabel('Key Rate')
title('Key rate vs Zenith Angle having telescopic parameters into consideration')
function x = eta(N,n) %Function for calculating the efficiency
x = 1-(1-N).^n;
end
function a = Y(N,n,pdark)%Function for calculating yield
a = [eta(N,n) + (1-eta(N,n))*pdark]/2 ; 
end

function c = e(N,n,pdark,edet)%Function for calculating the error
c = (eta(N,n)*edet/2 + (1-eta(N,n))*pdark/4)/Y(N,n,pdark);
%c = (edet*eta(N,n) + pdark/2)/Y(N,n,pdark); %TO BE DISCARDED
end

function y = entroppy(x)%Function for calculating the binary entropy
y = (-x.*log2(x) - (1-x).*log2(1-x));
end

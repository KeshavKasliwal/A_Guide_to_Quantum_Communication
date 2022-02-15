u = [0:0.01:50];
N = 10.^(-u./10)*0.5;
fe = 1.22;
pdark = 10^-6;
edet = 0.01;
mu = 0.1;
%delta = (1-exp(-mu)-mu.*exp(-mu))./(1-exp(-N.*mu));
Qu = Y(N,0,pdark)*exp(-mu) + Y(N,1,pdark)*exp(-mu)*mu + Y(N,2,pdark)*exp(-mu)*(mu^2)/2; %Overall Gain of the photon system
Eu = (1./Qu).*(Y(N,0,pdark)*exp(-mu)*e(N,0,pdark,edet) + Y(N,1,pdark)*exp(-mu)*mu*e(N,1,pdark,edet) + (Y(N,2,pdark)*exp(-mu)*(mu^2)*e(N,2,pdark,edet))./2);%Overall QBER of the photon system
r = -Qu.*fe.*entroppy(Eu) + Y(N,1,pdark).*exp(-mu).*mu.*(1-entroppy(e(N,1,pdark,edet)));%Key Rate
%rate_p = (1/2)*((1-delta) - fe.*entropy(e) - (1-delta).*entropy(e./(1-delta)));
semilogy(u,r);
hold on
mu = 0.03;
Qu = Y(N,0,pdark)*exp(-mu) + Y(N,1,pdark)*exp(-mu)*mu + Y(N,2,pdark)*exp(-mu)*(mu^2)/2; %Overall Gain of the photon system
Eu = (1./Qu).*(Y(N,0,pdark)*exp(-mu)*e(N,0,pdark,edet) + Y(N,1,pdark)*exp(-mu)*mu*e(N,1,pdark,edet) + (Y(N,2,pdark)*exp(-mu)*(mu^2)*e(N,2,pdark,edet))./2);%Overall QBER of the photon system
r = -Qu.*fe.*entroppy(Eu) + Y(N,1,pdark).*exp(-mu).*mu.*(1-entroppy(e(N,1,pdark,edet)));%Key Rate
semilogy(u,r,'g')
legend('mu = 0.1','mu=0.03');
xlabel('Loss in dB');
ylabel('SKR');
title('SKR vs Loss');
hold off
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

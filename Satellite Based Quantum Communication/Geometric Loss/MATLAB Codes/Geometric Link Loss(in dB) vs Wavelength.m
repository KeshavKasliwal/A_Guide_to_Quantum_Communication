%Geometric Loss
%Graph 3 - Geometric Link Loss(in dB) v/s Wavelength
%Case 1 - Dr = 1m, Dt = 0.3m , m=1.318, L=500km
Dr = 1;
Dt = 0.3;
lambda = [500:10:2000];
L=500;
m=1.318;
Gl = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L.*10^3.*lambda.*10^-9));
plot(lambda,Gl,'r');
hold on
%Case 2 - Dr = 0.7m , Dt = 0.08m, m=1.318 , L = 500km
Dr = 0.7;
Dt = 0.08;
m=1.318;
lambda = [500:10:2000];
L1 = 500;
Gl1 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L1.*10^3.*lambda.*10^-9));
plot(lambda,Gl1,'b');
%Case 3 - Dr = 0.4m , Dt = 0.08m, m=1.318 , L=500km
Dr = 0.4;
Dt = 0.08;
m=1.318;
lambda = [500:10:2000];
L2 = 500;
Gl2 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L2.*10^3.*lambda.*10^-9));
plot(lambda,Gl2,'g--');

%Case 4 - Dr = 0.28m , Dt = 0.3m, m=1.318 , L=500km
Dr = 0.28;
Dt = 0.3;
m=1.318;
lambda = [500:10:2000];
L3 = 500;
Gl3 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L3*10^3.*lambda.*10^-9));
plot(lambda,Gl3,'black');
legend('Dr = 1m, Dt = 0.3m','Dr = 0.7m , Dt = 0.08m','Dr = 0.4m , Dt = 0.08m','Dr = 0.28m , Dt = 0.3m');
xlabel('Wavelength in nm');
ylabel('Link Loss in dB');
title(["Geometric Link Loss(in dB) v/s Wavelength ","L=500km, m=1.318"]);

hold off

%Geometric Loss
%Graph 1 - Geometric Link Loss(in dB) v/s Distance
%Case 1 - Dr = 1m, Dt = 0.3m , Wavelength = 780nm, m = 1.318
Dr = 1;
Dt = 0.3;
m = 1.318;
lambda = 780*10^-9;
L = [500:10:1200];
Gl = 20*log10((Dr*Dt)./(Dt^2 + 2.44*m.*L.*10^3*lambda));
plot(L,Gl,'r');
hold on
%Case 2 - Dr = 0.7m , Dt = 0.08m, Wavelength = 780nm , m = 1.318
Dr = 0.7;
Dt = 0.08;
m = 1.318;
lambda = 780*10^-9;
L1 = [500:10:1200];
Gl1 = 20*log10((Dr*Dt)./(Dt^2 + 2.44*m.*L1.*10^3*lambda));
plot(L1,Gl1,'b');

%Case 3 - Dr = 0.4m , Dt = 0.08m, Wavelength = 780nm , m = 1.318
Dr = 0.4;
Dt = 0.08;
m = 1.318;
lambda = 780*10^-9;
L2 = [500:10:1200];
Gl2 = 20*log10((Dr*Dt)./(Dt^2 + 2.44*m.*L2.*10^3*lambda));
plot(L2,Gl2,'g--');

%Case 4 - Dr = 0.28m , Dt = 0.3m, Wavelength = 780nm , m = 1.318
Dr = 0.28;
Dt = 0.3;
m = 1.318;
lambda = 780*10^-9;
L3 = [500:10:1200];
Gl3 = 20*log10((Dr*Dt)./(Dt^2 + 2.44*m.*L3*10^3*lambda));
plot(L3,Gl3,'black');
legend('Dr = 1m, Dt = 0.3m','Dr = 0.7m , Dt = 0.08m','Dr = 0.4m , Dt = 0.08m','Dr = 0.28m , Dt = 0.3m');
xlabel('Distance in km');
ylabel('Link Loss in dB');
title(["Geometric Link Loss(in dB) v/s Distance ","Wavelength = 780nm, m=1.318"]);
hold off



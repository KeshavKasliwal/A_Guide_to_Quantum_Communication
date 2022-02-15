%Geometric Loss
%Graph 2 - Geometric Link Loss(in dB) v/s Beam Quality Factor
%Case 1 - Dr = 1m, Dt = 0.3m , Wavelength = 780nm, L=500km
Dr = 1;
Dt = 0.3;
lambda = 780*10^-9;
L=500;
m= [0.6:0.01:2];
Gl = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L.*10^3*lambda));
plot(m,Gl,'r');
hold on
%Case 2 - Dr = 0.7m , Dt = 0.08m, Wavelength = 780nm , L = 500km
Dr = 0.7;
Dt = 0.08;
m= [0.6:0.01:2];
lambda = 780*10^-9;
L1 = 500;
Gl1 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L1.*10^3*lambda));
plot(m,Gl1,'b');
%Case 3 - Dr = 0.4m , Dt = 0.08m, Wavelength = 780nm , L=500km
Dr = 0.4;
Dt = 0.08;
m= [0.6:0.01:2];
lambda = 780*10^-9;
L2 = 500;
Gl2 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L2.*10^3*lambda));
plot(m,Gl2,'g--');

%Case 4 - Dr = 0.28m , Dt = 0.3m, Wavelength = 780nm , L=500km
Dr = 0.28;
Dt = 0.3;
m= [0.6:0.01:2];
lambda = 780*10^-9;
L3 = 500;
Gl3 = 20*log10((Dr*Dt)./(Dt^2 + 2.44.*m.*L3*10^3*lambda));
plot(m,Gl3,'black');
legend('Dr = 1m, Dt = 0.3m','Dr = 0.7m , Dt = 0.08m','Dr = 0.4m , Dt = 0.08m','Dr = 0.28m , Dt = 0.3m');
xlabel('Beam Quality Factor');
ylabel('Link Loss in dB');
title(["Geometric Link Loss(in dB) v/s Beam Quality Factor ","Wavelength = 780nm, L=500km"]);
hold off



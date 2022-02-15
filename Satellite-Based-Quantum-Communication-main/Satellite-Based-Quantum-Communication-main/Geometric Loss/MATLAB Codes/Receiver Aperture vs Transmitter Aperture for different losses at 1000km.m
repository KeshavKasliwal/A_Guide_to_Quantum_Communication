%Geometric Loss
%Graph 5 - Receiver Aperture v/s Transmitter Aperture for different losses
%at 1000km
%Case 1: -45dB
Dt = [0:0.01:0.5];
G = -45;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr);
ylim([0 1]);
hold on
%Case 2: -40dB
Dt = [0:0.01:0.5];
G = -40;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr,'r');
ylim([0 1]);
%Case 3: -35dB
Dt = [0:0.01:0.5];
G = -35;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr,'g');
ylim([0 1]);
%Case 4: -30dB
Dt = [0:0.01:0.5];
G = -30;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr,'b');
ylim([0 1]);
%Case 5: -25dB
Dt = [0:0.01:0.5];
G = -25;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr);
ylim([0 1]);
%Case 6: -20 dB
Dt = [0:0.01:0.5];
G = -20;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr);
ylim([0 1]);
%Case 7: -15dB
Dt = [0:0.01:0.5];
G = -15;
m = 1.3;
L = 1000*10^3;
lambda = 780*10^-9;
Dr = (10^(G/20) * (Dt.^2 + 2.44*m*L*lambda))./(Dt);
plot(Dt,Dr);
ylim([0 1]);
legend('-45dB','-40dB','-35dB','-30dB','-25dB','-20dB','-15dB');
xlabel('Transmitter Aperture in m');
ylabel('Receiver Aperture in m');
title(["Receiver Aperture vs Transmitter Aperture","Wavelength = 780nm, m=1.318,L=1000km"]);

hold off






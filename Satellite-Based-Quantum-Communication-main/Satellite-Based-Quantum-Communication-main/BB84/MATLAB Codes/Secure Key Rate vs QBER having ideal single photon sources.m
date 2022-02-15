%Secure Key Rate vs QBER
e = [0:0.01:0.15];
fe = 1.22;%Error Correction Efficiency
%Ideal Case where we have ideal single photon sources
rate = (1/2)*(1-fe.*entropy(e)-entropy(e));
semilogy(e,rate,'r--');
xlabel('QBER');
ylabel('Secure Key Rate');
title('Secure Key Rate vs QBER');
function y = entropy(x)
y = (-x.*log2(x) - (1-x).*log2(1-x));
end

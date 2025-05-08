% DFT Program
clc;
clear;
close;
x = input('Enter the input sequence x[n]: ');
N = length(x); % Length of the input
X = zeros(1, N);%Initialize output
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j*2*pi*k*n/N);
    end
end
magX = abs(X);% Magnitude 
phX = angle(X);%Phase

% Plotting
subplot(311);
stem(0:N-1, x);
title('Input Sequence x[n]');
xlabel('discrete time');
ylabel('Amplitude');

subplot(312);
stem(0:N-1, magX);
title('Magnitude Spectrum X[k]');
xlabel('discrete frequency');
ylabel('Magnitude');

subplot(313);
stem(0:N-1, phX);
title('Phase Spectrum ');
xlabel('discrete frequency');
ylabel('Phase');
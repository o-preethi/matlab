clc;
clear;
close all;

% User inputs
fp = input('Enter passband edge frequency (Hz): '); 
fs = input('Enter stopband edge frequency (Hz): ');
rp = input('Enter passband ripple (dB): ');
rs = input('Enter stopband attenuation (dB): ');

% Sampling frequency (set sufficiently high)
Fs = 10 * max(fp, fs);  

% Normalize frequencies (convert to digital frequencies)
wp = fp / (Fs / 2); % Normalized passband edge
ws = fs / (Fs / 2); % Normalized stopband edge

% Chebyshev Type I filter design
[N1, Wn1] = cheb1ord(wp, ws, rp, rs); 
[b1, a1] = cheby1(N1, rp, Wn1, 'high');

% Chebyshev Type II filter design
[N2, Wn2] = cheb2ord(wp, ws, rp, rs); 
[b2, a2] = cheby2(N2, rs, Wn2, 'high');

% Frequency response
[H1, W1] = freqz(b1, a1, 1024, Fs); % Chebyshev I
[H2, W2] = freqz(b2, a2, 1024, Fs); % Chebyshev II

% Plot frequency response
figure;
plot(W1, 20*log10(abs(H1)), 'b'); hold on;
plot(W2, 20*log10(abs(H2)), 'm');
hold off;

legend('Chebyshev I', 'Chebyshev II');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('high-Pass IIR Filter Frequency Response');
grid on;
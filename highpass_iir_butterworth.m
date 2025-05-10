clc;
clear all;
close all;
fp=input('Enter the pass band edge frequency: ');
fs=input('Enter the stop band edge frequency: ');
rp=input('Enter ripples in pass band: ');
rs=input('Enter the ripples in stop band: ');
Fs=20*fs;
wp=2*(fp/Fs);
ws=2*(fs/Fs);
[N,wc]=buttord(wp,ws,rp,rs);
[a,b]=butter(N,wc,"high");
[H,w]=freqz(a,b);
H_mag=abs(H);
H_phase=angle(H);

subplot(2,1,1)
plot((w*Fs)/(pi*2), 20*log10(abs(H)));  
title('IIR high pass filter  frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude in dB');
subplot(2,1,2)
plot((w*Fs)/(pi*2), H_phase)            
title('high pass Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
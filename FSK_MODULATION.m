% Parameters
Fs = 10000;           % Sampling frequency (Hz)
Fc1 = 1000;           % Frequency for bit '1'
Fc0 = 500;            % Frequency for bit '0'
bit_duration = 0.01;  % Bit duration (s)
message = [1 0 1 0 1 0 1 0];  % Message bits

% Time vector for one bit
t_bit = 0:1/Fs:bit_duration-1/Fs;

% Initialize vectors
t = [];
fsk_signal = [];
carrier_display = [];  % For plotting purposes
message_signal = [];

for bit = message
    % Time indexing
    t = [t, t_bit + length(t)*1/Fs];

    % Select frequency
    if bit == 1
        c = cos(2*pi*Fc1*t_bit);
    else
        c = cos(2*pi*Fc0*t_bit);
    end
    
    % Build full signals
    fsk_signal = [fsk_signal, c];
    carrier_display = [carrier_display, cos(2*pi*Fc1*t_bit)];  % Just for visual
    message_signal = [message_signal, bit * ones(1, length(t_bit))];
end

% Plotting
figure;
subplot(3,1,1);
plot(t, carrier_display, 'm');
title('Reference Carrier Signal (for bit 1)');
ylim([-1.2 1.2]);

subplot(3,1,2);
plot(t, message_signal, 'r');
title('Message Signal');
ylim([-0.2 1.2]);

subplot(3,1,3);
plot(t, fsk_signal, 'b');
title('FSK Output');
ylim([-1.2 1.2]);
xlabel('Time (s)');
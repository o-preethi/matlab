% Parameters
Fs = 10000;           % Sampling frequency (Hz)
Fc = 1000;            % Carrier frequency (Hz)
bit_duration = 0.01;  % Bit duration (s)
message = [1 0 1 0 1 0 1 0];  % Message bits

% Time vector for one bit
t_bit = 0:1/Fs:bit_duration-1/Fs;

% Initialize signals
t = [];
carrier = [];
message_signal = [];
psk_signal = [];

for bit = message
    % Time indexing
    t = [t, t_bit + length(t)*1/Fs];
    
    % Carrier wave with phase shift for bit '0'
    if bit == 1
        c = cos(2*pi*Fc*t_bit);        % 0° phase
    else
        c = cos(2*pi*Fc*t_bit + pi);   % 180° phase shift
    end
    
    % Build full signal
    carrier = [carrier, cos(2*pi*Fc*t_bit)];
    message_signal = [message_signal, bit * ones(1, length(t_bit))];
    psk_signal = [psk_signal, c];
end

% Plotting
figure;
subplot(3,1,1);
plot(t, carrier, 'm');
title('Carrier Signal');
ylim([-1.2 1.2]);

subplot(3,1,2);
plot(t, message_signal, 'r');
title('Message Signal');
ylim([-0.2 1.2]);

subplot(3,1,3);
plot(t, psk_signal, 'b');
title('PSK Output');
ylim([-1.2 1.2]);
xlabel('Time (s)');
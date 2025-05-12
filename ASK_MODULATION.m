% Parameters
Fs = 10000;           % Sampling frequency (Hz)
Fc = 1000;            % Carrier frequency (Hz)
bit_duration = 0.01;  % Bit duration (s)
message = [1 0 1 0 1 0 1 0];  % Message bits

% Time vector for one bit
t_bit = 0:1/Fs:bit_duration-1/Fs;

% Full time vector
t = [];
carrier = [];
message_signal = [];
ask_output = [];

for bit = message
    % Append time
    t = [t, t_bit + length(t)*1/Fs];
    
    % Carrier wave for one bit
    c = cos(2*pi*Fc*t_bit);
    carrier = [carrier, c];
    
    % Message signal (0 or 1)
    m = bit * ones(1, length(t_bit));
    message_signal = [message_signal, m];
    
    % ASK modulation
    ask_output = [ask_output, m .* c];
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
plot(t, ask_output, 'b');
title('ASK Output');
ylim([-1.2 1.2]);
xlabel('Time (s)');
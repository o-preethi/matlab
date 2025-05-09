fs = 1000;          % Sampling frequency
t = 0:1/fs:1;       % Time 
f = 5;              % Frequency 
A = 1;            % Amplitude 

% Generation of waveforms
sinewave = A * sin(2 * pi * f * t);               
squarewave = A * square(2 * pi * f * t);           
trianglewave = A * sawtooth(2 * pi * f * t, 0.5);  
sawtoothwave = A * sawtooth(2 * pi * f * t);       


% Sine Wave
subplot(411);
plot(t, sinewave);
title('Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% Square Wave
subplot(412);
plot(t, squarewave);
title('Square Wave');
xlabel('Time (s)');
ylabel('Amplitude');


% Triangle Wave
subplot(413);
plot(t, trianglewave);
title('Triangle Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% Sawtooth Wave
subplot(414);
plot(t, sawtoothwave);
title('Sawtooth Wave');
xlabel('Time (s)');
ylabel('Amplitude');



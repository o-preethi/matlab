function X = fft_16pt(x)
    % 16-point FFT using Radix-2 DIT
    N = 16;
    if length(x) ~= N
        error('Input vector must be of length 16.');
    end

    % Bit-reversal permutation
    br_indices = bitrevorder(0:N-1) + 1;
    x = x(br_indices);

    % FFT computation
    stages = log2(N);
    for s = 1:stages
        m = 2^s;
        wm = exp(-1j*2*pi/m);
        for k = 1:m:N
            for j = 0:(m/2)-1
                t = wm^j * x(k + j + m/2);
                u = x(k + j);
                x(k + j) = u + t;
                x(k + j + m/2) = u - t;
            end
        end
    end

    X = x;
end

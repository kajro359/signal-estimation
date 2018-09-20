function y = psd_smoothing(x, M, type)
%SMOOTHING Summary of this function goes here
%   Detailed explanation goes here
global N;
if mod(M,2) == 0
    M = M-1; %N must be odd
end

%w = zeros(1, 2*N);

switch type
    case 'rect'
        w = rectwin(M);
        w = w';
        w = padarray(w, [0 length(x)-length(w)], 'post');
        W = fft(w);
        plot(abs(W))
        y1 = conv(W, x);
        y = y1(1:size(x));
end     

end


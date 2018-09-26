function y = psd_smoothing(x, M, type)
%SMOOTHING Smooths a signal
%   Convolves a signal 

%smooth individual segments in per_avg=========?
%may need to scale the transform
global N;
if mod(M,2) == 0
    M = M-1; %N must be odd
end

switch type
    case 'rect'
        w = rectwin(M);
    case 'hamming'
        w = hamming(M);
    case 'blackman' 
        w = blackman(M);
end         
        w = w';
        w = padarray(w, [0 N/2 - floor(length(w)/2) - 1], 0, 'both');
        w = [w 0];
        plot(w)
        %disp(length(w))
        W = fft(w);
        %plot(abs(W))
        y = conv(W, x, 'same');
        %y = y1(1:size(x));

end


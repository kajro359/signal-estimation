function y = psd_smoothing_OLD(X, M, type)
%SMOOTHING Smooths a dataset
%   M is width of window
%   X the data to be smoothed
%   type is type of window used('rect', 'hamming' or 'blackman')

%smooth individual segments in per_avg=========?
%may need to scale the transform
global N;
if mod(M,2) == 0
    M = M-1; %N must be odd
end

switch type
    case 'rect'
        w = rectwin(M) / M;
    case 'hamming'
        w = hamming(M) / M;
    case 'blackman' 
        w = blackman(M) / M;
end         
        w = w';
        w = padarray(w, [0 N/2 - floor(length(w)/2) - 1], 0, 'both');
        w = [w 0];
        plot(w)
        disp(length(w))
        W = fft(w);
        %plot(abs(W))
        y = conv(W, X, 'same');
        %y = y1(1:size(x));

end


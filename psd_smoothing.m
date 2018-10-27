function psd = psd_smoothing(x,type, winlength)
%IMPROVED_EST Returns smoothed version of PSD 
%   input: 'x' is an averaged PSD
M = floor(winlength);
N = winlength * 10;
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
        disp('aaaa')
        disp(length(w))
        w = padarray(w, [0 N - floor(length(w)/2) - 1], 0, 'both');
        w = [w 0];
%         figure(2)
%         plot(w)
%         disp(length(w)) 
        
%         rx = acf_est(x); 
%         acf = rx .* w;
        w = 2 * w / M; 
%         Rx = psd_est(x);
      
        Rx2 = [x x x];
        psd1 = conv(Rx2,w, 'same'); %this is the smoothing from p227
        psd = psd1(N+1 : 2*N);

end


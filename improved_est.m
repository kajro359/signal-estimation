function [acf,psd] = improved_est(x,type, winlength)
%IMPROVED_EST Returns smoothed version of PSD and ACF multiplied by a
%window
%   Detailed explanation goes here
M = floor(winlength);
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
        w = padarray(w, [0 N - floor(length(w)/2) - 1], 0, 'both');
        w = [w 0];
%         figure
%         plot(w)
      
%         disp(length(w)) 
%         
%         disp(length(w)) 
        rx = acf_est(x); 
        acf = rx .* w;
% %         W=fft(w);
%         figure(322)
%         plot(abs(W));
        
%         psd = ifft(acf);
        w = 2*w / M; 
      %%fffffffffffffffff
%         figure; plot(w)
        Rx = psd_est(x);
        Rx2 = [Rx Rx Rx];
        psd1 = conv(Rx2,w, 'same'); %this is the smoothing from p227
        
        psd = psd1(N+1 : 2*N);
%         psd = cconv(Rx,W); %trying to do it right, with the transform of window........
end


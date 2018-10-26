function [acf,psd] = improved_est(x,type, winlength)
%UNTITLED2 Summary of this function goes here
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
%         plot(w)
        disp(length(w)) 
        
        rx = acf_est(x); 
        acf = rx .* w;
        w = w / M; 
        Rx = psd_est(x);
        Rx2 =[Rx Rx Rx];
        psd1 = conv(Rx2,w, 'same');
        psd = psd1(N+1 : 2*N);

end


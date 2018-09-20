function Ry_hat = psd_est(y)
%PSD_EST Returns the estimated powered spectral density of input process y
%   A periodogram estimating the PSD is produced 
%global N;
%ry_hat = acf_est(y);
%Ry_hat = fft(ry_hat);

N = length(y);
Y = fft(y);
Ry_hat = (abs(Y) .^ 2) / N;


end


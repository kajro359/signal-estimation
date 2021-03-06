function R_hat_avg = per_avg(y, K)
%PER_AVG Returns an averaged periodogram of a signal
%   Calculates K estimated periodograms and returns the average of these.
%   This is known as Bartlett's method. Input is a signal, NOT an estimated PSD!
global N;
% 
% while mod(N,K) ~= 0
%     K = K + 1;
% end

L = N / K; %length of one segment 
M = floor(L);
R_hat_avg = zeros(1,M);

for i = 1 : K
    R_hat_avg = R_hat_avg + psd_est(y((i-1)*M + 1 : i*M));
end

R_hat_avg = R_hat_avg/K;

end


function r_hat = ACF_est(y)
%ACF_EST Estimates the auto correlation function of signal
%   A given signal y's auto correlation function is estimated using
%   Bartlett's Estimate
    global N;
    r_hat = zeros(1,N);
    %i ~ k, j ~ n
    for i = 1:N 
        for j = 0:N-i-1
            r_hat(i) = r_hat(i) + y(j+i+1)*y(j+1);
        end
    end
    r_hat = r_hat/N;
end


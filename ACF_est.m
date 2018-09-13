function r_hat = ACF_est(y)
%ACF_EST Estimates the auto correlation function of signal
%   A given signal y's auto correlation function is estimated using
%   Bartlett's Estimate
    global N;
    global count;
    r_hat = zeros(1,N);
    %do r_hat(1) separately
    r_hat(1) = y(1)*y(1);
    for h = 2:N-1
        r_hat(1) = r_hat(1) + y(h+1)*y(h);
        count = count + 1;
    end
    %i ~ k, j ~ n
    
    for i = 2:N 
        for j = 1:N-i-1
            r_hat(i) = r_hat(i) + y(j+i+1)*y(j+1);
        end
    end
    r_hat = r_hat/N;
end


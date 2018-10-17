function r_hat = acf_est(y)
%ACF_EST Estimates the auto correlation function of signal
%   A given signal y's auto correlation function is estimated using
%   Bartlett's Estimate
    global N K;
    %global count;
    M = K;
    r_hat = zeros(1, 2*N);
    r_hat1 = zeros(1,N);
    %do r_hat1(1) separately, this corresponds to k = 0 in r
 
    for h = 1:N-1
        r_hat1(1) = r_hat1(1) + y(h)*y(h);
%         count = count + 1;
    end

    for h = 1:N-1
        r_hat1(1) = r_hat1(1) + y(h)*y(h);
%         count = count + 1;
    end
    
    
     for i = 2:N       
        for j = 1:N-(i-1)  % should remake this to use |k| as in book, to avoid the flipping operation below
            r_hat1(i) = r_hat1(i) + y(j+(i-1))*y(j);
        end       
     end    
    
    r_hat1 = r_hat1/N;
    
    r_hat(1:N) = flip(r_hat1); %this works if process is WSS? white noise is WSS
    r_hat(N+1:end) = r_hat1;
end


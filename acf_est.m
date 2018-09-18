function r_hat = acf_est(y)
%ACF_EST Estimates the auto correlation function of signal
%   A given signal y's auto correlation function is estimated using
%   Bartlett's Estimate
    global N;
    global count;
    r_hat = zeros(1, 2*N);
    r_hat1 = zeros(1,N);
    %do r_hat1(1) separately, this corresponds to k = 0 in r
%     r_hat1(1) = y(1)*y(1);
    for h = 1:N-1
%         r_hat1(1) = r_hat1(1) + y(h+1)*y(h);
  
        r_hat1(1) = r_hat1(1) + y(h)*y(h);
%         count = count + 1;
    end

    %i ~ k, j ~ n
%     %i = 2 -> k = 1

%     for i = 2:N  
%         for j = 1:N-i-1
%             r_hat1(i) = r_hat1(i) + y(j+i+1)*y(j+1);
%         end
%     end
    %i ~ k, j ~ n
%     %i = 2 -> k = 1
     for i = 2:N      
        for j = 1:N-(i-1)
            r_hat1(i) = r_hat1(i) + y(j+(i-1))*y(j);
           
        end       
     end    
    
    r_hat1 = r_hat1/N;
    
    r_hat(1:N) = flip(r_hat1); %this works if process is WSS? white noise is WSS
    r_hat(N+1:end) = r_hat1;
end


function r_hat = acf_est_alt(x)
%Takes the signal x and returns the estimated ACF r_hat at k
%Estimation by Bartlett's method
N = max(size(x));
r_hat = zeros(1,N);

for k = -N/2+1:N/2
    s = 0;
    for n = 1:(N-abs(k))
        s = s+x(n+abs(k))*x(n);
    end
    r_hat(k+N/2) = s;    
    r_hat(k+N/2) = r_hat(k+N/2)/(N); 
end     
end
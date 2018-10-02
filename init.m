%instructions: 
%Run 'init.m'. This gives a signal of noise and two filtered versions of this
%signal.
%
%Then use functions 'acf_est' and 'psd_est' to estimate ACF and PSD
%of a signal.
%Use 'per_avg' to produce an averaged periodogram for a signal.


global N t k h count Theta;

count = 0;
N = 2^10; %set to 2^16 for demo
t = (0:1:N-1);
k = t;
h = exp(-t); %first order filter in the time-domain

freq = 0 : 2*pi / N : 2*pi - (2*pi) / N; %normalized frequency vector
normfreq = freq / (2 * pi);

K = [-flip(k) k];

%x = wgn(1, N, 0);
x = randn(1, 2^10); 
rx_hat = acf_est(x);

%%
[b, a] = butter(1, 0.5); %first-order LP-filter
y=filter(b, a, x); 

[d, c] = butter(7, 0.5); %7:th-order LP-filter, approximating ideal filter
yb = filter(d, c, x);

[f, e] = cheby1(7, 0.5, 0.5);
yc = filter(f, e, x);

ry_hat = acf_est(y);
ryb_hat = acf_est(yb);
ryc_hat = acf_est(yc);



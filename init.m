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

Theta = (0:2*N-1)/(2*N-1); %normalized frequency vector

K = [-flip(k) k];

%x = wgn(1, N, 0);
x = randn(1, 2^10); 

[b,  a] = butter(1, 0.5); %first-order LP-filter
y=filter(b, a, x); 

[d, c] = butter(7, 0.5); %7:th-order LP-filter, approximating ideal filter
y1 = filter(d, c, x);
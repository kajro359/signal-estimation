%instructions: 
%Run 'init.m'. This gives a signal of noise and two filtered versions of this
%signal.
%
%Then use functions 'acf_est' and 'psd_est' to estimate ACF and PSD
%of a signal.
%Use 'per_avg' to produce an averaged periodogram for a signal.


global fs n N t tl k K h count;

tl = 10; %i'm setting the length in time of noise-signal to tl seconds.

count = 0;
N = 2^10; %set to 2^16 for demo
t = (0:1:N-1);
k = (-N/2:1:N/2-1);
n = t;
% k = t;
h = exp(-t); %first order filter in the time-domainx
fs = N / tl; % sampling frequency.. ??

freq = 0 : 2*pi / N : 2*pi - (2*pi) / N; %normalized frequency vector ( ?? rad/s)(???)
normfreq = freq / (2 * pi);


K = [-flip(n) n+1];

x = wgn(1, N, 0);
% x2 = randn(1, N); 
% rx_hat = acf_est(x);
% figure(1), plot(x);
% figure(2), plot(x2);

%%
[b, a] = butter(1, 0.5); %first-order LP-filter
%a1, b1 numerator, denominator for 1st order filter.. doesn't seem so
% %good-...
a1 = 1;
b1 = [0.5 0.5];

y=filter(b, a, x);
% y33 = filter(lpFilt, x);
y2 = filter(b1, a1, x);
% y2 = simplp(x);
% figure(1)
% subplot(121), plot(y), axis tight, title('butter-filtered');
% subplot(122), plot(y2), axis tight, title('homemade-filtered');
%%

[d, c] = butter(7, 0.5); %7:th-order LP-filter, approximating ideal filter

yb = filter(d, c, x);
%%
[f, e] = cheby1(7, 0.5, 0.5);
yc = filter(f, e, x);
% ry_hat = acf_est(y);
% ryb_hat = acf_est(yb);
% ryc_hat = acf_est(yc);
% a2 = 1;
% b2 = [1 1 1 1 1 1 1] / 7;
% y3 = filter(b2, a2, x);
%%
figure(2)
subplot(121), plot(y), axis tight, title('low order-filtered');
subplot(122), plot(yb), axis tight, title('high order butter-filtered');

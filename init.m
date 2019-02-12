%instructions: 
%Run 'init.m'. This gives a signal of noise and two filtered versions of this
%signal.
%
%Then use functions 'acf_est' and 'psd_est' to estimate ACF and PSD
%of a signal.
%Use 'per_avg' to produce an averaged periodogram for a signal.


global n N t tl k K count theta theta0;

tl = 10; %i'm setting the length in time of noise-signal to tl seconds.

count = 0;
N = 2^16; %set to 2^16 for demo
t = (0:1:N-1);
k = (-N/2:1:N/2-1);
n = t;
% % k = t;
% h = exp(-t); %first order filter in the time-domainx
% fs = N / tl; % sampling frequency.. ??
% cutoff = 0.25;



freq = 0 : 2*pi / N : 2*pi - (2*pi) / N; %normalized frequency vector ( ?? rad/s)(???)
normfreq = freq / (2 * pi);
R0 = 1;     %amplitude of noise PSD
theta0 = 0.15; %normalized cut-off frequency

theta = normfreq;

amp = 1 / (2*theta0);

% amp = 1 / (theta0);

K = [-flip(n) n+1];

% x = wgn(1, N, 0);
x = randn(1, N); 
% rx_hat = acf_est(x);
% figure(1), plot(x);
% figure(2), plot(x2);

%%
% [b, a] = butter(1, theta0); %first-order LP-filter
%a1, b1 numerator, denominator for 1st order filter.. doesn't seem so
% %good-...
a1 = [1 -0.5];
b1 = 1; %this here coefficient may need tweaking (181127) I THINK FILTER IS CORRECT NOW?? (181128)
% G = sum(a1)+sum(b1)
% a1 = a1/G;
% b1 = b1/G;
% figure
% freqz(b1,a1)

y=filter(b1, a1, x);
% y33 = filter(lpFilt, x);
% y2 = filter(b1, a1, x);
% y2 = simplp(x);
% figure(1)
% subplot(121), plot(y), axis tight, title('butter-filtered');
% subplot(122), plot(y2), axis tight, title('homemade-filtered');
%% ideal filter

[d, c] = butter(10, 2*theta0); %7:th-order LP-filter, approximating ideal filter
d = amp * d;                    %WITH THIS TJE FILTER IS GOOD. USE THIS CELL
% fvtool(d,c)
yb = filter(d, c, x);
%% maybe a better appr. ideal filter
% lpFilt = designfilt('lowpassfir','PassbandFrequency',0.25, ...
%          'StopbandFrequency',0.35,'PassbandRipple',0.5, ...
%          'StopbandAttenuation',65,'DesignMethod','kaiserwin');
% fvtool(lpFilt)
%%
% yb = filter(lpFilt, x);

% %%
% [f, e] = cheby1(7, 0.5, 0.5);
% yc = filter(f, e, x);
% % ry_hat = acf_est(y);
% ryb_hat = acf_est(yb);
% Ryb_hat = psd_est(yb);

% ryc_hat = acf_est(yc);
% a2 = 1;
% b2 = [1 1 1 1 1 1 1] / 7;
% y3 = filter(b2, a2, x);
% %%
% figure(2)
% % subplot(121), plot(y), axis tight, title('low order-filtered');
% % subplot(122),x 
% plot(abs(fft(yb))), axis tight, title('high order butter-filtered');

% [b,  a] = butter(1, 0.5);
% y=filter(b, a, x);

% [d, c] = butter(7, 0.5);
% 
% y1 = filter(d, c, x);
Ry_hat = psd_est(y);
Ryb_hat = psd_est(yb);
Y = abs(fft(y));
Yb = abs(fft(yb));
% Y33 = abs(fft(y33));
figure(1)
subplot(221)
plot(y)
title('y, butter-1-filtered')
subplot(222)
plot(yb)
title('yb, butter-7-filtered')
subplot(223)
plot(Y)
title('Y');
subplot(224)
plot(Yb)
title('Yb');

X = fft(x);
figure(3)
plot(abs(X));
% figure(1)
% subplot(121)
% plot(Rx_avg)
% axis([0 25 0 6])
% title('averaged periodogram');
% subplot(122)
% plot(abs(Rx_smooth))
% title('smoothed averaged periodogram');
% axis([0 25 0 6])


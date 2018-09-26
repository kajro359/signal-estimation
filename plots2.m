% [b,  a] = butter(1, 0.5);
% y=filter(b, a, x);
% 
% [d, c] = butter(7, 0.5);
% 
% y1 = filter(d, c, x);
% 
% figure(1)
% subplot(121)
% plot(y)
% title('y, butter-1-filtered')
% subplot(122)
% plot(y1)
% title('y1, butter-7-filtered')
figure(1)
subplot(121)
plot(Rx_hat_avg)
axis([0 25 0 6])
title('averaged periodogram');
subplot(122)
plot(abs(Rx_hat_smooth))
title('smoothed averaged periodogram');


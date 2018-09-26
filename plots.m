% global N;
% figure(1)
% plot(K, rx_hat)
% title('rx hat')
% axis([-N N -0.5 1]);
% 
% figure(2)
% plot(K, abs(Ry_hat))
% title('Ry hat')
% axis([-N N]);

figure(1)
subplot(131), plot(y);
axis([0 1024 -4 4])
title('1:st order LP-filtered');
subplot(132), plot(yb);
axis([0 1024 -4 4])
title('butter 7:th order LP-filtered');
subplot(133), plot(yc);
axis([0 1024 -4 4])
title('cheby1 7:th order LP-filtered');

figure(2)
plot(x)
axis([0 1024 -4 4]);
title('noise-signal');

tau = (-1023 : 1024);
figure(3) 
plot(tau, ry_hat)
axis tight;
title('ry estimate')

figure(4) 
plot(tau, ryb_hat)
axis tight;
title('ryb estimate')

figure(5) 
plot(tau, ryc_hat)
axis tight;
title('ryc estimate')
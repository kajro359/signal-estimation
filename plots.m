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
subplot(132), plot(y2);
axis([0 1024 -4 4])
title('butter 7:th order LP-filtered');
subplot(133), plot(y);
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
plot(tau, ry1_hat)
axis tight;
title('ry1 estimate')
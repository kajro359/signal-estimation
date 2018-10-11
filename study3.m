%% squarer, low degree filter

%theoretical squarer output PSD
f0 = 0.2;
tt = linspace(-1, 1);


Rz_sq_0 = 4*f0*dirac(tt) + 4 * f0 * triangularPulse(-(1 / 2 * f0), 0, (1 / 2 * f0), tt);
plot(Rz_sq_0);
%%

% z_sq = y .^2;

z_sq2 = yb .^2;

rz_sq = acf_est(z_sq2);
Rz_sq = psd_est(z_sq2);

Rz_a = simple_smooth(per_avg(z_sq2, 20));
figure(2)
subplot(121),plot(Rz_sq), title('squard sig PSD');
axis([0 1024 0 10]);
subplot(122),plot(Rz_a), title('squard sig PSD, averaged');
% subplot(133), stem(rz_sq(1024-40 : 1024 + 40)), title('ACF -40 : 40');

%% squarer, better filter -- already did this above. 
rz_sq2 = simple_smooth(acf_est(z_sq2));
Rz_sq2 = psd_est(z_sq2);

Rz_a2 = simple_smooth(per_avg(z_sq2, 20));

%% plots
u = linspace(-5,5);
rz_t = (sinc(u)).^2 + 0.5;
% 
figure(3); 
subplot(221), plot(rz_sq);
subplot(222), plot(rz_t);
subplot(223), stem(rz_sq2(1024-40 : 1024 + 40));
% figure(2)
% subplot(121), plot(rz_sq2);
% subplot(122), plot(rz_t);

% figure(1);
% subplot(131), plot(rz_sq);
% subplot(132), plot(Rz_sq);
% subplot(133), plot(Rz_a);
% 
% figure(2);
% subplot(131), plot(rz_sq2);
% subplot(132), plot(Rz_sq2);
% subplot(133), plot(Rz_a2);
%% half wave rectifier
%ideally filtered signal
z_hw = hw_rect(yb);

rz_hw = acf_est(z_hw);
Rz_hw = psd_est(z_hw);

%high-degrre
% z_hw2 = hw_rect(yb);

figure(3)
subplot(221), plot(rz_hw), title('rz hw');
subplot(222), plot(Rz_hw), title('Rz hw');
subplot(223), stem(rz_hw(1024-40 : 1024 + 40));
%% AM-SC
%ideally filtered
z_am = yb .* cos(0.9 * t);

rz_am = simple_smooth(acf_est(z_am));
Rz_am = psd_est(z_am);
Rz_am_a = simple_smooth(per_avg(z_am, 10));
figure(5);
subplot(221), plot(rz_am), title('rz (am)');
subplot(222), plot(Rz_am), title('Rz (am)');
axis([0 1024 0 5]);
subplot(224), plot(Rz_am_a), title('Rz (am), smoothed');
subplot(223), stem(rz_am(1024-40 : 1024 + 40));
%% squarer, low degree 

z_sq = y .^2;
z_sq2 = yb .^2;

rz_sq = simple_smooth(acf_est(z_sq));
Rz_sq = psd_est(z_sq);

Rz_a = simple_smooth(per_avg(z_sq, 20));

%% better filter
rz_sq2 = simple_smooth(acf_est(z_sq2));
Rz_sq2 = psd_est(z_sq2);

Rz_a2 = simple_smooth(per_avg(z_sq2, 20));

%% plots
u = linspace(-5,5);
rz_t = (sinc(u)).^2 + 0.5;
% 
figure(1); 
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
%low-degree lfiltered signal
z_hw = hw_rect(yb);

rz_hw = acf_est(z_hw);
Rz_hw = psd_est(z_hw);

%high-degrre signal
z_hw2 = hw_rect(yb);

figure(3)
subplot(221), plot(rz_hw), title('rz hw');
subplot(222), plot(Rz_hw), title('Rz hw');
subplot(223), stem(rz_hw(1024-40 : 1024 + 40));
%% AM-SC
%low degree filtered
z_am = yb .* cos(0.2 * t);

rz_am = simple_smooth(acf_est(z_am));
Rz_am = psd_est(z_am);
Rz_am_a = simple_smooth(per_avg(z_am, 10));
figure(5);
subplot(131), plot(rz_am);
subplot(132), plot(Rz_am);
axis([0 1024 0 5]);
subplot(133), plot(Rz_am_a);
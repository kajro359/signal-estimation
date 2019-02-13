%% squarer, low degree filter

%theoretical squarer output PSD
f0 = 0.3;
tt = linspace(-1, 1);

% Rz_sq_0 = 4*f0*dirac(tt) + 4 * f0 * triangularPulse(-(1 / (2 * f0)), 0, (1 / (2 * f0)), tt);
% thetaz = 0 : 1 / length(Rz_sq_0) : 1 - 1 / length(Rz_sq_0);

% plot(Rz_sq_0), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
%     ylabel('$R_{Z_{sq}}[\theta]$','Interpreter','latex', 'fontsize', 20);

%% squarer
%theoretical PSD this is the correct one
theta_a = linspace(0,1,1000);
%%
% Rz_sq_t = 4 * R0^2 * theta0 * triangularPulse(-theta0, 0, theta0, theta_a) + ...
%     dirac(theta_a) * (2 * R0 * theta0)^2 + ...
%     4 * R0^2 * theta0 * triangularPulse(-theta0 + 1, 1, theta0 + 1, theta_a) + ...
%     dirac(theta_a-1) * (2 * R0 * theta0)^2; 
% plot(theta_a, Rz_sq_t)
%% calulation 181207, changed coefficient IT IS CORRECT. Just double-check the transform
Rz_sq_t = 1/(4 * (theta0^3)) * triangularPulse(-theta0*2, 0, theta0*2, theta_a) + ...
    dirac(theta_a) * (2 * R0 * theta0)^2 + ...
    1/(4 * (theta0^3)) * triangularPulse(-theta0*2 + 1, 1, theta0*2 + 1, theta_a) + ...
    dirac(theta_a-1) * (2 * R0 * theta0)^2; 


% Rz_sq_t=linspace(0,1,1000);
% Rz_sq_t=zeros(1,1000);
% Rz_sq_t(1:300) = 1-theta_a(1:300)*10/3;
% Rz_sq_t(end-300+1:end) = theta_a(1:300)*10/3;
% Rz_sq_t = Rz_sq_t * 2 * (R0/theta0)^2;

Rz_sq_t(1) = 9999;
Rz_sq_t(end) = 9999;
%%
figure(1)

plot(theta_a,Rz_sq_t), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$R_{Z_{sq}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 200]);
% axis tight;
%%
z_sq2 = yb .^ 2;

% rz_sq = acf_est(z_sq2);

Rz_sq = psd_est(z_sq2);
Rz_sq_avg = per_avg(z_sq2, N/100);
% [rz_sq_mult,Rz_sq_smooth] = improved_est(z_sq2, 'hamming', N/100);
thetaz = 0 : 1 / length(Rz_sq) : 1 - 1 / length(Rz_sq);
%% squarer figure
figure(2)
plot(thetaz,Rz_sq), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{R}_{Z_{sq}}(\theta)$','Interpreter','latex', 'fontsize', 20), axis([0 1 0 200]);
hold on;
plot((0:1/length(Rz_sq_avg):1-1/length(Rz_sq_avg)),Rz_sq_avg, 'color', 'k', 'LineWidth', 1);
plot(theta_a,Rz_sq_t, 'color', 'r');
% plot(theta,Rz_sq_smooth, 'color', 'r', 'LineWidth', 1);axis([0 1 0 20])
hold off;
% axis tight;
%% squarer, better filter -- already did this above. 
% rz_sq2 = simple_smooth(acf_est(z_sq2));
% Rz_sq2 = psd_est(z_sq2);
% 
% Rz_a2 = simple_smooth(per_avg(z_sq2, 20));

%% plots
% u = linspace(-5,5);
% rz_t = (sinc(u)).^2 + 0.5;
% % 
% figure(3); 
% subplot(221), plot(rz_sq);
% subplot(222), plot(rz_t);
% subplot(223), stem(rz_sq2(1024-40 : 1024 + 40));
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
theta_hw = 0 : 1 / length(z_hw) : 1 - 1 / length(z_hw);
%theoretical PSD
% z_hw_th = (2 * R0 *theta0 * 1 / 2 * pi) * dirac(theta) + ; 
%%
Rz_hw_t = (R0 / (4*pi*theta0)) * dirac(theta_a+1/2) + (R0 / (16 * (theta0 ^ 2))) * rectangularPulse(-theta0+1/2, theta0+1/2, theta_a) + (R0 /(16 * (theta0^2)))*(2*theta0/R0) * triangularPulse(-theta0*2 + 1/2, 1/2, theta0*2 + 1/2, theta_a);
Rz_hw_t = Rz_hw_t([length(Rz_hw_t)/2+1:length(Rz_hw_t) 1:length(Rz_hw_t)/2]);
Rz_hw_t(1) = 9999;
Rz_hw_t(end) = 9999;
%%

% Rz_hw_t = (R0 / (4*pi*theta0)) * dirac(theta_a) + (R0 / (16 * theta0 ^ 2)) * rectangularPulse(-theta0/2, theta0/2, theta_a) + (R0 /(16 * theta0^2)) * triangularPulse(-theta0, 0, theta0, theta_a);
%%
thetahw = 0 : 1 / length(Rz_hw_t) : 1 - 1 / length(Rz_hw_t);
%%
figure(222)
plot(theta_a,Rz_hw_t), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$R_{Z_{hw}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 25]);
    
%%
% rz_hw = acf_est(z_hw);
Rz_hw = psd_est(z_hw);
% [rz_hw_mult,Rz_hw_smooth] = improved_est(z_hw, 'hamming', N/100);
%%
figure(3)

plot(theta,Rz_hw), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{R}_{Z_{hw}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 25]);
hold on;

Rz_hw_avg = per_avg(z_hw, N/100);
plot((0:1/length(Rz_sq_avg):1-1/length(Rz_sq_avg)),Rz_hw_avg, 'color', 'k', 'LineWidth', 1);
% plot(theta,Rz_hw_smooth, 'color', 'k', 'LineWidth', 1);axis([0 1 0 5])
% subplot(221), plot(rz_hw), title('rz hw');
% subplot(222), plot(Rz_hw), title('Rz hw');
% subplot(223), stem(rz_hw(1024-40 : 1024 + 40));
% axis tight
%% AM-SC
%ideally filtered
% figure(1)
% plot(theta, psd_est(yb)), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
%     ylabel('$\hat{R}_{Y_2}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 10]);
%%
omega = 0.8; %normalized carrier frequency 
m = (0:1:N-1);
z_am = yb .* cos(2*pi*omega * m); %i think this is right but if not we need to remove 2*pi and put 2*pi in theoretical psd


% theoretical psd
%%
% Rz_am_t = theoretical_psd(omega - theta0, omega + theta0);
% Rz_am_t = (R0 / 4) * (rectangularPulse(omega - theta0/2, omega + theta0/2, theta) + rectangularPulse(-omega - theta0/2,-omega + theta0/2, theta));
%%
% figure(1)
% plot(theta,Rz_am_t),xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
%     ylabel('${R}_{Z_{am}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 1]);

%% alternative theoretical psd THIS GOOD

rep = -omega : 1 : 1;
rep1 = omega : 1 : 1;
width = 4 * theta0;

% Rz_am_t2 = (R0 / (4 * theta0^2)) * pulstran(theta, rep, 'rectpuls', width / 2);
Rz_am_t2 = (1/4) * (R0 / (4 * theta0^2)) * (pulstran(theta, rep, 'rectpuls', width / 2) + pulstran(theta, rep1, 'rectpuls', width / 2)); %theoretical psd
figure(322)
plot(theta,Rz_am_t2),xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('${R}_{Z_{am}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 25]);
%     axis tight;
    %%
%   Rz_am_t3 = zeros(1,N)
%   rz_am_t3 
%     
    
%% Estimated PSD (AM)
% rz_am = simple_smooth(acf_est(z_am));
Rz_am = psd_est(z_am);
%

% [rz_am_mult,Rz_am_smooth] = improved_est(z_am, 'hamming', N/100);
figure(4)
plot(theta, Rz_am), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{R}_{Z_{am}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 25]);
    
    
hold on;

Rz_am_avg = per_avg(z_am, N/100);
plot((0:1/length(Rz_sq_avg):1-1/length(Rz_sq_avg)),Rz_am_avg, 'color', 'k', 'LineWidth', 1);
% plot(theta,Rz_am_smooth, 'color', 'k', 'LineWidth', 1);axis([0 1 0 5])
% Rz_am_a = simple_smooth(per_avg(z_am, 10));
% figure(5);
% subplot(221), plot(rz_am), title('rz (am)');
% subplot(222), plot(Rz_am), title('Rz (am)');
% axis([0 1024 0 5]);
% subplot(224), plot(Rz_am_a), title('Rz (am), smoothed');
% subplot(223), stem(rz_am(1024-40 : 1024 + 40));

% axis tight;
%% amplitude distributions
figure(11)
histogram(yb)
figure(12)
histogram(z_sq2), axis([0 10 0 18000]);
figure(13)
histogram(z_hw), axis([0 3 0 35000]);
figure(14)
histogram(z_am)

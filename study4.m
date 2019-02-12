
% yb is high order filtered noise. -1 1 -1 1 
global n;
global N;
%theoretical PSD
%a - alternating sequence
rep = 0.5 : 1 : 1;
width = 2 * theta0;
Rz_a_t = (R0 / (4 * (theta0^2))) * pulstran(theta, rep, 'rectpuls', width / 2); %theoretical psd
figure(1)
plot(theta, Rz_a_t), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('${R}_{Z_{alt}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 20]);
% 
%%
%%part 1
alt_pos_neg = zeros(1,N);
for i = 1:length(n)
    alt_pos_neg(i) = (-1)^n(i);
end
%%
y4a = yb .* alt_pos_neg;

Ry4a = psd_est(y4a);
%%
% Ryb = psd_est(yb);
Ry4a_avg = per_avg(y4a, N/100);
% [ry4a_mult,Ry4a_smooth] = improved_est(y4a, 'rect', N/100);
%% alternator plot (estimation)
figure(2)
plot(theta, Ry4a), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{R}_{Z_{alt}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 20]);
    
hold on;
% plot(theta,Ry4a_smooth, 'color', 'k', 'LineWidth', 1);axis([0 1 0 5])
% plot(theta,Rz_a_t, 'color', 'y', 'LineWidth', 1);
plot((0:1/length(Ry4a_avg):1-1/length(Ry4a_avg)),Ry4a_avg, 'color', 'k', 'LineWidth', 1);
hold off;
% figure(2)
% subplot(121), plot(Ryb);
% subplot(122), plot(Ry4a);

%% part2 010101010101 decimator
%theoretical psd
rep = 0 : 1 : 1;
rep1 = 0.5 : 1 : 1;
width = 2 * theta0;
Rz_b_t = (R0 / (4 * 4 * theta0^2)) * (pulstran(theta, rep, 'rectpuls', width / 2) + pulstran(theta, rep1, 'rectpuls', width / 2)); %theoretical psd
figure(3)
plot(theta, Rz_b_t), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('${R}_{Z_{dec}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 5]);

%%
alt_zero_one = flip((alt_pos_neg + 1) / 2);

y4b = yb .* alt_zero_one; 
Ry4b = psd_est(y4b);


Ry4b_avg = per_avg(y4b, N/100);
% [ry4b_mult,Ry4b_smooth] = improved_est(y4b, 'hamming', N/100);

%% decimator figure
figure(5)
plot(theta, Ry4b), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{R}_{Z_{dec}}(\theta)$','Interpreter','latex', 'fontsize', 20),axis([0 1 0 5]);
    
    
hold on;
% plot(theta,Ry4b_smooth, 'color', 'k', 'LineWidth', 1);
% plot(theta,Rz_b_t, 'color', 'y', 'LineWidth', 1);
plot((0:1/length(Ry4b_avg):1-1/length(Ry4b_avg)),Ry4b_avg, 'color', 'k', 'LineWidth', 1);
hold off;
% figure(3)
% 
% subplot(121), plot(Ryb);
% subplot(122), plot(Ry4b);


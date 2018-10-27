% set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
global theta;
%% case of low order lowpass filter
% theoretical ACF

figure(1)
%%subplot(221)
plot(K,acf_t1), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$r_{y_1}(k)$','Interpreter','latex', 'fontsize', 14);

    %%
    %subplot(223)

stem(K(N-20 : N+20),acf_t1(N-20 : N+20)), axis([-20 20 -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$r_{y_1}(k)$','Interpreter','latex', 'fontsize', 14);
   
%%
% theoretical PSD
figure(2)
% subplot(121)
plot(theta, psd_t1), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$R_y(\theta)$','Interpreter','latex', 'fontsize', 14);
%%
% etimated ACF
% xtext = text('\hatr_{y}(k)','Interpreter','latex');
figure(1)
% subplot(222)
plot(K,acf_est1), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)
    %%
% subplot(224)
stem(K(N-20 : N+20),acf_est1(N-20 : N+20)), axis([-20 20 -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat r_y(k)$','Interpreter','latex', 'fontsize', 14);
%%
% estimated PSD
% figure(2)
% subplot(122)

plot(theta, psd_est1), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat R_y(\theta)$','Interpreter','latex', 'fontsize', 14);

% =====================================================================================
%% case of approximately ideal filter
% theoretical ACF
% 
% figure(3)
% subplot(221)
plot(K,acf_t2), axis([-N N -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$r_y(k)$','Interpreter','latex', 'fontsize', 14);
%%    
% subplot(223)
stem(K(N-20 : N+20),acf_t2(N-20 : N+20)), axis([-20 20 -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$r_y(k)$','Interpreter','latex', 'fontsize', 14);
%%
% theoretical PSD
% figure(4)
% subplot(121)
plot(theta, psd_t2),axis([0 1 -0.5 1.5]), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$R_y(\theta)$','Interpreter','latex', 'fontsize', 14);
%%
% etimated ACF
% xtext = text('\hatr_{y}(k)','Interpreter','latex');
% figure(3)
% subplot(222)
plot(K,acf_est2), axis([-N N -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)
    %%
% subplot(224)
stem(K(N-20 : N+20),acf_est2(N-20 : N+20)), axis([-20 20 -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat r_y(k)$','Interpreter','latex', 'fontsize', 14);
%%
% estimated PSD
figure(4)
% subplot(122)
plot(theta, psd_est2), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat R_y(\theta)$','Interpreter','latex', 'fontsize', 14);







% set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
global theta;
%% case of low order lowpass filter
% theoretical ACF

figure(1)
%%subplot(221)
plot(K,acf_t1), axis([-N N -0.1 1.5]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$r_{Y_1}(k)$','Interpreter','latex', 'fontsize', 20);
% axis tight
    %% theoretical acf stem, low order filter
    %subplot(223)
figure(2)
stem(K(N-20 : N+20),acf_t1(N-20 : N+20)), axis([-20 20 -0.1 1.5]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$r_{Y_1}(k)$','Interpreter','latex', 'fontsize', 20);
%    axis tight
%%
% theoretical PSD
figure(3)
% subplot(121)
plot(theta, psd_t1), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$R_{Y_1}(\theta)$','Interpreter','latex', 'fontsize', 20);
%     axis tight
%%
% etimated ACF simple filter
% xtext = text('\hatr_{y}(k)','Interpreter','latex');
figure(4)
% subplot(222)
plot(K,acf_est1), axis([-N N -0.1 1.5]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{r}_{Y_1}(k)$','Interpreter','latex', 'fontsize', 20)
%     axis tight
    %%
% subplot(224)
%estimated acf, simple filter, stem
figure(5)
stem(K(N-20 : N+20),acf_est1(N-20 : N+20)), axis([-20 20 -0.1 1.5]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat r_{Y_1}(k)$','Interpreter','latex', 'fontsize', 20);
%     axis tight
%%
% estimated PSD
% figure(2)
% subplot(122)
figure(6)
plot(theta, psd_est1), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat R_{Y_1}(\theta)$','Interpreter','latex', 'fontsize', 20);
% axis tight
% =====================================================================================
%% case of approximately ideal filter
% theoretical ACF
% 
figure(7)
% subplot(221)
plot(K,acf_t2), axis([-N N -1 4]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$r_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20);
% axis tight
    %%    
% subplot(223)
figure(8)
stem(K(N-20 : N+20),acf_t2(N-20 : N+20)), axis([-20 20 -1 4]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$r_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20);
% axis tight
    %%
% theoretical PSD
figure(9)
% subplot(121)
plot(theta, psd_t2),axis([0 1 -0.5 12]), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$R_{Y_2}(\theta)$','Interpreter','latex', 'fontsize', 20);
% axis tight
    %%
% etimated ACF
% xtext = text('\hatr_{y}(k)','Interpreter','latex');
figure(10)
% subplot(222)
plot(K,acf_est2), axis([-N N -1 4]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{r}_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20)
%     axis tight
    %%
% subplot(224)
figure(11)
stem(K(N-20 : N+20),acf_est2(N-20 : N+20)), axis([-20 20 -1 4]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat r_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20);
% axis tight
    %%
% estimated PSD
figure(12)
% subplot(122)
plot(theta, psd_est2), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat R_{Y_2}(\theta)$','Interpreter','latex', 'fontsize', 20);
axis tight






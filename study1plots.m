% set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
% case of low order lowpass filter
% theoretical ACF
global theta;
figure(1)
plot(K,acf_t1), axis([-N N -0.1 1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), ylabel('$r_y(k)$','Interpreter','latex', 'fontsize', 14);

% theoretical PSD
% plot(theta, psd_t1);
%%
% etimated ACF
% xtext = text('\hatr_{y}(k)','Interpreter','latex');

figure(2)
plot(K,acf_est1);
plot(K,acf_est1), axis([-N N -0.1 1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)

% estimated PSD


% case of approximately ideal filter
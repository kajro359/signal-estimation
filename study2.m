%study 2 - improved estimates
global theta;

%%
%call to improved estimation of acf, psd for y
%windowlength, start with N/10... 

%this si improved estiamtes of non-ideal filter output
[ry_1_imp, Ry_1_imp] = improved_est(y, 'hamming',N / 100);
%
%adn this is for ideal iflter output.
[ry_2_imp, Ry_2_imp] = improved_est(yb, 'hamming',N / 100);

%% PLOTS
%% NON-ideal case
%improved estimate of acf
plot(K,ry_1_imp), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)
    
    %% stem plot

stem(K(N-20 : N+20),ry_1_imp(N-20 : N+20)), axis([-20 20 -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat r_y(k)$','Interpreter','latex', 'fontsize', 14);
%% 
%improved estimate of PSD
theta1 = 0 : 1 / length(Ry_2_imp) : 1 - 1 / length(Ry_2_imp);

plot(theta1, Ry_1_imp), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat R_y(\theta)$','Interpreter','latex', 'fontsize', 14);


%% Ideal case
%improved estimate of acf
plot(K,ry_2_imp), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)
%% 
%improved estimate of PSD
theta1 = 0 : 1 / length(Ry_2_imp) : 1 - 1 / length(Ry_2_imp);
% Ry_2_imp_v2 = fft(ry_2_imp);
figure(1)
plot(theta1, Ry_2_imp), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat R_y(\theta)$','Interpreter','latex', 'fontsize', 14);
% 
% figure(2)
% plot(abs(Ry_2_imp_v2)), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
%     ylabel('$\hat R_y(\theta)$','Interpreter','latex', 'fontsize', 14);
% 


% Ry_hat = psd_est(yb);
% figure(2)
% plot(Ry_hat)



%call to improved estimation of acf, psd for yb
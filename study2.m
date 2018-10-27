%study 2 - improved estimates
global theta;

%%
%do per_avg first... Then smooth the PSD
%as for ACF, do some smoothing???
%call to improved estimation of acf, psd for y
%windowlength, start with N/10... 

%this si improved estiamtes of non-ideal filter output
% [ry_1_imp, Ry_1_imp] = improved_est(y, 'hamming',N / 100);
%
%adn this is for ideal iflter output.
% [ry_2_imp, Ry_2_imp] = improved_est(yb, 'hamming',N / 100);

% Ry_1_imp = per_avg(psd_est1, 500);



%% PLOTS
%% NON-ideal case
%improved estimate of acf
ry_1_imp = simple_smooth(acf_est1);
plot(K,ry_1_imp), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{Y_1}(k)$','Interpreter','latex', 'fontsize', 14)
    
    %% stem plot

stem(K(N-20 : N+20),ry_1_imp(N-20 : N+20)), axis([-20 20 -0.13 1.2]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat r_y(k)$','Interpreter','latex', 'fontsize', 14);
%% 
%improved estimate of PSD

Ry_1_imp = per_avg(y, N / 150);
disp(length(Ry_1_imp))
Ry_1_imp = psd_smoothing(Ry_1_imp, 'hamming', length(Ry_1_imp) / 10);
theta1 = 0 : 1 / length(Ry_1_imp) : 1 - 1 / length(Ry_2_imp);
figure(2)
plot(theta1, Ry_1_imp), xlabel('$\theta$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat R_{Y_1}(\theta)$','Interpreter','latex', 'fontsize', 14);

    
    %improved acf as the fourier transform of improved PSD???     
% 
%     ry_1_imp = fftshift(ifft(Ry_1_imp));
%     figure(2)
%     plot(real(ry_1_imp))
% figure(3)
% stem(ry_1_imp(length(ry_1_imp) / 2 - 20 : length(ry_1_imp) / 2 + 20)), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
%     ylabel('$\hat r_y(k)$','Interpreter','latex', 'fontsize', 14);

%% Ideal case
%improved estimate of acf
plot(K,ry_2_imp), axis([-N N -0.1 1.1]), xlabel('$k$','Interpreter','latex', 'fontsize', 14), 
    ylabel('$\hat{r}_{y}(k)$','Interpreter','latex', 'fontsize', 14)
%% 
%improved estimate of PSD, with averaging and smoothing

Ry_2_imp = per_avg(yb, N / 200);
Ry_2_imp = psd_smoothing(Ry_2_imp, 'hamming', length(Ry_2_imp) / 10);


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
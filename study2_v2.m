%study2 v2 Better estimate of psd:s

%NON-ideal filter case
% ======================================================
%% Averaging
psd_est1_avg = per_avg(y, N/10);

psd_est1_avg2 = per_avg(y, N/100);

psd_est1_avg3 = per_avg(y, N/1000);


%% Smoothing - gives the acf multiplied by window and a smoothed PSD

[acf_est1_winmult, psd_est1_smooth] = improved_est(y, 'hamming',N / 10);

[acf_est1_winmult2, psd_est1_smooth2] = improved_est(y, 'hamming',N / 100);

[acf_est1_winmult3, psd_est1_smooth3] = improved_est(y, 'hamming',N / 1000);

%% plots
the = 0 : 1 / length(psd_est1_avg2) : 1 - 1 / length(psd_est1_avg2);
the2 = 0 : 1 / length(psd_est1_smooth2) : 1 - 1 / length(psd_est1_smooth2);

figure(1);
subplot(131)
plot(psd_est1_avg), title('k = N/10');
subplot(132)
plot(the, psd_est2_avg2), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat R_{Y_2}(\theta)$','Interpreter','latex', 'fontsize', 20), %title('k = N/100');

subplot(133)
plot(psd_est1_avg3), title('k = N/1000');

figure(2)
subplot(131)
plot(psd_est1_smooth), title('window width = N / 10');
subplot(132)
plot(the2, psd_est2_smooth2), xlabel('$\theta$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat R_{Y_2}(\theta)$','Interpreter','latex', 'fontsize', 20), %title('window width = N / 100');

    subplot(133)
plot(psd_est1_smooth3), title('window width = N / 1000');



figure(3)
subplot(131)
plot(acf_est1_winmult), title('window width = N / 10');
subplot(132)
plot(K,acf_est2_winmult2),axis([-N N -0.13 1]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat{r}_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20)
     
    %title('window width = N / 100')
    
subplot(133)
plot(acf_est1_winmult3), title('window width = N / 1000');


stem(K(N-20 : N+20),acf_est2_winmult2(N-20 : N+20)), axis([-20 20 -0.13 1]), xlabel('$k$','Interpreter','latex', 'fontsize', 20), 
    ylabel('$\hat r_{Y_2}(k)$','Interpreter','latex', 'fontsize', 20);

%study2 v2 Better estimate of psd:s

%%%% Ideal filter case
% ======================================================
%% Averaging
psd_est2_avg = per_avg(yb, N/10);

psd_est2_avg2 = per_avg(yb, N/100);

psd_est2_avg3 = per_avg(yb, N/1000);


%% Smoothing - gives the acf multiplied by window and a smoothed PSD

[acf_est2_winmult, psd_est2_smooth] = improved_est(yb, 'hamming',N / 10);

[acf_est2_winmult2, psd_est2_smooth2] = improved_est(yb, 'hamming',N / 100);

[acf_est2_winmult3, psd_est2_smooth3] = improved_est(yb, 'hamming',N / 1000);

%% plots
figure(1);
subplot(131)
plot(psd_est2_avg), title('k = N/10');
subplot(132)
plot(psd_est2_avg2), title('k = N/100');
subplot(133)
plot(psd_est2_avg3), title('k = N/1000');

figure(2)
subplot(131)
plot(psd_est2_smooth), title('window width = N / 10');
subplot(132)
plot(psd_est2_smooth2), title('window width = N / 100');
subplot(133)
plot(psd_est2_smooth3), title('window width = N / 1000');



figure(3)
subplot(131)
plot(acf_est2_winmult), title('window width = N / 10');
subplot(132)
plot(acf_est2_winmult2), title('window width = N / 100');
subplot(133)
plot(acf_est2_winmult3), title('window width = N / 1000');
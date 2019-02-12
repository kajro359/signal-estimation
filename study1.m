% functions for study1 report
%% constants
% R0 = 1;     %amplitude of noise PSD
a = 0.5;    %constant in h[n] = a^n*u[n]
% theta0 = 0.5; %normalized cut-off frequency
% global theta;
% theta = normfreq;
scl = 1/2; %for acf calculation, scaling theorem

% a = 0.5;    %constant in h[n] = a^n*u[n]
%% Simple filter case -ACF and PSD etimated
acf_t1 = (1 / (1 - a^2)) * R0 * a.^(abs(K)); %theoretical acf
%%
psd_t1 = R0 * 1 ./ (1 + a^2 - 2 * a * cos(2 * pi * theta)); % theoretical psd, transform of acf_t1

acf_est1 = acf_est(y); %estimated acf

psd_est1 = psd_est(y); %estimated psd


%% Ideal filter case 
%since sampling freq. doubled in acf-signal, include scale var scl
% acf_t2 = scl * (R0 / (2 * theta0)) * sinc(2 * theta0 * K * scl); %theoretical acf

acf_t2 =  (R0 / (2 * theta0)) * sinc(2 * theta0 * K);
 %is sampleperiod halved? yes --> theta -> 2*theta -> SCALING 
                                                %scaling theorem 
%%
rep = 0 : 1 : 1;
width = 4 * theta0;
psd_t2 = (R0 / (4 * (theta0)^2)) * pulstran(theta, rep, 'rectpuls', width / 2); %theoretical psd


% psd_t2 = (R0 / (4 * (0.15)^2)) * pulstran(theta, rep, 'rectpuls', width / 2); %theoretical psd

%%
acf_est2 = acf_est(yb);
% acf_est2 = acf_est_alt(yb);
psd_est2 = psd_est(yb);




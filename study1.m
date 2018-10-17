% commands and plots for study1 report
% 
R0 = 1;     %amplitude of noise PSD
a = 0.5;    %constant in h[n] = a^n*u[n]
global theta;
theta = normfreq;
acf_t1 = (1 / 1 - a^2) * R0 * a.^(abs(K)); %theoretical acf

psd_t1 = R0 * 1 ./ (1 + a^2 - 2 * a * cos(2 * pi * theta)); % theoretical psd, transform of acf_t1


acf_est1 = acf_est(y2);
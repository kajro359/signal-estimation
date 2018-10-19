%study 2 - improved estimates

%call to improved estimation of acf, psd for y
%windowlength, start with N/10... 
[ry_imp, Ry_imp] = improved_est(yb, 'hamming',N / 10);

%%
Ry_hat = psd_est(yb);
figure(2)
plot(Ry_hat)



%call to improved estimation of acf, psd for yb
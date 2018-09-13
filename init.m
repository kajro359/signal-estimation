

global N t k h;

N = 2^10; %set to 2^16 for demo
t = (0:1:N-1);
k = t;
h = exp(-t); %first order filter in the time-domain
wgn_x = wgn(1, N, 0); 



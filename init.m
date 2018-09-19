global N t k h count Theta;

count = 0;
N = 2^10; %set to 2^16 for demo
t = (0:1:N-1);
k = t;
h = exp(-t); %first order filter in the time-domain

% x = linspace(-10, 10, N);
% h_i = sinc(x);

Theta = (0:2*N-1)/(2*N-1);

K = [-flip(k) k];

wgn_x = wgn(1, N, 0); 

%filter ordning 1
[b,a] = butter(1,0.5);

y = simplp(wgn_x);
%y_i = fsimplp(wgn_x,h_i);
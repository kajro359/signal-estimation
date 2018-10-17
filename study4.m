
% yb is high order filtered noise. -1 1 -1 1 
global n;
global N;

%%part 1
alt_pos_neg = zeros(1,N);
for i = 1:length(n)
    alt_pos_neg(i) = (-1)^n(i);
end
y4a = yb .* alt_pos_neg;

Ry4a = psd_est(y4a);
Ryb = psd_est(yb);

figure(2)
subplot(121), plot(Ryb);
subplot(122), plot(Ry4a);

%% part2 010101010101
alt_zero_one = flip((alt_pos_neg + 1) / 2);

y4b = yb .* alt_zero_one; 
Ry4b = psd_est(y4b);
figure(3)

subplot(121), plot(Ryb);
subplot(122), plot(Ry4b);


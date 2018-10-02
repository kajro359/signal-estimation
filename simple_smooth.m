function [out_x] = simple_smooth(x)
%SIMPLE_SMOOTH Performs moving average smoothing using convolution
%   Easy as pie

M = max(size(x));
M = floor(M / 10);
if mod(M,2) == 0
    M = M-1; %N must be odd
end
mask = ones(1, M) / M;

out_x = conv(x, mask, 'valid');

end


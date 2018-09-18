function ry = acf_theoretical
%acf_theoretical Summary of this function goes here
%   Detailed explanation goes here
N = 2^16;
ry = zeros(1,N);

for i = 0:N-1
    ry(i+1) = (1+i)*exp(-i);
end


end


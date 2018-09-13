
function y = simplp(x)
%SIMPLP Applies a first order low pass filter to input vector A
%   Detailed explanation goes here
global N;
y=zeros(N,1).';
y(1)=x(1);

for i = 2:1:N
    y(i) = x(i) + x(i-1);
end


end


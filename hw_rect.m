function y = hw_rect(x)

y = zeros(1, length(x));

for i = 1 : length(y)
    y(i) = max(0, x(i));
end

end

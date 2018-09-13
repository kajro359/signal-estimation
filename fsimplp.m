function y = fsimplp(x, h)
%FSIMPLP Filters a time-dependant signal x with the filter h
%   Using the convolution theorem, this function returns the filtered
%   signal y. 

X = fft(x);
H = fft(h);
Y = X.*H;
y = ifft(Y);

end


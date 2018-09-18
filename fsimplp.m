function y = fsimplp(x, h)
%FSIMPLP Filter a time-dependant signal x with the filter h
%   y = fsimpl(x, h) returns the signal x filtered by h. Filtering is
%   carried out in the frequency domain. 

X = fft(x);
H = fft(h);
Y = X.*H;
y = ifft(Y);

end


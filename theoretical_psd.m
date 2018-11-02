function Ry = theoretical_psd(a, b)
global theta N;
    Ry = zeros(1, N);
    for i = -5 : 5
        Ry = Ry + rectangularPulse(i*a, i*b, theta);
    end
end
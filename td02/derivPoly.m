function [ coeffDeriv ] = derivPoly(coeffs)
    coeffDeriv = zeros(1, size(coeffs,2)-1);
    
    for i = 1:size(coeffDeriv, 2)
        coeffDeriv(i) = coeffs(i+1) * (i);
    end
end


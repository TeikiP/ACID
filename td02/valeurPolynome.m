function [ v ] = valeurPolynome(coeffs, x)
    v = 0;
    
    
    for i = 1:size(coeffs, 2)
        v = v + coeffs(i) * x .^ (i-1);
    end
end


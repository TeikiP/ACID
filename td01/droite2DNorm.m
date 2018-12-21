function [y] = droite2DNorm(x,n,p)

    % y = (n(1)/(-n(2))) * (x-p(1)) + p(2);
    
    y = (n(2)/(-n(1))) * (x-p(1)) + p(2);

end


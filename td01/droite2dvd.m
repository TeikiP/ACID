function [y] = droite2DVD(x,Vd,p)

    y = (Vd(2)/Vd(1)) * (x-p(1)) + p(2);

end


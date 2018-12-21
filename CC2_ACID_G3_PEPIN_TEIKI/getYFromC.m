function [ Y ] = getYFromC( C1, C2 )

    Y = [ones(1, size(C1, 2)) -1.*ones(1, size(C2, 2)); C1 -1.*C2];

end


function [ Wcurrent ] = moindresCarres( C1, C2 )

    Y = getYFromC(C1, C2);
    Z = transpose(Y);
    b = ones(size(Z, 1), 1);
    
    Wcurrent = Z \ b;
    
end


function [ Wcurrent ] = moindresCarresOptimisation( C1, C2 )

    epsilon = 0.002;
    Y = getYFromC(C1, C2);
    Z = transpose(Y);
    
    % Initial
    b = ones(size(Z, 1), 1);
    Wcurrent = Z \ b;
    
    % Optimisation 1
    b = Z * Wcurrent;
    b(b < 0) = 0;
    Wprec = Wcurrent;
    Wcurrent = Z \ b;
    
    % Optimisations
    while(norm(Wprec - Wcurrent) > epsilon)
        
        b = Z * Wcurrent;
        b(b < 0) = 0;
        Wprec = Wcurrent;
        Wcurrent = Z \ b;
    
    end
    
end


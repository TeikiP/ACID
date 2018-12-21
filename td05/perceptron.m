function [ Wcurrent ] = perceptron (C1, C2, W)

    att = 0.1;
    epsilon = 0.002;
    scaling = 1;
    Y = getYFromC(C1, C2);
    YM = malPlaces(Y, W);
    Wprec = W;
    
    Wcurrent = Wprec + att * sum(YM, 2);
    
    while(norm(Wprec - Wcurrent) > epsilon)
        Wprec = Wcurrent;
        YM = malPlaces(Y, Wprec);        
        Wcurrent = Wprec + att/scaling * sum(YM, 2);
        scaling = scaling + 1;
    end

end
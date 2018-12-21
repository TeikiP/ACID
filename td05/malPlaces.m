function [ YM ] = malPlaces(Y, W)
    
    vecteurPlacement = transpose(W) * Y;
    
    ind = find(vecteurPlacement < 0);
    
    YM = Y(:, ind);

end

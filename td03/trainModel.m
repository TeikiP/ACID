function [model] = trainModel (Train, size)
    
    model.mu = mean(Train); % moyenne
    model.sigma = sqrt(var(Train)); % ecart-type
    model.size = size; % taille de la VT correspondante

end


function [model] = trainModel (Train, size)
    
    model.mu = mean(Train); % moyenne
    model.sigma = cov(Train); % ecart-type
    model.size = size; % taille de la VT correspondante

end


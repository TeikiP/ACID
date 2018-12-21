function [model] = trainModel (Train, size)
    
    model.mu = mean(Train);
    model.sigma = cov(Train);
    model.size = size;

end


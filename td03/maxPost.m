function [ res ] = maxPost(testSample, modelBar, modelSaumon)

    probBar = modelBar.size / (modelBar.size + modelSaumon.size);
    probSaumon = modelSaumon.size / (modelBar.size + modelSaumon.size);
    
    resBar = normpdf(testSample, modelBar.mu, modelBar.sigma);
    resSaumon = normpdf(testSample, modelSaumon.mu, modelSaumon.sigma);
    
    res = (resBar * probBar) > (resSaumon * probSaumon);

    % labels dans res :
    % 0 pour saumon
    % 1 pour bar
    
end
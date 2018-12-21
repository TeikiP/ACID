function [ res ] = cout(testSample, modelBar, modelSaumon)

    probBar = modelBar.size / (modelBar.size + modelSaumon.size);
    probSaumon = modelSaumon.size / (modelBar.size + modelSaumon.size);
    
    risqueBarSiSaumon = 2; % 2/3
    risqueSaumonSiBar = 1; % 1/3
    
    resBar = normpdf(testSample, modelBar.mu, modelBar.sigma);
    resSaumon = normpdf(testSample, modelSaumon.mu, modelSaumon.sigma);
    
    res = (resBar * risqueBarSiSaumon * probBar) > (resSaumon * risqueSaumonSiBar * probSaumon);

    % labels dans res :
    % 0 pour saumon
    % 1 pour bar
    
end
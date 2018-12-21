function [ res ] = Myclassify(testSample, modelBar, modelSaumon)

    resBar = normpdf(testSample, modelBar.mu, modelBar.sigma);
    resSaumon = normpdf(testSample, modelSaumon.mu, modelSaumon.sigma);
    
    res = resBar > resSaumon;
    
    % labels dans res :
    % 0 pour saumon
    % 1 pour bar
    
end
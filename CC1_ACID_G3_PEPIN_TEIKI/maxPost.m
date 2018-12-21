function [ res ] = maxPost(testSample, modelC2, modelC1)

    probC2 = modelC2.size / (modelC2.size + modelC1.size);
    probC1 = modelC1.size / (modelC2.size + modelC1.size);
    
    resC2 = normpdf(testSample, modelC2.mu, modelC2.sigma);
    resC1 = normpdf(testSample, modelC1.mu, modelC1.sigma);
    
    res = (resC2 * probC2) > (resC1 * probC1);

    % labels dans res :
    % 0 pour C1
    % 1 pour C2
    
end
function [ VTSaumon, VTBar ] = VTGenerator(sizeVT)

    % Valeurs initiales Saumon
    muSaumon = [8, 8];
    sigmaSaumon = [1, 0; 0, 1];
    VTSaumon = mvnrnd(muSaumon, sigmaSaumon, sizeVT);

    % Valeurs initiales Bar
    muBar = [12, 12];
    sigmaBar = [4, 0; 0, 4];
    VTBar = mvnrnd(muBar, sigmaBar, sizeVT);

end


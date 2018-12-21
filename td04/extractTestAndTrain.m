function [ TrainSaumon, TrainBar, TestSaumon, TestBar ] = extractTestAndTrain (VTSaumon, VTBar, sizeTrain )

    % echantillon d'entrainement
    
    TrainSaumonIndice = randperm(size(VTSaumon, 1), sizeTrain);
    TrainBarIndice = randperm(size(VTBar, 1), sizeTrain);
    
    TrainSaumon = VTSaumon(TrainSaumonIndice);
    TrainBar = VTBar(TrainBarIndice);
    
    
    % echantillon de test
    
    TestSaumon = VTSaumon;
    TestSaumon(TrainSaumonIndice) = [];
    
    TestBar = VTBar;
    TestBar(TrainBarIndice) = [];

end
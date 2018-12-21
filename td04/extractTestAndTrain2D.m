function [ TrainSaumon, TrainBar, TestSaumon, TestBar ] = extractTestAndTrain2D (VTSaumon, VTBar, sizeTrain )

    % selection aleatoire des indices de l'echantillon d'entrainement
    TrainSaumonIndice = transpose(randperm(size(VTSaumon, 1), sizeTrain));
    TrainBarIndice = transpose(randperm(size(VTBar, 1), sizeTrain));
    
    % adaptation des indices pour un echantillon a deux dimensions
    TrainSaumonIndice = [TrainSaumonIndice TrainSaumonIndice+size(VTSaumon, 1)];
    TrainBarIndice = [TrainBarIndice TrainBarIndice+size(VTBar, 1)];
    
    % extraction de l'echantillon d'entrainement
    TrainSaumon = VTSaumon(TrainSaumonIndice);
    TrainBar = VTBar(TrainBarIndice);
    
    % extraction de l'echantillon de test saumon
    TestSaumonD1 = VTSaumon(:, 1);
    TestSaumonD1(TrainSaumonIndice(:, 1)) = [];
    
    TestSaumonD2 = VTSaumon(:, 2);
    TestSaumonD2(TrainSaumonIndice(:, 1)) = [];
    
    TestSaumon = [TestSaumonD1 TestSaumonD2];
    
    % extraction de l'echantillon de test bar
    TestBarD1 = VTBar(:, 1);
    TestBarD1(TrainBarIndice(:, 1)) = [];
    
    TestBarD2 = VTBar(:, 2);
    TestBarD2(TrainBarIndice(:, 1)) = [];
    
    TestBar = [TestBarD1 TestBarD2];
    
end
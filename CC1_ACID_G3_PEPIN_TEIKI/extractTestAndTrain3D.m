function [ TrainC1, TrainC2, TestC1, TestC2 ] = extractTestAndTrain3D (C1, C2)

    % selection aleatoire des indices de l'echantillon d'entrainement
    TrainC1Indice = transpose(randperm(size(C1, 1), size(C1, 1)/10));
    TrainC2Indice = transpose(randperm(size(C2, 1), size(C2, 1)/10));
    
    % adaptation des indices pour un echantillon a trois dimensions
    TrainC1Indice = [TrainC1Indice TrainC1Indice+size(C1, 1) TrainC1Indice+2*size(C1, 1)];
    TrainC2Indice = [TrainC2Indice TrainC2Indice+size(C2, 1) TrainC2Indice+2*size(C2, 1)];
    
    % extraction de l'echantillon d'entrainement
    TrainC1 = C1(TrainC1Indice);
    TrainC2 = C2(TrainC2Indice);
    
    % extraction de l'echantillon de test C1
    TestC1D1 = C1(:, 1);
    TestC1D1(TrainC1Indice(:, 1)) = [];
    
    TestC1D2 = C1(:, 2);
    TestC1D2(TrainC1Indice(:, 1)) = [];
    
    TestC1D3 = C1(:, 3);
    TestC1D3(TrainC1Indice(:, 1)) = [];
    
    TestC1 = [TestC1D1 TestC1D2 TestC1D3];
    
    % extraction de l'echantillon de test C2
    TestC2D1 = C2(:, 1);
    TestC2D1(TrainC2Indice(:, 1)) = [];
    
    TestC2D2 = C2(:, 2);
    TestC2D2(TrainC2Indice(:, 1)) = [];
    
    TestC2D3 = C2(:, 3);
    TestC2D3(TrainC2Indice(:, 1)) = [];
    
    TestC2 = [TestC2D1 TestC2D2 TestC2D3];
    
end
function [ TrainC1, TrainC2, TestC1, TestC2 ] = extractTestAndTrain (C1, C2)

    % selection aleatoire des indices de l'echantillon d'entrainement
    TrainC1Indice = transpose(randperm(size(C1, 1), size(C1, 1)/10));
    TrainC2Indice = transpose(randperm(size(C2, 1), size(C2, 1)/10));
    
    % extraction de l'echantillon d'entrainement
    TrainC1 = C1(TrainC1Indice,:);
    TrainC2 = C2(TrainC2Indice,:);
    
    % extraction de l'echantillon de test C1
    TestC1 = C1;
    TestC1(TrainC1Indice,:) = [];
    
    % extraction de l'echantillon de test C2
    TestC2 = C2;
    TestC2(TrainC2Indice,:) = [];
end
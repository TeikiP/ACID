%%%%% Code original %%%%%
load ('donnees1.mat')
load ('donnees2.mat')

close all
figure(1)
hold on

axis equal

scatter3(C1(:, 1), C1(:,2),C1(:, 3))
scatter3(C2(:, 1), C2(:,2),C2(:, 3), 'r')
hold off

%%%%% Informations %%%%%
moyennesC1 = mean(C1)
moyenneC1 = mean(mean(C1))

moyennesC2 = mean(C2)
moyenneC2 = mean(mean(C2))

sizeC1 = size(C1)
sizeC2 = size(C2)


%%%%% Initialisation %%%%%
dimensionReduction = 2; % dimension que l'on recherche en reduction
nbIter = 100;

vecteurErreursMAPC1 = [zeros(nbIter, 1) zeros(nbIter, 1) zeros(nbIter, 1)];
vecteurErreursMAPC2 = [zeros(nbIter, 1) zeros(nbIter, 1) zeros(nbIter, 1)];

vecteurErreursACPC1 = zeros(nbIter, 1);
vecteurErreursACPC2 = zeros(nbIter, 1);

vecteurErreursACIC1 = zeros(nbIter, 1);
vecteurErreursACIC2 = zeros(nbIter, 1);


%%%%% Classification %%%%%
for i = 1:nbIter
    %%%%% Echantillons %%%%%
    % Test and train
    [TrainC1, TrainC2, TestC1, TestC2] = extractTestAndTrain3D(C1, C2);
    %[TrainC1, TrainC2, TestC1, TestC2] = extractTestAndTrain3D(C3, C4);
    % a decommenter pour faire des tests sur C3 et C4 au lieu de C1 et C2
    
    
    %%%%% MAP %%%%%
    % Modele
    modelMAPC1 = trainModel(TrainC1, size(C1, 1));
    modelMAPC2 = trainModel(TrainC2, size(C2, 2));
    
    % Classification
    ResC1MaxPost = maxPost(TestC1, modelMAPC2, modelMAPC1);
    ResC2MaxPost = maxPost(TestC2, modelMAPC2, modelMAPC1);
    
    % Recherche d'erreurs
    vecteurErreursMAPC1(i, 1) =  sum(ResC1MaxPost(:, 1));
    vecteurErreursMAPC1(i, 2) =  sum(ResC1MaxPost(:, 2));
    vecteurErreursMAPC1(i, 3) =  sum(ResC1MaxPost(:, 3));
    
    vecteurErreursMAPC2(i, 1) = size(ResC2MaxPost(:, 1),1)-sum(ResC2MaxPost(:, 1));
    vecteurErreursMAPC2(i, 2) = size(ResC2MaxPost(:, 2),1)-sum(ResC2MaxPost(:, 2));
    vecteurErreursMAPC2(i, 3) = size(ResC2MaxPost(:, 3),1)-sum(ResC2MaxPost(:, 3));
    
    
    %%%%% ACP %%%%%
    % Projection train C1
    [WTrainC1, VTrainC1] = CalculACP(TrainC1, dimensionReduction);
    ACPProjTrainC1 = Projection(WTrainC1, TrainC1);

    % Projection train C2
    [WTrainC2, VTrainC2] = CalculACP(TrainC2, dimensionReduction);
    ACPProjTrainC2 = Projection(WTrainC2, TrainC2);
    
    % Projection test C1
    [WTestC1, VTestC1] = CalculACP(TestC1, dimensionReduction);
    ACPProjTestC1 = Projection(WTestC1, TestC1);

    % Projection test C2
    [WTestC2, VTestC2] = CalculACP(TestC2, dimensionReduction);
    ACPProjTestC2 = Projection(WTestC2, TestC2);

    % Creation du modele
    modelACPC1 = trainModel(ACPProjTrainC1, size(C1, 1));
    modelACPC2 = trainModel(ACPProjTrainC2, size(C2, 1));
    
    % Classification
    ResC1ACP = maxPost(ACPProjTestC1, modelACPC2, modelACPC1);
    ResC2ACP = maxPost(ACPProjTestC2, modelACPC2, modelACPC1);
    
    % Recherche d'erreurs
    vecteurErreursACPC1(i, 1) =  sum(ResC1ACP(:, 1));
    vecteurErreursACPC1(i, 2) =  sum(ResC1ACP(:, 2));
    
    vecteurErreursACPC2(i, 1) = size(ResC2ACP(:, 1),1)-sum(ResC2ACP(:, 1));
    vecteurErreursACPC2(i, 2) = size(ResC2ACP(:, 2),1)-sum(ResC2ACP(:, 2));
    
    
    %%%%% ACI %%%%%    
    % Projection train
    [WTrain, VTrain] = CalculACI(TrainC1, TrainC2);
    ACIProjTrainC1 = Projection(WTrain, TrainC1);
    ACIProjTrainC2 = Projection(WTrain, TrainC2);
    
    % Projection test
    [WTest, VTest] = CalculACI(TestC1, TestC2);
    ACIProjTestC1 = Projection(WTest, TestC1);
    ACIProjTestC2 = Projection(WTest, TestC2);

    % Creation du modele
    modelACIC1 = trainModel(ACIProjTrainC1, size(C1, 1));
    modelACIC2 = trainModel(ACIProjTrainC2, size(C2, 1));
    
    % Classification
    ResC1ACI = maxPost(ACIProjTestC1, modelACIC2, modelACIC1);
    ResC2ACI = maxPost(ACIProjTestC2, modelACIC2, modelACIC1);
    
    % Recherche d'erreurs
    vecteurErreursACIC1(i) =  sum(ResC1ACI);
    vecteurErreursACIC2(i) = size(ResC2ACI,1)-sum(ResC2ACI);
    
end;

%%%%% Taux d'erreurs %%%%%
moyenneErreursMAPC1 = mean(vecteurErreursMAPC1)
moyenneErreursMAPC2 =  mean(vecteurErreursMAPC2)

moyenneErreursACPC1 = mean(vecteurErreursACPC1)
moyenneErreursACPC2 =  mean(vecteurErreursACPC2)

moyenneErreursACIC1 = mean(vecteurErreursACIC1)
moyenneErreursACIC2 =  mean(vecteurErreursACIC2)
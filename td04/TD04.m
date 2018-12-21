%
% % Calcul des valeurs propres / vecteurs propre d'une matrice (eig)
% % Visualisation des vecteurs propres de la matrice de covariance
% % d'un nuage de points
%

%%%%% Initialisation %%%%%
% Valeurs initiales
k = 1; % dimension que l'on recherche en reduction
nbIter = 100;
sizeVT = 1000;
sizeTrain = 100;
[VTSaumon, VTBar] = VTGenerator(sizeVT);
    
% Affichage du nuage de points
close all;
figure ('Name', 'Verites Terrain');
axis equal;
hold on;
scatter(VTSaumon(:,1), VTSaumon(:,2), 12, 'blue', '.');
scatter(VTBar(:,1), VTBar(:,2), 12, 'red', '.');
hold off;

%%%%% Erreurs %%%%%
vecteurErreursSaumonACP = zeros(nbIter, 1);
vecteurErreursBarACP = zeros(nbIter, 1);

vecteurErreursSaumonACI = zeros(nbIter, 1);
vecteurErreursBarACI = zeros(nbIter, 1);

%%%%% Classification %%%%%
for i = 1:nbIter
    %%%%% Echantillons %%%%%
    % Test and train
    [TrainSaumon, TrainBar, TestSaumon, TestBar] = extractTestAndTrain2D(VTSaumon, VTBar, sizeTrain);

    
    %%%%% ACP %%%%%
    % Projection train saumon
    [WTrainSaumon, VTrainSaumon] = CalculACP(TrainSaumon, k);
    ACPProjTrainSaumon = Projection(WTrainSaumon, TrainSaumon);

    % Projection train bar
    [WTrainBar, VTrainBar] = CalculACP(TrainBar, k);
    ACPProjTrainBar = Projection(WTrainBar, TrainBar);
    
    % Projection test saumon
    [WTestSaumon, VTestSaumon] = CalculACP(TestSaumon, k);
    ACPProjTestSaumon = Projection(WTestSaumon, TestSaumon);

    % Projection test bar
    [WTestBar, VTestBar] = CalculACP(TestBar, k);
    ACPProjTestBar = Projection(WTestBar, TestBar);

    % Creation du modele
    modelACPSaumon = trainModel(ACPProjTrainSaumon, sizeVT); %valeurs negatives pour mu ???
    modelACPBar = trainModel(ACPProjTrainBar, sizeVT);
    
    % Classification
    ResSaumonACP = Myclassify(ACPProjTestSaumon, modelACPBar, modelACPSaumon);
    ResBarACP = Myclassify(ACPProjTestBar, modelACPBar, modelACPSaumon);
    
    % Recherche d'erreurs
    vecteurErreursSaumonACP(i) =  sum(ResSaumonACP);
    vecteurErreursBarACP(i) = size(ResBarACP,1)-sum(ResBarACP);
    
    %%%%% ACI %%%%%    
    % Projection train
    [WTrain, VTrain] = CalculACI(TrainSaumon, TrainBar);
    ACIProjTrainSaumon = Projection(WTrain, TrainSaumon);
    ACIProjTrainBar = Projection(WTrain, TrainBar);
    
    % Projection test
    [WTest, VTest] = CalculACI(TestSaumon, TestBar);
    ACIProjTestSaumon = Projection(WTest, TestSaumon);
    ACIProjTestBar = Projection(WTest, TestBar);

    % Creation du modele
    modelACISaumon = trainModel(ACIProjTrainSaumon, sizeVT);
    modelACIBar = trainModel(ACIProjTrainBar, sizeVT);
    
    % Classification
    ResSaumonACI = Myclassify(ACIProjTestSaumon, modelACIBar, modelACISaumon);
    ResBarACI = Myclassify(ACIProjTestBar, modelACIBar, modelACISaumon);
    
    % Recherche d'erreurs
    vecteurErreursSaumonACI(i) =  sum(ResSaumonACI);
    vecteurErreursBarACI(i) = size(ResBarACI,1)-sum(ResBarACI);
    
end;

%%%%% Erreurs %%%%%
% Moyennes d'erreurs
moyenneErreursSaumonACP = mean(vecteurErreursSaumonACP)
moyenneErreursBarACP =  mean(vecteurErreursBarACP)

moyenneErreursSaumonACI = mean(vecteurErreursSaumonACI)
moyenneErreursBarACI =  mean(vecteurErreursBarACI)

% Courbes d'erreurs ACP
figure ('Name', 'Taux d erreurs ACP');
hold on;

plot(1:nbIter, vecteurErreursSaumonACP, '-b');
plot(1:nbIter, vecteurErreursBarACP, '-r');

hold off;

% Courbes d'erreurs ACI
figure ('Name', 'Taux d erreurs ACI');
hold on;

plot(1:nbIter, vecteurErreursSaumonACI, ':b');
plot(1:nbIter, vecteurErreursBarACI, ':r');

hold off;

%%%%% Droites %%%%%
%x=5:20;
% y1 = plan
%y1 = droite2DVd(x, V(:,1), [0,0]);
%plot(x, y1, 'c')

% y2 = droite
%y2 = droite2DVd(x, V(:,2), [0,0]);
%plot(x, y2, 'c')
%% Initialisation
% Donnees
load ('donnees1.mat')
load ('donnees2.mat')

partie2 = true;
if (partie2)
    C1 = C3;
    C2 = C4;
end;

% Misc
nbIter = 50;
W = [6; 1; 2; -3];

% Erreurs
vecteurErreursMapC1 = zeros(nbIter, 1);
vecteurErreursMapC2 = zeros(nbIter, 1);

vecteurErreursPerceptronC1 = zeros(nbIter, 1);
vecteurErreursPerceptronC2 = zeros(nbIter, 1);

vecteurErreursMoindresC1 = zeros(nbIter, 1);
vecteurErreursMoindresC2 = zeros(nbIter, 1);

vecteurErreursMoindresOptC1 = zeros(nbIter, 1);
vecteurErreursMoindresOptC2 = zeros(nbIter, 1);

%% Affichage donnees
close all
figure('Name', 'Donnees')
hold on

axis equal
scatter3(C1(:, 1), C1(:,2),C1(:, 3), '.r')
scatter3(C2(:, 1), C2(:,2),C2(:, 3), '.b')
hold off


%% Classification
for i = 1:nbIter
    %% Echantillons
    disp(['Iteration ', num2str(i), ' en cours.'])
    [TrainC1, TrainC2, TestC1, TestC2] = extractTestAndTrain(C1, C2);
    
    
    %% MAP
    % Modele
    modelMAPC1 = trainModel(TrainC1, size(C1, 1));
    modelMAPC2 = trainModel(TrainC2, size(C2, 1));
    
    % Classification
    resMAPC1 = maxPost(TestC1, modelMAPC2, modelMAPC1);
    resMAPC2 = maxPost(TestC2, modelMAPC2, modelMAPC1);
    
    % Recherche d'erreurs
    vecteurErreursMapC1(i) = sum(resMAPC1);
    vecteurErreursMapC2(i) = size(resMAPC2, 1) - sum(resMAPC2);
    
    
    %% Perceptron
    WPerceptron = perceptron(transpose(TestC1), transpose(TestC2), W);
    mpPerceptron = malPlaces(getYFromC(transpose(TestC1), transpose(TestC2)), WPerceptron); 
    
    % Recherche d'erreurs
    vecteurErreursPerceptronC1(i) = size(find(mpPerceptron(1,:)== 1), 2);
    vecteurErreursPerceptronC2(i) = size(find(mpPerceptron(1,:)== -1), 2);
    
    
    %% Moindre Carres
    WMoindres = moindresCarres(transpose(TestC1), transpose(TestC2));
    mpMoindres = malPlaces(getYFromC(transpose(TestC1), transpose(TestC2)), WMoindres);

    % Recherche d'erreurs
    vecteurErreursMoindresC1(i) = size(find(mpMoindres(1,:) == 1), 2);
    vecteurErreursMoindresC2(i) = size(find(mpMoindres(1,:) == -1), 2);
    
    
    %% Moindre Carres Optimises
    WMoindresOpt = moindresCarresOptimisation(transpose(TestC1), transpose(TestC2));
    mpMoindresOpt = malPlaces(getYFromC(transpose(TestC1), transpose(TestC2)), WMoindresOpt);

    % Recherche d'erreurs
    vecteurErreursMoindresOptC1(i) = size(find(mpMoindresOpt(1,:) == 1), 2);
    vecteurErreursMoindresOptC2(i) = size(find(mpMoindresOpt(1,:) == -1), 2);
    
    
end;


%% Taux d'erreurs
% MAP
pourcentageErreursMAPC1 = vecteurErreursMapC1 * 100 / size(TestC1, 1);
pourcentageErreursMAPC2 = vecteurErreursMapC2 * 100 / size(TestC2, 1);
pourcentageErreursMAP = (vecteurErreursMapC1 + vecteurErreursMapC2) * 100 / (size(TestC1, 1) + size(TestC2, 1));

% Moyenne MAP
moyennePourcentageErreursMAPC1 = mean(pourcentageErreursMAPC1)
moyennePourcentageErreursMAPC2 = mean(pourcentageErreursMAPC2)
moyennePourcentageErreursMAP = mean(pourcentageErreursMAP)


% Perceptron
pourcentageErreursPerceptronC1 = vecteurErreursPerceptronC1 * 100 / size(TestC1, 1);
pourcentageErreursPerceptronC2 = vecteurErreursPerceptronC2 * 100 / size(TestC2, 1);
pourcentageErreursPerceptron = (vecteurErreursPerceptronC1 + vecteurErreursPerceptronC2) * 100 / (size(TestC1, 1) + size(TestC2, 1));

% Moyenne perceptron
moyennePourcentageErreursPerceptronC1 = mean(pourcentageErreursPerceptronC1)
moyennePourcentageErreursPerceptronC2 = mean(pourcentageErreursPerceptronC2)
moyennePourcentageErreursPerceptron = mean(pourcentageErreursPerceptron)


% Moindres carres
pourcentageErreursMoindresC1 = vecteurErreursMoindresC1 * 100 / size(TestC1, 1);
pourcentageErreursMoindresC2 = vecteurErreursMoindresC2 * 100 / size(TestC2, 1);
pourcentageErreursMoindres = (vecteurErreursMoindresC1 + vecteurErreursMoindresC2) * 100 / (size(TestC1, 1) + size(TestC2, 1));

% Moyenne moindres carres
moyennePourcentageErreursMoindresC1 = mean(pourcentageErreursMoindresC1)
moyennePourcentageErreursMoindresC2 = mean(pourcentageErreursMoindresC2)
moyennePourcentageErreursMoindres = mean(pourcentageErreursMoindres)


% Moindres carres optimises
pourcentageErreursMoindresOptC1 = vecteurErreursMoindresOptC1 * 100 / size(TestC1, 1);
pourcentageErreursMoindresOptC2 = vecteurErreursMoindresOptC2 * 100 / size(TestC2, 1);
pourcentageErreursMoindresOpt = (vecteurErreursMoindresOptC1 + vecteurErreursMoindresOptC2) * 100 / (size(TestC1, 1) + size(TestC2, 1));

% Moyenne moindres carres optimises
moyennePourcentageErreursMoindresOptC1 = mean(pourcentageErreursMoindresOptC1)
moyennePourcentageErreursMoindresOptC2 = mean(pourcentageErreursMoindresOptC2)
moyennePourcentageErreursMoindresOpt = mean(pourcentageErreursMoindresOpt)


%% Affichage taux d'erreurs MAP
figure('Name', 'Taux d erreurs MAP')
hold on
axis auto

plot(pourcentageErreursMAPC1, 'red')
plot(pourcentageErreursMAPC2, 'blue')
plot(pourcentageErreursMAP, 'magenta')

hold off


%% Affichage taux d'erreurs Perceptron
figure('Name', 'Taux d erreurs Perceptron')
hold on
axis auto

plot(pourcentageErreursPerceptronC1, 'red')
plot(pourcentageErreursPerceptronC2, 'blue')
plot(pourcentageErreursPerceptron, 'magenta')

hold off


%% Affichage taux d'erreurs Moindres Carres
figure('Name', 'Taux d erreurs Moindres Carres')
hold on
axis auto

plot(pourcentageErreursMoindresC1, 'red')
plot(pourcentageErreursMoindresC2, 'blue')
plot(pourcentageErreursMoindres, 'magenta')

hold off


%% Affichage taux d'erreurs Moindres Carres Optimises
figure('Name', 'Taux d erreurs Moindres Carres Optimises')
hold on
axis auto

plot(pourcentageErreursMoindresOptC1, 'red')
plot(pourcentageErreursMoindresOptC2, 'blue')
plot(pourcentageErreursMoindresOpt, 'magenta')

hold off


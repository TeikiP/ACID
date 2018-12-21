close all;
hold on;

%% Initialisation
load('donnees.mat');

C1 = transpose(C1);
C2 = transpose(C2);

%C1 = [2 3 4; 1 2 2]
%C2 = [1 1 2 5; 2 3 3 3]
%C1 = [2 1 4; 1 3 2]
%C2 = [1 3 2 5; 2 2 3 3]

W = [6; 1; -3];

%% Affichage
axis auto;
scatter(C1(1,:), C1(2,:), 36, 'red', '.');
scatter(C2(1,:), C2(2,:), 36, 'blue', '.');
plotDroite(W, -5, 15, 'black');

%% Perceptron
WPerceptron = perceptron(C1, C2, W)
plotDroite(WPerceptron, -5, 15, 'green');

mpPerceptron = malPlaces(getYFromC(C1, C2), WPerceptron);
nbMalPlacesPerceptron = size(mpPerceptron, 2)
nbMalPlacesPerceptronC1 = size(find(mpPerceptron(1,:)== 1), 2)
nbMalPlacesPerceptronC2 = size(find(mpPerceptron(1,:)== -1), 2)

%% Moindres Carres
WMoindres = moindresCarres(C1, C2)
plotDroite(WMoindres, -5, 15, 'magenta');

mpMoindres = malPlaces(getYFromC(C1, C2), WMoindres);
nbMalPlacesMoindres = size(mpMoindres, 2)
nbMalPlacesMoindresC1 = size(find(mpMoindres(1,:) == 1), 2)
nbMalPlacesMoindresC2 = size(find(mpMoindres(1,:) == -1), 2)

%%
hold off;
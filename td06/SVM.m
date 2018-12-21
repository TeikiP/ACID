%% Initialisation
% Donnees
load ('donnees.mat')

%% Affichage donnees
close all
figure('Name', 'Donnees')
hold on

axis equal
%scatter(testC1(:, 1), testC1(:,2), '.r')
scatter(trainC1(:, 1), trainC1(:,2), '.r')
%scatter(testC2(:, 1), testC2(:,2), '.b')
scatter(trainC2(:, 1), trainC2(:,2), '.b')


%% SVM
% creation de la structure de donnees
TRAIN = [trainC1; trainC2];
CLASSE = [-1.*ones(size(trainC1,1), 1); ones(size(trainC2,1), 1)];
SVMmodel = fitcsvm(TRAIN, CLASSE, 'KernelFunction', 'rbf')
SVMmodel.IsSupportVector;


%% Meshgrid
d = 0.02; % le pas pour la grille
[x1Grid,x2Grid] = meshgrid(min(TRAIN(:,1)):d:max(TRAIN(:,1)),min(TRAIN(:,2)):d:max(TRAIN(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(SVMmodel,xGrid);
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');
scatter(SVMmodel.SupportVectors(:, 1), SVMmodel.SupportVectors(:,2), 'oblack')
hold off


%% Erreurs
%nbErreursC1 = size(find(C1appC2 > C1appC1), 1)
%nbErreursC2 = size(find(C2appC1 > C2appC2), 1)
%pctErreursC1 = 100 * nbErreursC1 / size(testC1, 1)
%pctErreursC2 = 100 * nbErreursC2 / size(testC2, 1)
%% Initialisation
% Donnees
load ('donnees.mat')

%% Affichage donnees
close all
figure('Name', 'Donnees')
hold on

axis equal
scatter(testC1(:, 1), testC1(:,2), '.r')
scatter(trainC1(:, 1), trainC1(:,2), '*r')
scatter(testC2(:, 1), testC2(:,2), '.b')
scatter(trainC2(:, 1), trainC2(:,2), '*b')
hold off


%% KNN
% creation de la structure de donnees
TRAIN = [trainC1; trainC2];
ppv = KDTreeSearcher(TRAIN);


%% C1
C1appC1 = zeros(size(testC1,1), 1);
C1appC2 = zeros(size(testC1,1), 1);

for i=1:size(testC1,1)
    % affichage des 3 plus proches voisins d'un point de test
    % n = indices dans TRAIN
    % d = distances entre les points
    [n, d]= knnsearch(ppv, testC1(i,:), 'k', 3);

    % nombres de voisins appartenant a C1 et C2
    C1appC1(i) = size(find(n <= size(trainC1, 1)), 2);
    C1appC2(i) = size(find(n > size(trainC1, 1)), 2);
end


%% C2
C2appC1 = zeros(size(testC2,1), 1);
C2appC2 = zeros(size(testC2,1), 1);

for i=1:size(testC2,1)
    % affichage des 3 plus proches voisins d'un point de test
    % n = indices dans TRAIN
    % d = distances entre les points
    [n, d]= knnsearch(ppv, testC2(i,:), 'k', 3);

    % nombres de voisins appartenant a C1 et C2
    C2appC1(i) = size(find(n <= size(trainC1, 1)), 2);
    C2appC2(i) = size(find(n > size(trainC1, 1)), 2);
end


%% Erreurs
nbErreursC1 = size(find(C1appC2 > C1appC1), 1)
nbErreursC2 = size(find(C2appC1 > C2appC2), 1)
pctErreursC1 = 100 * nbErreursC1 / size(testC1, 1)
pctErreursC2 = 100 * nbErreursC2 / size(testC2, 1)

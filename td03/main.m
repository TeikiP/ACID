% Valeurs initiales Saumon
sizeVTSaumon = 1000;
muSaumon = 12;
sigmaSaumon = 4;
VTSaumon = mvnrnd(muSaumon, sigmaSaumon, sizeVTSaumon);

% Valeurs initiales Bar
sizeVTBar = 3000;
muBar = 10;
sigmaBar = 2;
VTBar = mvnrnd(muBar, sigmaBar, sizeVTBar);


% Affichage repartition
close all;
hold on;
histogram(VTSaumon);
histogram(VTBar);
hold off;


% Valeurs initiales
nbIter = 100;
sizeTrain = 100;

vecteurBarErreursClassify = zeros(nbIter, 1);
vecteurSaumonErreursClassify = zeros(nbIter, 1);

vecteurBarErreursMaxPost = zeros(nbIter, 1);
vecteurSaumonErreursMaxPost = zeros(nbIter, 1);

vecteurBarErreursCout = zeros(nbIter, 1);
vecteurSaumonErreursCout = zeros(nbIter, 1);


for i=1:nbIter
    % Extract test and train
    [TrainSaumon, TrainBar, TestSaumon, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);
    
    
    % Creation du modele
    modelSaumon = trainModel(TrainSaumon, sizeVTSaumon);
    modelBar = trainModel(TrainBar, sizeVTBar);
    
    
    % Classification standard
    ResBarClassify = Myclassify(TestBar, modelBar, modelSaumon);
    ResSaumonClassify = Myclassify(TestSaumon, modelBar, modelSaumon);
    
    vecteurBarErreursClassify(i) = size(ResBarClassify,1)-sum(ResBarClassify);
    vecteurSaumonErreursClassify(i) =  sum(ResSaumonClassify);
    
    
    % Classification par max a posteriori
    ResBarMaxPost = maxPost(TestBar, modelBar, modelSaumon);
    ResSaumonMaxPost = maxPost(TestSaumon, modelBar, modelSaumon);
    
    vecteurBarErreursMaxPost(i) = size(ResBarMaxPost,1)-sum(ResBarMaxPost);
    vecteurSaumonErreursMaxPost(i) =  sum(ResSaumonMaxPost);    
    
    
    % Classification par risque
    ResBarCout = cout(TestBar, modelBar, modelSaumon);
    ResSaumonCout = cout(TestSaumon, modelBar, modelSaumon);
    
    vecteurBarErreursCout(i) = size(ResBarCout,1)-sum(ResBarCout);
    vecteurSaumonErreursCout(i) =  sum(ResSaumonCout);
    
end;


% Moyennes d'erreurs
moyenneErreursBarClassify =  mean(vecteurBarErreursClassify)
moyenneErreursSaumonClassify = mean(vecteurSaumonErreursClassify)

moyenneErreursBarMaxPost =  mean(vecteurBarErreursMaxPost)
moyenneErreursSaumonMaxPost = mean(vecteurSaumonErreursMaxPost)

moyenneErreursBarCout =  mean(vecteurBarErreursCout)
moyenneErreursSaumonCout = mean(vecteurSaumonErreursCout)


% Affichage des courbes de taux d'erreurs
figure;
hold on;

plot(1:nbIter, vecteurBarErreursClassify, '-b');
plot(1:nbIter, vecteurSaumonErreursClassify, '-r');

plot(1:nbIter, vecteurBarErreursMaxPost, ':b');
plot(1:nbIter, vecteurSaumonErreursMaxPost, ':r');

plot(1:nbIter, vecteurBarErreursCout, 'ob');
plot(1:nbIter, vecteurSaumonErreursCout, 'or');

hold off;
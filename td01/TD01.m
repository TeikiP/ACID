%% EXERCICE 1 : Creation de tableaux, accès à un élément

disp('-----------------------EXERCICE 1----------------------------------')

% les commandes se terminant par un point virgule ne s'affiche pas

% A tester
% 
% % L'espace ou la virgule sont equivalents pour definir les tableaux.
% 

L1 = [10 20 30 40]
L2 = [5, 10, 15, 20]
 
% 
% % Creation d'un vecteur colonne
% % Le point virgule permet de passer a la ligne suivante.
% 

C1 = [10; 20; 30; 40]

 
%
% % Acces a un element d'un tableau. Les indices commencent a 1
%
 
L2(1)
C1(2)

% 
% % definition d'une matrice 3x3
%
 
M1 = [ 10 20 30 ; 40 50 60; 70 80 90]

% 
% % taille d'un tableau
% 

size(L1)
size(C1)
size(M1)

% 
% % La taille est une structure 
% % Premiere valeur : le nombre de lignes
% % Seconde valeur  : le nombre de colonnes
% 
 
size(L1, 1)
size(L1, 2)
 
size(C1, 1)
size(C1, 2)
 
nbLig = size(M1, 1)
nbCol = size(M1, 2)

% 
% % Acceder aux elements d'un tableau 2D (indiceLigne, indiceColonne)
% 
% 

iL = 2;
iC = 3;
M1(iL, iC)

%
% % Extraire une colonne
%

M1
M1(:,1)
M1(:,3)
 
% 
% % Extraire une ligne 
% 
 
M1(2,:)

%
% %  Extraire un sous-tableau
%
 
M1(2:3,1:2)
 
% 
% % Supprimer des lignes. Modifie le tableau
%

M2 = M1
M2(2:3,:) = []

% 
% % Supprimer des colonnes
% 
 
M2(:,2:3) = []
M1


% 
% % Fonctions predefinies de creation de tableaux
% 
 
M2 = zeros(3) % tableau 3x3!
 
M3 = zeros(1,3) % vecteur ligne 1x3
 
M4 = ones(2,4)

Id = eye(2,3) % tableau 2x3 rempli de 0 avec 1 sur diagonale depuis haut gauche 

%
% % Tableau de valeurs parcourant un intervalle
%
 
V1 = 1:10 % 1 a 10 par pas de 1 par defaut

V2 = 1:0.2:5 % 1 a 5 par pas de .2

M5 = [1:1:5;2:1:6]

%
% %  Creer un tableau à partir de ses lignes
% 

T1 = [5 1 3]
T2 = [10 4 2]
T3 = [3 5 0]
M6 = [T1; T2; T3] 

% ou 
% M6 =  vertcat(T1, T2, T3)

% 
% % Concaténer des tableaux 1D
%

M7 = [T1 T2 T3]
% ou
% M7 = horzcat(T1, T2, T3)
 


%  
% % Dupliquer une matrice
% 
 
M8 = [1 2 3 ; 4 5 6]
M9 = repmat(M8, 3, 2) % replique M8 sur 3 lignes et 2 colonnes

%  
% % Redimensionner une matrice
% % le nombre d'elements est le meme avant et apres
% % le parcours colonne par colonne donne la meme suite d'elements
%

M10 = reshape(M9, size(M9,2)/2, size(M9,1)*2)

% 
% % Creer un tableau aleatoirement.
%  

V3 = rand(1, 10) % vecteur de 10 valeurs comprises entre 0 et 1

M11 = rand(5, 3) % matrice de taille 5x3 de valeurs comprises entre 0 et 1

M12 = randi(50, 1, 20) % vecteur de 20 valeurs comprises entre 0 et 50


%% EXERCICE 2 : Trier un tableau 

disp('-----------------------EXERCICE 2----------------------------------')

% A tester

V4 = sort(V3)

M13 = reshape(V4, 2, 5)

sort(M11, 1) % chaque colonne est triée

sort(M11, 2) % chaque ligne est triée


disp('-----------------------')

% Tri croissant d'une matrice
% A ecrire
M = randi(100, 4, 9)
M = reshape(M, 1, 36)
M = sort(M)
M = reshape(M, 9, 4)
M = transpose(M)


 
%% EXERCICE 3 : Indexation logique

disp('-----------------------EXERCICE 3----------------------------------')

% A tester
%
% % Chercher des elements dans un tableau, B1 est un tableau de booleens
% 

V5 = randi(25,1,200)
B1 = V5>20

% 
% % V6 contient les valeurs de V5 qui sont superieures a 20
%

% V6 = V5(B1)
% ou
V6 = V5(V5>20)

%
% % Index contient les indices dans V5 ou les elements sont superieurs a 20. 
%
V5
Index = find(V5 > 20)
Index = find(V5 == 20) % egal a 20

disp('-----------------------')

% A ecrire

Va = randi(100, 1, 10)
Vb = randi(100, 1, 10)

disp('-----------------------')

% Recherche du maximum
Vmax = max(Va, Vb)

Vmax2 = Va;
Vmax2(Va<Vb) = Vb(Vb>Va)

% sinon :
% TabIndice = Va > Vb
% Vmax = TabIndice .* Va + ~TabIndice .* Vb

disp('-----------------------')

% Recherche du minimum
Vmin = min(Va, Vb)

Vmin2 = Va;
Vmin2(Va>Vb) = Vb(Vb<Va)

%% EXERCICE 4 : opérations arithmétiques sur vecteurs et matrices

disp('-----------------------EXERCICE 4----------------------------------')

% A tester

Mat1 = randi(20, 10, 10)

Mat2 = randi(20, 10, 10)

VecLigne = randi(20, 1, 10)

VecCol = VecLigne' % equivalent a VecCol = transpose (VecLigne)
 
%
% % Addition et soustraction - fonctionne sur des matrices de meme taille
%
  
Mat3 = Mat1 + Mat2
Mat4 = Mat1 - Mat2
   
%
% % Somme des éléments d'une matrice
% 

S1 = sum(VecLigne)
S2 = sum(VecCol)
S3 = sum(Mat1) % somme colonne par colonne
S4 = sum(Mat1, 1) % idem 
S5 = sum(Mat1, 2) % somme ligne par ligne


% 
% % Multiplication de deux matrices (attention a la coherence des dimensions)
% 

Mat1
Mat2

Mat5 = Mat1*Mat2 % produit scalaire

Mat6 = Mat1 .* Mat2 % multiplication terme a terme

Vec1 = Mat1 * VecCol
 
Vec2 = VecLigne * Mat2
 
Mat7 = VecCol * VecLigne
 
ProduitScalaire =  VecLigne * VecCol

%
% % Inversion et resolution de systeme lineaire
% 

InvMat3 = inv(Mat3) % inverser une matrice (si elle est inversible)


Res = Mat3\VecCol
% ou
% Res1= InvMat3*VecCol

% produit scalaire possible :

% M(5,5) .* M(5,5) --> possible
% M(5,5) .* M(10,5) --> impossible

%% EXERCICE 5 : affichage 

disp('-----------------------EXERCICE 5----------------------------------')

% A tester

%
% % Affichage d'une courbe définie par les coordonnées de ses points
%

X = -10:0.1:10;
Y = normpdf(X, 0, 1);

% plot(X, Y) % continue
% ou 
% plot(X, Y, 'g--x') % croix
% ou 
scatter(X, Y) % cercles

%
% % On peut superposer plusieurs affichage dans la meme figure
%

Y2 = normpdf(X, 3, 2);
hold on;
plot(X, Y)
plot(X, Y2)
hold off; 

%
% % On peut creer plusieurs figures en meme temps
%
close all % pour fermer d'autres figures creees precedemment
figure('Name', 'loi normale de moyenne 0')
plot(X, Y)
figure('Name', 'loi normale de moyenne 3')
plot(X, Y2)


%
% % utilisation de la fonction parabole (fichier parabole.m)
%

close all
axis auto;
X = -100: 100;
Y = parabole(X);
plot(X, Y)

% ou 
close all
%fplot('parabole',[-100 100])

%
% % en 3D
%


mu = [0 0];
sigma = [2 1; 1 3];

x1 = -10:0.5:10;
y1 = -10:0.5:10;

[X,Y] = meshgrid(x1, y1);

Z = mvnpdf([X(:) Y(:)], mu, sigma);

S = reshape(Z,length(x1),length(y1));

% surf(x1, y1, S);
% ou 
scatter3(X(:), Y(:), Z)

caxis([min(S(:))-.5*range(S(:)),max(S(:))]);

axis([-10 10 -10 10 0 .2])

xlabel('x'); ylabel('y'); zlabel('Probability Density');
close all
% A ecrire



disp('-----------------------EXERCICE 6----------------------------------')


vd = [1 2]
n = vd
p = [1 1]
x = -10:0.1:10
y = droite2dvd(x,vd,p)
y2 = droite2DNorm(x,n,p)
hold on;
plot(x,y)
plot(x,y2)
hold off;


disp('-----------------------EXERCICE 7----------------------------------')


m = 40;
sizeNoise = 10;
x = rand(m,1).*50 + 5;
noise = rand(m,1) * sizeNoise;
pente = 0.8;
c =  20;
y = c + pente*x + noise

teta1 = (m*sum(x.*y) - sum(x)*sum(y)) / (m*sum(x.*x) - sum(x)*sum(x))
teta0 = (sum(y) - teta1*sum(x)) / m

% le teta obtenu par calcul est le même que regress

x2 = [ones(1,40); transpose(x)];
x2 = transpose(x2);
b = regress(y,x2)

X = 0:60 ;
Y = b(1) + b(2) * X;
close all
hold on
scatter(x, y)
plot(X, Y);
hold off



close all;

figure('Name', 'parabole et sa derivee') 
hold on;

axis auto;
X = -100: 100;
Y = parabole(X);
%plot(X, Y) % trace x²


dY = diff(Y)./diff(X);
length(X)
length(dY)

% Comparer la courbe suivante :
%plot(X(:, 1:length(X)-1),dY,'r') % trace la dérivé soit 2x

% Avec celle-ci
Yd = 2*X;
%plot(X, Yd, 'g') % trace 2x soit la dérivé

% Les 2 droites sont les mêmes

hold off

figure('Name', 'animation parabole')

% en un point de la parabole, on affiche la tangente (le coefficient directeur est la derivee)

hold on;

plot(X,Y)

for i=-80:20:80
    
    plot(i,parabole(i),'or'); % trace un point tout les 20 en partant de -80
    
    tg =2*i*10+parabole(i);
    
    plot([i;i+10],[parabole(i);tg],'r') % trace la tangente aux points tracés précédemment
    
    pause(3);
end








%P = [5, 2, 3]
P = [30 -61 41 -11 1]

X = 0:.1:6;
Y = valeurPolynome(P, X);
d = derivPoly(P);


close all;

figure('Name', 'Descente de gradient') 
hold on;


plot(X, Y, 'b:')

pause(1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
epsilon = 0.1;
nu = .05;

x0 = 0;
xcurrent = x0 - nu*valeurPolynome(derivPoly(P), x0);
xprec = x0;

plot(x0, valeurPolynome(P, x0), 'or', 'MarkerSize', 20);


while(abs(xprec - xcurrent) > epsilon)
    plot(xcurrent, valeurPolynome(P, xcurrent), 'ob');
   
	xprec  = xcurrent;
	xcurrent = xprec - nu*valeurPolynome(derivPoly(P), xprec); %MaJ du point
    
	pause(1);
end

% affichage du minimum
plot(xcurrent, valeurPolynome(P, xcurrent), 'xr', 'MarkerSize', 20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

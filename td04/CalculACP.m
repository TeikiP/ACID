function [ W V ] = CalculACP( echantillon, k )
    % Prend un ensemble d'enchantillon et un entier de taille k.
    % Renvoie les k premiers vecteurs propres tries en fonctions de leur
    % valeur propre dans l'ordre decroissant.
    
    A = cov(echantillon);
    
    % Etape 4
    [V D] = eig(A); % [vecteurs propres en colonnes, valeurs propres]

    % Etape 5 du cours
    [lambdaS, indices] = sort(diag(D), 'descend');
    
    % Etape 6 du cours
    % W se calcul a partir de TrainBar et TrainSaumon
    W = V(:, indices(1:k));

end


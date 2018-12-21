function [ W V ] = CalculACI (EchantillonC1, EchantillonC2) 
    % Calcul des moyennes
    mu1 = transpose(mean(EchantillonC1));
    mu2 = transpose(mean(EchantillonC2));
    
    S1 = cov(EchantillonC1);
    S2 = cov(EchantillonC2);
    Sw = S1 + S2;
    Sb = (mu1-mu2)*transpose((mu1-mu2));
    invSwSb = inv(Sw) * Sb;

    % Etape 4
    [V D] = eig(invSwSb);

    % Etape 5 du cours
    [lambdaS, indices] = sort(diag(D), 'descend');
    
    % Etape 6 du cours
    W = V(:, indices(1));

end


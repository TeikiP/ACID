function [ proj ] = Projection( W, echantillon )
    % Prend une matrice de projection W et un ensemble d'echantillon
    % Echantillon et renvoie la projection de cet ensemble.
    
    proj = echantillon * W;
    
end


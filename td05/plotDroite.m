function [] = plotDroite (W, Xmin, Xmax, c) 

    X = [Xmin Xmax];
    Y = -(W(1) + X * W(2)) / W(3);
    plot(X, Y, c);

end
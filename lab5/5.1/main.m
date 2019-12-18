A = load('../data_lvq_A.mat').matA;
B = load('../data_lvq_B.mat').matB;
eta = 0.01;
doPlot = false;

% Combine data sets with labels
A(:,3) = 1;
B(:,3) = 2;
X = [A ; B];

% Q1
if doPlot
    figure(1);
    plotData(X);
end

% Create prototypes 
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];
nProt = 3;
prototype = zeros(nProt, 3);
prototype(:,1) = xRange(1)+rand(1,nProt)*(xRange(2)-xRange(1));
prototype(:,2) = yRange(1)+rand(1,nProt)*(yRange(2)-yRange(1));
% Label prototypes (Q2)
prototype(1,3) = 1;  % A
prototype(2,3) = 1;  % A
prototype(3,3) = 2;  % B



% LVQ (based on Q3 = 4,6,3,8,2,5)
epochs = 100;    % number of epochs
E = [];         % for saving training errors
for e = 1:epochs
    P = length(X);   % number of examples
    for i = 1:P
        example = X(i, :);
        dist = pdist2(example(1:2), prototype(:,1:2), 'squaredeuclidean');
        [~,wstar] = min(dist);
        prototype(wstar,1:2) = prototype(wstar,1:2) + eta * Psi(prototype(wstar,3), example(3)) * (example(1:2) - prototype(wstar,1:2));
    end
    E = [E trainingError(X, prototype)];
end

figure(2)
plot(1:length(E), E);
ylim([0 1]);
xlabel('Epochs');
ylabel('Classification error (training)');
title('LVQ training error curve');

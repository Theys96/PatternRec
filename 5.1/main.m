A = load('data_lvq_A.mat').matA;
B = load('data_lvq_B.mat').matB;
doPlot = true;

% Combine data sets with labels
A(:,3) = 1;
B(:,3) = 2;
X = [A ; B];

% Q1
if doPlot
    figure(1);
    plotData(X);
end

% Create prototypes (Q4)
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];
nProt = [2 1]; %now an array so as to comprehend Q5
prototype = create_prototype(nProt,xRange,yRange);



%Call LVQ routine and get training error
plateau_epochs = 30;  %plateau length (in terms of epochs) to be reached before stopping
max_epochs = 500 ; %if no plateau is found, stop training after max_epochs epochs
eta = 0.01;
[E,~] = LVQ(X,prototype,eta,plateau_epochs,max_epochs);


%Q4 plot
titleon = true;
figure(4)
plot_error_curve(E,nProt,eta,titleon);

%Q5 & Q6 plot
nProt_list = [[1 1]; [1 2]; [2 1]; [2 2]];
titleon = false;
for i = 1:4
  figure(5)
  subplot(2,2,i);
  nProt = nProt_list(i,:);
  prototype = create_prototype(nProt,xRange,yRange);
  [E,prototype] = LVQ(X,prototype,eta,plateau_epochs,max_epochs);
  Xprot = attach_data_to_prototypes(X,prototype);
  plot_error_curve(E,nProt,eta,titleon);
  
  figure(6)
  subplot(2,2,i);
  plotData(X,prototype,Xprot);
end
figure(5)
sgtitle({'LVQ training error curve' sprintf('\\eta = %.2f',eta)},'FontSize',15);
figure(6)
sgtitle({'Data points and learnt prototypes' sprintf('\\eta = %.2f',eta)},'FontSize',15);
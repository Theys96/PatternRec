A = load('data_lvq_A.mat').matA;
B = load('data_lvq_B.mat').matB;
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

% Create prototypes (Q4)
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];
nProt = [2 1]; %now an array so as to comprehend Q5
prototype = create_prototype(nProt,xRange,yRange);



%Call LVQ routine and get training error
plateau_epochs = 30;  %plateau length (in terms of epochs) to be reached before stopping
max_epochs = 500 ; %if no plateau is found, stop training after max_epochs epochs
eta = 0.01;
post_training = false; %if true LQV also returns example-to-prototype coupling
[E,~,~] = LVQ(X,prototype,eta,plateau_epochs,max_epochs,post_training);


%Q4 plot
titleon = true;
plot_error_curve(E,nProt,eta,titleon);

%Q5 & Q6 plot
nProt_list = [[1 1]; [1 2]; [2 1]; [2 2]];
titleon = false;
post_training = true;
for i = 1:4
  figure(9)
  subplot(2,2,i);
  nProt = nProt_list(i,:);
  prototype = create_prototype(nProt,xRange,yRange);
  [E,prototype,Xprot] = LVQ(X,prototype,eta,plateau_epochs,max_epochs,post_training);
  plot_error_curve(E,nProt,eta,titleon);
  
  figure(10)
  subplot(2,2,i);
  plotData(X,prototype,Xprot);
end
figure(9)
sgtitle({'LVQ training error curve' sprintf('\\eta = %.2f',eta)},'FontSize',15);
figure(10)
sgtitle({'Data points and learnt prototypes' sprintf('\\eta = %.2f',eta)},'FontSize',15);
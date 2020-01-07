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
nProt = [2 1]; % now an array so as to comprehend Q5
prototype = create_prototype(nProt,xRange,yRange);

%Call LVQ routine and get training error
plateau_epochs = 10;   % plateau length (in terms of epochs) to be reached before stopping
max_epochs = 300;      % if no plateau is found, stop training after max_epochs epochs
eta = 0.01;
lambda = [0.5 0.5];
lambdeta = 0.001;
[E,prototype,lambda_out] = RLVQ(X,prototype,eta,lambda,lambdeta,plateau_epochs,max_epochs);


% Q2
titleon = true;
figure(2)
Xprot = attach_data_to_prototypes(X,prototype,lambda_out(end,:));
plotData(X,prototype,Xprot);

% Q3
figure(3)
subplot(1,2,1)
Xprot = attach_data_to_prototypes(X,prototype,lambda_out(end,:));
plot_error_curve(E,nProt,eta,titleon);
subplot(1,2,2)
plot_lambda_vals(lambda_out,lambdeta,titleon);


% Copied in from 5.1
%{
%Q5 & Q6 plot
nProt_list = [[1 1]; [1 2]; [2 1]; [2 2]];
titleon = false;
for i = 1:4
  figure(9)
  subplot(2,2,i);
  nProt = nProt_list(i,:);
  prototype = create_prototype(nProt,xRange,yRange);
  [E,prototype] = LVQ(X,prototype,eta,plateau_epochs,max_epochs);
  Xprot = attach_data_to_prototypes(X,prototype);
  plot_error_curve(E,nProt,eta,titleon);
  
  figure(10)
  subplot(2,2,i);
  plotData(X,prototype,Xprot);
end
figure(9)
sgtitle({'LVQ training error curve' sprintf('\\eta = %.2f',eta)},'FontSize',15);
figure(10)
sgtitle({'Data points and learnt prototypes' sprintf('\\eta = %.2f',eta)},'FontSize',15);
%}
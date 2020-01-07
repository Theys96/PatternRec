%load data
A = load('data_lvq_A.mat').matA;
B = load('data_lvq_B.mat').matB;

% Combine data sets with labels and concatenate data
A(:,3) = 1;
B(:,3) = 2;
X = [A; B];

%obtain data set ranges in feature space
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];

ntrain = 9; %n° of training subsets in each fold
ntest = 1;  %n° of test subsets in each fold
nfolds = 10;

nProt = [2 1]; %best option is 2 prototypes for class A and 1 for class B
eta = 0.01; %LVQ learning parameter
plateau_epochs = 30; %plateau length (in terms of epochs) to be reached before stopping
max_epochs = 500;    %if no plateau is found, the training eventually stops anyway
training_errors = [];%to store final classification in-training error from each fold
test_errors = [];    %same as above but for fold-wise test errors

for fold = 1:nfolds
  %obtain training and test sets for current fold
  [train,test] = dataset_split(X,ntrain,ntest,fold);
  %initialize prototypes coordinates before training
  prototype = create_prototype(nProt,xRange,yRange);
  %Training the LVQ1 classifier
  for i = 1:ntrain
    [E,prototype] = LVQ(train(:,:,i),prototype,eta,plateau_epochs,max_epochs);
  end
  training_errors = [training_errors E(end)];
  %Testing the model in current fold
  test_err = trainingError(test,prototype);
  test_errors = [test_errors test_err];
end

%average generalization error across 10 folds
mean_err = mean(test_errors);

%Sanity check 
%Plot the learnt vector quantization model embedded in the feature space
%Xprot = attach_data_to_prototypes(X,prototype);
%plotData(X,prototype,Xprot);

%visualize the 10-fold cv classification errors in a bar plot
barplot(training_errors,mean_err);
  
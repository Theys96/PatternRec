%load data
A = load('data_lvq_A.mat').matA;
B = load('data_lvq_B.mat').matB;

% Combine data sets with labels and concatenate data
A(:,3) = 1;
B(:,3) = 2;
X = [A; B];

ntrain = 9;
ntest = 1;
[train,test] = dataset_split(X,ntrain,ntest);

% Create prototypes
%obtain data set ranges in feature space
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];
nProt = [2 1]; %best option is 2 prototypes for class A and 1 for class B

%initialize prototypes coordinates before training
prototype = create_prototype(nProt,xRange,yRange);

eta = 0.01; %learning parameter
plateau_epochs = 30; %plateau length (in terms of epochs) to be reached before stopping
max_epochs = 500;    %if no plateau is found, the training eventually stops anyway
error_vec = [];      %to store classification errors from each subset

%Training the LVQ1 classifier
for i = 1:ntrain
  [E,prototype] = LVQ(train(:,:,i),prototype,eta,plateau_epochs,max_epochs);
  error_vec = [error_vec E(end)];
end

%Testing the model 
test_err = trainingError(test,prototype)
error_vec = [error_vec test_err];
  
mean_err = mean(error_vec);

%Sanity check 
%Plot the learnt vector quantization model embedded in the feature space
Xprot = attach_data_to_prototypes(X,prototype);
plotData(X,prototype,Xprot);

%visualize the 10-fold cv classification errors in a bar plot
barplot(error_vec);
  
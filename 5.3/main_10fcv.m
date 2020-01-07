% load data
A = load('data_lvq_A.mat').matA;
B = load('data_lvq_B.mat').matB;

% Combine data sets with labels and concatenate data
A(:,3) = 1;
B(:,3) = 2;
X = [A; B];

% obtain data set ranges in feature space
xRange = [min(X(:,1)) max(X(:,1))]; 
yRange = [min(X(:,2)) max(X(:,2))];

nfolds = 10;

nProt = [2 1];        % best option is 2 prototypes for class A and 1 for class B
eta = 0.01;           % LVQ learning parameter
plateau_epochs = 30;  % plateau length (in terms of epochs) to be reached before stopping
max_epochs = 500;     % if no plateau is found, the training eventually stops anyway
training_errors = []; % to store final classification in-training error from each fold
test_errors = [];     % same as above but for fold-wise test errors
lambda = [0.5 0.5];
lambdeta = 0.001;

splits = dataset_split(X,nfolds);

for fold = 1:nfolds
  % obtain training and test sets for current fold
  % initialize prototypes coordinates before training
  prototype = create_prototype(nProt,xRange,yRange);
  
  % convoluted way of extracting all data points for training and
  % concatenating those chunks
  train = reshape(permute(splits(:,:,1:end ~= fold),[1 3 2]), [], 3, 1);
  test  = splits(:,:,fold);
  
  % Training the LVQ1 classifier
  [E,prototype,lambda_out] = RLVQ(X,prototype,eta,lambda,lambdeta,plateau_epochs,max_epochs);
  
  % Testing the model in current fold
  test_err = trainingError(test, prototype, lambda_out(end,:));
  test_errors(fold) = test_err;
  training_errors(fold) = E(end);
end

% average generalization error across 10 folds
mean_err = mean(test_errors);

% visualize the 10-fold cv classification errors in a bar plot
figure(4);
barplot(training_errors,mean_err);

function [train,test] = dataset_split(data,ntrain,ntest)
  nsubsets = ntrain + ntest;
  %obtain size of the data set
  nfeatures = size(data,2);
  nexamples = size(data,1);
 
  split = nexamples/2; %the data set is split halfway between classes A and B
  nsamples = nexamples/nsubsets; %number of samples in each subset
  if mod(nsamples,1) ~= 0
    error('n° of examples / n° of subsets must be integer');
  end
  
  %array initializations
  train = zeros([nsamples,nfeatures,ntrain]); %third dimension represents subset
  test  = zeros([nsamples,nfeatures]);        %doesn't require 3rd dimension as it is a single subset
  
  
  %The training subsets and the test set are obtained sequentially (and not
  %randomly) in such a way that each subset contains as much class A
  %examples as class B examples. 
  
  half = nsamples/2; %each subset will be split halfway in such a way to resemble the parent data set
  k = 0; 
  ss = 1; %subset index
  
  %training subsets
  while ss <= ntrain
    train(1:half,:,ss)          = data((k*half)+1:(k*half)+half,:);
    train(half+1:nsamples,:,ss) = data(split+(k*half)+1:split+(k+1)*half,:);
    k = k+1;
    ss = ss+1;
  end
  %test subset
  test(1:half,:)          = data((k*half)+1:(k*half)+half,:);
  test(half+1:nsamples,:) = data(split+(k*half)+1:split+(k+1)*half,:);
end
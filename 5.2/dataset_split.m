function [train,test] = dataset_split(data,ntrain,ntest,fold)
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
  idx = 1:nsubsets;  %array of indices
  idx(fold) = [];    %remove idx correspondent to test subset
  
  %test subset
  test(1:half,:)          = data(((fold-1)*half)+1:((fold-1)*half)+half,:);
  test(half+1:nsamples,:) = data(split+((fold-1)*half)+1:split+fold*half,:);
  
  %training subsets
  for ss = 1:ntrain
    train(1:half,:,ss)          = data(((idx(ss)-1)*half)+1:((idx(ss)-1)*half)+half,:);
    train(half+1:nsamples,:,ss) = data(split+((idx(ss)-1)*half)+1:split+idx(ss)*half,:);
  end
  
end
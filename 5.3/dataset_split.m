function splits = dataset_split(data,nsplit)
  %obtain size of the data set
  nfeatures = size(data,2);
  nexamples = size(data,1);
 
  split = nexamples/2; %the data set is split halfway between classes A and B
  nsamples = nexamples/nsplit; %number of samples in each subset
  if mod(nsamples,1) ~= 0
    error('n° of examples / n° of subsets must be integer');
  end
  
  %array initializations
  splits = zeros([nsamples,nfeatures,nsplit]); %third dimension represents subset
  
  %The training subsets and the test set are obtained sequentially (and not
  %randomly) in such a way that each subset contains as much class A
  %examples as class B examples. 
  
  half = nsamples/2; %each subset will be split halfway in such a way to resemble the parent data set
  
  %training subsets
  for ss = 1:nsplit
    splits(1:half,:,ss)          = data(((ss-1)*half)+1:((ss-1)*half)+half,:);
    splits(half+1:nsamples,:,ss) = data(split+((ss-1)*half)+1:split+ss*half,:);
  end
  
end
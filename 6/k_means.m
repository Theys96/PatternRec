function [clusters, prototypes] = k_means(data,k,evolution)
  %if evolution is true, also plot the intermediate prototype locations
  P = size(data,1);
  if k > P
    error('k must be less/equal than n° of patterns');
  end
  
  %initialize prototypes as k randomly drawn patterns
  rdm_indices = randperm(P,k);
  prototypes = data(rdm_indices,:);
  old_prototypes = zeros([k,2]);
  
  %display initial location of prototypes
  if exist('evolution','var')
    plot_prototypes(prototypes,old_prototypes,"start");
    hold on
  end
  
  epoch = 0;
  while 1
    epoch = epoch + 1;
    old_prototypes = prototypes; %keep track of previous prototype set
    %compute distances between each given data point and the prototypes
    %then assign each point to the closest prototype
    clusters = cell([1,k]); %need be a cell array cause cluster lists have different sizes
                            %each cell contains one of the ?x2 clusters of data points
    idx = zeros([1,k]);
    idx = idx+1;
    
    for i = 1:P
      pattern = data(i,:);
      dist = pdist2(pattern, prototypes, 'squaredeuclidean');
      [~,nmu] = min(dist);
      clusters{nmu}(idx(nmu),:) = pattern;
      idx(nmu) = idx(nmu) + 1; 
    end
    
    %update prototypes accordingly 
    for i = 1:k
      prototypes(i,:) = mean(clusters{i});
    end
        
    %check whether to keep training or not
    if prototypes == old_prototypes
      %epoch
      if exist('evolution','var')
        plot_prototypes(prototypes,old_prototypes,"end");
        hold on
      end
      break
    else
      if exist('evolution','var')
        plot_prototypes(prototypes,old_prototypes);
        hold on
      end
    end
end
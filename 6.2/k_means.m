function [clusters, prototypes, epochs] = k_means(data,k,evolution,plusplus,import)
  %if evolution is true, also plot the intermediate prototype locations
  %if plusplus is true, do k means ++ initialization
  
  P = size(data,1);
  if k > P
    error('k must be less/equal than n° of patterns');
  end
  
  %initialize prototypes
  old_prototypes = zeros([k,2]);
  
  if import == true
    sbrace = @(x,y)(x{y});
    fromfile = @(x)(sbrace(struct2cell(load(x)),1));
    prototypes = fromfile('clusterCentroids.mat');
  elseif plusplus == false  %as k randomly drawn patterns
    rdm_indices = randperm(P,k);
    prototypes = data(rdm_indices,:);
    
  elseif plusplus == true % ++ enhanced initialization
    idx = randi(P);       %first prototype is picked randomly
    prototypes(1,:) = data(idx,:);
    for mu = 2:k   %the left k-1 prototypes are picked among (still unchosen) data points
                   %more likely the farther the data points are from the
                   %nearest previously chosen prototype
      dist = pdist2(data,prototypes,'squaredeuclidean');
      dvec = min(dist,[],2)';
      cumdvec = cumsum(dvec);   %cumulative sum array
      loc = idx(mu-1);
      while any(idx==loc) %to prevent an existing prototype to be chosen again
        rdm = rand*cumdvec(end);  %random value in [0,max(cumulative dist)]
        loc = locate_value(rdm,cumdvec);
      end
      idx = [idx loc]; %locate the drawn value accordingly in the cumulative array                               
      prototypes(mu,:) = data(idx(mu),:);    %pick the correspondent point as next new prototype
    end
  end  
  
  %display initial location of prototypes
  if evolution == true
    plot_prototypes(prototypes,old_prototypes,"start");
    hold on
  end
  
  epoch = 0;
  maxepochs = 250;
  while epoch <= maxepochs %to quit the loop if no convergence is found
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
      fprintf('converged in %g epochs \n',epoch);
      epochs = epoch;
      if evolution == true
        plot_prototypes(prototypes,old_prototypes,"end");
        hold on
      end
      break
    else
      if evolution == true
        plot_prototypes(prototypes,old_prototypes);
        hold on
      end
    end
end
function [prototypes] = batchNG(Data, n, epochs, xdim, ydim)

% Batch Neural Gas
%   Data contains data,
%   n is the number of clusters,
%   epoch the number of iterations,
%   xdim and ydim are the dimensions to be plotted, default xdim=1,ydim=2

error(nargchk(3, 5, nargin));  % check the number of input arguments
if (nargin<4)
  xdim=1; ydim=2;   % default plot values
end;

[dlen,dim] = size(Data);

%prototypes =  % small initial values
% % or
sbrace = @(x,y)(x{y});
fromfile = @(x)(sbrace(struct2cell(load(x)),1));
prototypes=fromfile('clusterCentroids.mat');

lambda0 = n/2; %initial neighborhood value
% lambda
lambda = lambda0 * (0.01/lambda0).^([0:(epochs-1)]/epochs);
% note: the lecture slides refer to this parameter as sigma^2
%       instead of lambda

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Action

for i=1:epochs,
  D_prototypes    = zeros(n,dim);     % difference for vectors is initially zero
  D_prototypes_av = zeros(n,1);       % the same holds for the quotients
  
  for j=1:dlen,  % consider all points at once for the batch update
    
    % sample vector
    x = Data(j,:);       % sample vector
    
    % compute ranks
    dist = pdist2(prototypes, x, 'squaredeuclidean');
    [~,p] = sort(dist,'ascend');
    rank = 1:length(dist);
    rank(p) = rank - 1;
    
    % compute updates for all prototypes based on current sample vector
    D_prototypes    = D_prototypes + exp(-rank / lambda(i))' * x;
    D_prototypes_av = D_prototypes_av + exp(-rank / lambda(i))';
  end
  D_prototypes = D_prototypes ./ D_prototypes_av;
      
  % update
  prototypes = D_prototypes ;
  
  % track
  if 1   %plot each epoch
    fprintf(1,'%d / %d \r',i,epochs);
    hold off
    plot(Data(:,xdim),Data(:,ydim),'bo','markersize',3)
    hold on
    plot(prototypes(:,xdim),prototypes(:,ydim),'r.','markersize',10,'linewidth',3)
    % write code to plot decision boundaries
    voronoi(prototypes(:,xdim),prototypes(:,ydim))
    %pause
    %or
    drawnow
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

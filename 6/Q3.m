data = load('kmeans1.mat').kmeans1;
%Q3
kvec = [2 4 8];
fig = 1;
for k = kvec
  fprintf('k_meaning k = %g ... \n',k);
  figure(fig);
  [clusters,prototypes] = k_means(data,k,true,false);
  fig = fig + 1;
end
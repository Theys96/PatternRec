data = load('kmeans1.mat').kmeans1;

%Q3
for k = kvec
  figure(fig);
  [clusters,prototypes] = k_means(data,k,true);
  fig = fig + 1;
end
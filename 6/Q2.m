data = load('kmeans1.mat').kmeans1;

%Q2
kvec = [2 4 8];
fig = 1;
for k = kvec
  [clusters,prototypes] = k_means(data,k,false,true);
  figure(fig);
  scatter_cp(clusters,prototypes);
  fig = fig + 1;
end
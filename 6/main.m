data = load('kmeans1.mat').kmeans1;
%test
%k = 10;
%[clusters,prototypes] = k_means(data,k);

% Q2
kvec = [2 4 8];
fig = 1;
for k = kvec
  [clusters,prototypes] = k_means(data,k);
  figure(fig);
  scatter_cp(clusters,prototypes);
  fig = fig + 1;
end

%Q3
for k = kvec
  figure(fig);
  [clusters,prototypes] = k_means(data,k,true);
  fig = fig + 1;
end
function error = quantization_error(clusters,prototypes)
  k = size(prototypes,1);
  error = 0;
  for i = 1:k
   n = size(clusters{i},1);
   for j = 1:n
     error = error + pdist2(clusters{i}(j,:),prototypes(i,:),'squaredeuclidean');
   end
  end
  error = 0.5*error;
end
function Xprot = attach_data_to_prototypes(X,prototype,lambda)
  P = length(X);
  Xprot = zeros([P,1]);
  for i = 1:P
    example = X(i,:);
    dist = rdist2(example(1:2),prototype(:,1:2),lambda);
    [~,wstar] = min(dist);
    Xprot(i) = wstar;
  end
end
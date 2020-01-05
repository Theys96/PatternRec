% LVQ (based on Q3 = 4,6,3,8,2,5)
function [E,prototype,Xprot] = LVQ(X,prototype,eta,plateau_epochs,max_epochs,post_training)
  E = [];
  epoch = 0;
  P = length(X);
  Xprot = zeros([P,1]);
  while 1
    epoch = epoch + 1;
    for i = 1:P
        example = X(i, :);
        dist = pdist2(example(1:2), prototype(:,1:2), 'squaredeuclidean');
        [~,wstar] = min(dist);
        prototype(wstar,1:2) = prototype(wstar,1:2) + eta * Psi(prototype(wstar,3), example(3)) * (example(1:2) - prototype(wstar,1:2));
    end
    curr_E = trainingError(X,prototype);
    E = [E curr_E];
    if epoch > plateau_epochs
      if numel(unique(E(epoch-plateau_epochs:epoch))) == 1 || ...
         numel(unique(E(epoch-plateau_epochs:epoch))) == 2
        break
      elseif epoch >= max_epochs
        break
      end
    end
  end
  if post_training == true
    for i = 1:P
      example = X(i,:);
      dist = pdist2(example(1:2),prototype(:,1:2),'squaredeuclidean');
      [~,wstar] = min(dist);
      Xprot(i) = wstar;
    end
  end
end
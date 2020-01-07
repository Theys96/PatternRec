% LVQ (based on Q3 = 4,6,3,8,2,5)
function [E,prototype,lambdas] = LVQ(X,prototype,eta,lambda,lambdeta,plateau_epochs,max_epochs)
  if length(X(1,:)) ~= length(lambda) + 1  % Last index is for the data label, which the lambda vector does not have
    error('The lambda vector must be of equal dimensions as the data vectors.');
  end
  lambdas = [];
  E = [];
  epoch = 0;
  P = length(X);
  while epoch < max_epochs
    epoch = epoch + 1;                       % Increment epoch counter
    for i = 1:P                              % Loop over each data point
        example = X(i, :);                   % Select current data point
        dist = rdist2(example, prototype, lambda);   % Euclidean distance using global relevances from the lambda vector
        [~,wstar] = min(dist);               % Find the minimum computed distance
        dir = Psi(prototype(wstar,3), example(3));   % direction of movement
        prototype(wstar,1:2) = prototype(wstar,1:2) + eta * dir * (example(1:2) - prototype(wstar,1:2));   % Update prototype
        lambda = lambda - lambdeta * dir * abs(example(1:2) - prototype(wstar,1:2));                       % Update lambda vector
        lambda(lambda < 0) = 0;              % Threshold lambda >= 0
        lambda = lambda / sum(lambda);       % Normalize to 1
    end
    curr_E = trainingError(X,prototype,lambda);      % Compute the current training error
    lambdas(epoch,:) = lambda;    % Store current lambda vector
    E(epoch)         = curr_E;    % Store current training error
    if epoch > plateau_epochs     % Check for plateau-ing
      if numel(unique(E(epoch-plateau_epochs:epoch))) == 1 || ...
         numel(unique(E(epoch-plateau_epochs:epoch))) == 2
        break
      end
    end
  end
end
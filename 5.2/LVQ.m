function [E,prototype]= LVQ(X,prototype,eta,plateau_epochs,max_epochs)
  E = []; %to keep track of classification errors 
  epoch = 0;
  P = length(X);        %number of samples
  
  %loop across epochs
  while 1
    epoch = epoch + 1;
    %Main LVQ algorithm routine; loop across examples
    for i = 1:P     
        example = X(i, :); 
        dist = pdist2(example(1:2), prototype(:,1:2), 'squaredeuclidean');
        [~,wstar] = min(dist);
        prototype(wstar,1:2) = prototype(wstar,1:2) + eta * Psi(prototype(wstar,3), example(3)) * (example(1:2) - prototype(wstar,1:2));
    end
    curr_E = trainingError(X,prototype);
    %attach current epoch classification error to the array
    E = [E curr_E];
    
    %short break-the-loop routine. Training ends as soon as a plateau is detected
    %If the value of the classification error doesn't change (or leaps up
    %and down two values as though in a periodic stationary state) within a
    %certain number *plateau_epochs* of epochs, the error curve is
    %allegedly in a plateau state.
    %Note that periodic sequences of more than two distinct error values may occur.
    if epoch > plateau_epochs
      if numel(unique(E(epoch-plateau_epochs:epoch))) == 1 || ...
         numel(unique(E(epoch-plateau_epochs:epoch))) == 2
        break
      %if the training is taking too long to match the previous
      %requirements, interrupt it
      elseif epoch >= max_epochs
        break
      end
    end
  end
end
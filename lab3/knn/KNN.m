function class = KNN(input, K, data, labels)
%KNN Perform KNN procedure to estimate class of 'input' based on K samples
%from data and its labels
    if (K >= length(data))
        error("K cannot be larger or equal to the number of data points, %d >= %d!", K, length(data));
    end
    
    % Compute all distances
    dists = zeros(length(data),1);
    for i = 1:length(data)
        a = input-data(i,:);
        dists(i,:) = sqrt(dot(a,a));
    end
    
    [~,idx] = sort(dists(:,1));  % Nearest candidates
    labels = labels(idx);        % Sorted
    class = mode(labels(1:K));   % Most frequent class
end


function dist_list = rdist2(point, prot_list, lambda)
    % Euclidean distance using global relevances from the lambda vector
    dist_list = zeros(length(prot_list),1);
    for p = 1:length(prot_list)          % Loop over each prototype, compute the weighted euclidean distance
        dist_list(p) = (lambda .* (point(1:2) - prot_list(p,1:2))) * (point(1:2) - prot_list(p,1:2))';
    end
end


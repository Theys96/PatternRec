function err = trainingError(X,P,lambda)
    misclass = 0;
    for i = 1:length(X)
        dist = rdist2(X(i,1:2), P(:,1:2), lambda);
        [~,np] = min(dist);
        if P(np,3) ~= X(i,3)
            misclass = misclass + 1;
        end
    end
    err = misclass / length(X);
end


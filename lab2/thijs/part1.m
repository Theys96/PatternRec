function void = part1();

format long
features = [4 5 6 ; 6 3 9 ; 8 7 3 ; 7 4 8 ; 4 6 5];
disp(features);

Q1 = mean(features(:,1))
Q2 = mean(features(:,2))
Q3 = mean(features(:,3))
% Q4_12 = cov(features, 0)  % Unbiased
Q4_12 = cov(features, 1)    % Biased

mu = [Q1 Q2 Q3]';

Q14 = p([5 5 6]', mu, Q4_12)
Q15 = p([3 5 7]', mu, Q4_12)
Q16 = p([4 6.5 1]', mu, Q4_12)

end
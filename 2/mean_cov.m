A = [4 6 8 7 4; 5 3 7 4 6; 6 9 3 8 5]'
mu = mean(A,1)
sigma = cov(A,1)
vec1 = [5 5 6];
vec2 = [3 5 7];
vec3 = [4 6.5 1];
mvnpdf(vec1,mu,sigma)
mvnpdf(vec2,mu,sigma)
mvnpdf(vec3,mu,sigma)
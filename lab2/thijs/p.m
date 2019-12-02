function prob = p(x, mu, covmat)
%P Compute the probability density of a given vertically oriented 
%vector x in a normal distribution with a given mean mu and covariance 
%matrix
    sz = size(x);
    d = sz(1);
    
    prob = exp(-0.5 * (x-mu)' * (covmat\(x-mu))) / sqrt((2*pi)^d * det(covmat));
end


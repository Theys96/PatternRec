function prob = pd(data, x, h)
%P Compute the Parzen-based estimate of p(x|data)

    dim = size(data);
    V = h^dim(2);
    sum = 0;
    for i = 1:dim(1)
        sum = sum + phi(x, data(i,:), h) / V;
    end
    prob = sum / dim(1);

end


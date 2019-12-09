function val = phi(x,y,h)
    dim = size(x);
    sum = 0;
    for i = 1:dim(2)
        sum = sum + (x(i)-y(i))^2;
    end
    val = exp(- sum / (2*h^2));
end


function prob = p(x,data1,data2,data3,p1,p2,p3,h)
%P Compute the posterior probability p(1 | x) for data sets 1, 2 and 3
pd1 = pd(data1,x,h)*p1;
pd2 = pd(data2,x,h)*p2;
pd3 = pd(data3,x,h)*p3;
prob = pd1 / (pd1 + pd2 + pd3);
end


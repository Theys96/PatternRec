function S = setS
S = [];
for rep = 1:10000
    rdm = randi([1,20]);
    filename = sprintf('person%02d.mat',rdm);
    iris = load(filename);
    iris = iris.iriscode;
    f1 = randi([1,size(iris,1)]);
    f2 = f1;
    while (f2 == f1)
        f2 = randi([1,size(iris,1)]);
    end
    hamming = HD(iris(f1,:),iris(f2,:));
    S = [S hamming];
end
hist(S)
end
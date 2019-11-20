function [Smean,Svar] = SetS(bins) %input is number of bins in histogram
S = [];
for rep = 1:10000
    rdm = randi([1,20]); %draw random person
    filename = sprintf('person%02d.mat',rdm);
    iris = load(filename);
    iris = iris.iriscode; %get iris code table 
    f1 = randi([1,size(iris,1)]); %draw a row from the table
    f2 = f1;
    while (f2 == f1)
        f2 = randi([1,size(iris,1)]); %draw another (different) row from the table
    end
    hamming = HD(iris(f1,:),iris(f2,:)); %call HD.m to compute hamming distance
    S = [S hamming];
end
Smean = mean(S);
Svar = var(S);
h = histogram(S,bins,'FaceColor','b');
Sheight = max(h.Values); %get the highest count in a bin
xlabel('HD')
ylabel('count')
legend;
hold on
x = [min(S):0.01:max(S)] %create even spaced interval
NormS = normpdf(x,Smean,sqrt(Svar)); %draw gaussian with same parameters as D set
NormS = (NormS/max(NormS))*Sheight;  %rescale the latter
plot(x,NormS,'b','LineWidth',3);
hold on
end
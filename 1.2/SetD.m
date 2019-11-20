function [Dmean,Dvar] = SetD(bins) %input is number of bins in histogram
D = [];
for rep = 1:10000
   p1 = randi([1,20]); %draw person 1
   p2 = p1;
   while (p2 == p1)
       p2 = randi([1,20]); %draw person 1 (!= person 2)
   end
   filename1 = sprintf('person%02d.mat',p1);
   filename2 = sprintf('person%02d.mat',p2);
   iris1 = load(filename1);
   iris2 = load(filename2);
   iris1 = iris1.iriscode; %get the actual table from the struct
   iris2 = iris2.iriscode;
  f1 = randi([1,size(iris1,1)]); %draw row 
  f2 = randi([1,size(iris1,1)]); %draw another row. Do f1 and f2 need to be the same row, different rows or it doesn't matter?
  hamming = HD(iris1(f1,:),iris2(f2,:)); %call HD.m to compute hamming distance
  D = [D hamming];
end
Dmean = mean(D);
Dvar = var(D);
h = histogram(D,bins,'FaceColor','r');
Dheight = max(h.Values); %get the highest count in a bin
xlabel('HD')
ylabel('count')
legend;
hold on
x = [min(D):0.01:max(D)] %create even spaced interval
NormD = normpdf(x,Dmean,sqrt(Dvar)); %draw gaussian with same parameters as D set
NormD = (NormD/max(NormD))*Dheight;  %rescale the latter
plot(x,NormD,'r','LineWidth',3);
end
function [Dmean,Dvar] = SetD(bins)
D = [];
for rep = 1:10000
   p1 = randi([1,20]);
   p2 = p1;
   while (p2 == p1)
       p2 = randi([1,20]);
   end
   filename1 = sprintf('person%02d.mat',p1);
   filename2 = sprintf('person%02d.mat',p2);
   iris1 = load(filename1);
   iris2 = load(filename2);
   iris1 = iris1.iriscode;
   iris2 = iris2.iriscode;
  f1 = randi([1,size(iris1,1)]);
  f2 = randi([1,size(iris1,1)]);
  hamming = HD(iris1(f1,:),iris2(f2,:));
  D = [D hamming];
end
Dmean = mean(D);
Dvar = var(D);
h = histogram(D,bins,'FaceColor','r');
Dheight = max(h.Values);
xlabel('HD')
ylabel('count')
legend;
hold on
x = [min(D):0.01:max(D)]
NormD = normpdf(x,Dmean,sqrt(Dvar));
NormD = (NormD/max(NormD))*Dheight;
plot(x,NormD,'r','LineWidth',3);
end
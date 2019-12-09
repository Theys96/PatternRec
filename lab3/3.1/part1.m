m1 = 5;
m2 = 7;
var = 4;  %equal for both distributions
sigma = sqrt(var);
dc = 10; %decision criterion
%{
x = [-5:0.1:15];
plot(x,normpdf(x,m1,sigma))
hold on
plot(x,normpdf(x,m2,sigma))
ax = gca;
plot([dc dc],[0 ax.YLim(2)], 'color', 'black')
grid on
hold off
%}
hit = 1 - cdf('Normal',dc,m2,sigma)
fa = 1 - cdf('Normal',dc,m1,sigma)
discriminability = abs(m2-m1)/sigma
m2 = 9;
discriminability = abs(m2-m1)/sigma
d = 3;
m2 = m1 + sigma*d
test = load('lab3_1.mat');
test = test.outcomes;
tot = size(test,1);
hit = sum(test(:,1) == 1 & test(:,2) == 1)/tot
fa = sum(test(:,1) == 0 & test(:,2) == 1)/tot
%question 9
plot(fa, hit, 'x','color','red','MarkerSize',10,'DisplayName','observed point')
hold on
xlim([0 1])
ylim([0 1])
grid on
m1 = 2;
sigma = 2;
thres = 5e-4; %tolerancy for finding the intersection
for d = [1.2:1e-4:1.7]
  m2 = m1 + sigma*d;
  dc = [-10:0.2:10];
  TP = 1 - cdf('Normal',dc,m2,sigma);
  FP = 1 - cdf('Normal',dc,m1,sigma);
  if (any(sqrt((TP-hit).^2+(FP-fa).^2) <= thres))
    d
    break
  end
end
d
plot(FP,TP,'color','blue','DisplayName',sprintf('d = %g',d));
xlabel('false positive rate','FontSize',14);
ylabel('true positive rate','FontSize',14);
title('ROC by T&E','FontSize',16);
leg = legend;
leg.FontSize = 12;
grid on


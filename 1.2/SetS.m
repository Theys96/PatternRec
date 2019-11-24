function [Smean,Svar] = SetS(codes,iterations,fitpdf)
S = [];
for rep = 1:iterations
    rdm = randi([1,20]);                            %draw random person
    iris = codes(:,:,rdm);                          %get iris code table 
    f1 = randi([1,size(iris,1)]);                   %draw a row from the table
    f2 = f1;
    while (f2 == f1)
        f2 = randi([1,size(iris,1)]);               %draw another (different) row from the table
    end
    hamming = HD(iris(f1,:),iris(f2,:));            %compute hamming distance
    S = [S hamming];
end
Smean = mean(S);
Svar = var(S);

%Histogram
xlabel('HD','FontSize',14);
ylabel('Count','FontSize',14);
h = histogram(S,[(1/60):(1/30):1],'FaceColor','b');
lgd = legend;
lgd.FontSize = 12;
grid on
hold on

if fitpdf %Gaussian fit of histogram
    x = [min(S):0.01:max(S)]               %create even spaced interval
    NormS = normpdf(x,Smean,sqrt(Svar));   %draw gaussian with same parameters as S set
    NormS = NormS*iterations/h.NumBins;  %rescale the latter
    plot(x,NormS,'b','LineWidth',3,'DisplayName','S pdf');
    hold on
end
end
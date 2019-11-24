function ccvec = CC(data);
fname = ["height(cm)",  "age(years)", "weight(kg)"];
ccvec = corrcoef(data);   %built in to get matrix of correlation coeffients
antieye = ~eye(size(ccvec));
nondiag = ccvec.*antieye;  %get rid of the ones in the diagonal
nondiag = reshape(nondiag,[size(ccvec,1)^2,1]);
nondiag = unique(nondiag); %1D vector containing ccs without repetition
highest2 = maxk(nondiag,2,'ComparisonMethod','abs');  %get the two highest values
styles = ["or","sg"];
rank = ["1st","2nd"];
for i = 1:2
    [row,col] = find(ccvec == highest2(i),1) %find them in the original cc matrix
    figure(i)
    plot(data(:,col),data(:,row),styles(i),'MarkerSize',10)   %plot the correspondent features
    title(sprintf(rank(i) + ' most correlated pair'),'FontSize',16)
    xlabel(fname(col),'FontSize',14)
    ylabel(fname(row),'FontSize',14)
    grid on
end
end
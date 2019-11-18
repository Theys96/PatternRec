function ccvec = CC(data);
fname = ["height(cm)",  "age(years)", "weight(kg)"];
ccvec = corrcoef(data);   %built in to get matrix of correlation coeffients
antieye = ~eye(size(ccvec));
nondiag = ccvec.*antieye;  %get rid of the ones in the diagonal
nondiag = reshape(nondiag,[size(ccvec,1)^2,1]);
nondiag = unique(nondiag); %1D vector containing ccs without repetition
highest2 = maxk(abs(nondiag),2);              %get the two highest values
for i = 1:2
    [row,col] = find(ccvec == highest2(i),1) %find them in the original cc matrix
    figure(i)
    plot(data(:,col),data(:,row),'or')   %plot the correspondent features 
    xlabel(fname(col))
    ylabel(fname(row))
    grid on
end
end
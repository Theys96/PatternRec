function void = LOOCV(data,class_labels);
  %LOOCV (leave one out cross validation)
  err_vec = [];
  for K = 1:20
    misclassified = 0;
    for i = 1:length(data)
      train = [data(1:i-1,:); data(i+1:length(data),:)];
      label_train = [class_labels(1:i-1) class_labels(i+1:length(data))];
      test = data(i,:);
      result = KNN(test,K,train,label_train);
      if (result ~= class_labels(i))
        misclassified = misclassified +1;
      end
    end
    err_rate = misclassified/length(data);
    if (K == 3 || K == 17)
      fprintf('accuracy for K = %g: %f \n',K,err_rate)
    end
    err_vec = [err_vec err_rate];
  end
  plot([1:20],err_vec,'LineWidth',3,'color','red')
  grid on
  xlabel('K','FontSize',14);
  ylabel('error rate','FontSize',14);
  title('LOOCV KNN accuracy','FontSize',14);
  opt = find(err_vec == min(err_vec));
  fprintf('optimal value of K is %g with an error rate of %f \n',opt,err_vec(opt))
end
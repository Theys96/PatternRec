function barplot(training_errors,avtest_error)
  bar(training_errors,'DisplayName','training errors');
  hold on
  yline(avtest_error,'color','r','LineWidth',3,'DisplayName',sprintf('average test error = %g%%',avtest_error*100));
  xlabel('classification errors (%)','FontSize',14);
  xticklabels(training_errors*100);
  yticks([]);
  title({'LVQ1 classification error ' '10-fold cross validation'},'FontSize',13);
  lgd = legend;
  lgd.FontSize = 12;
end
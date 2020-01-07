function barplot(training_errors,avtest_error)
  b = bar(training_errors,'DisplayName','Training errors (per fold)');
  hold on
  yline(avtest_error,'color','r','LineWidth',3,'DisplayName',sprintf('Average test error = %.2f%%',avtest_error*100));
  xlabel('Folds','FontSize',14);
  ylabel('Test error (%)','FontSize',14);
  folds = 1:length(training_errors);
  xticklabels(folds);
  ylim([0 1.25*max(training_errors)]);
  title({'LVQ1 classification error ' '10-fold cross validation'},'FontSize',13);
  text(b.XEndPoints(folds),b.YEndPoints(folds),num2str((training_errors*100)', '%.2f%%'),'HorizontalAlignment','center','VerticalAlignment','bottom')
  lgd = legend;
  lgd.FontSize = 12;
end

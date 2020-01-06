function barplot(errors)
  mean_err = mean(errors)
  bar(errors(1:end-1),'DisplayName','training errors');
  hold on
  yline(errors(end),'color','r','LineWidth',3,'DisplayName',sprintf('test error = %g%%',errors(end)*100));
  yline(mean_err,'color','black','LineWidth',3,'DisplayName',sprintf('average error = %g%%',mean_err*100));
  xlabel('classification errors (%)','FontSize',14);
  xticklabels(errors(1:end-1)*100);
  yticks([]);
  title({'LVQ1 classification error ' '10-fold cross validation'},'FontSize',13);
  lgd = legend;
  lgd.FontSize = 12;
end
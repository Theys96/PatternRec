function plot_lambda_vals(lambdas,lambdeta,titleon)
  for i = 1:length(lambdas(1,:))
    plot(1:length(lambdas), lambdas(:,i),'LineWidth',3,'DisplayName',sprintf('Feature %g', i));
    hold on
  end
  ylim([0 1]);
  xlabel('Epoch','FontSize',13); 
  ylabel('Global feature relevance','FontSize',13);
  if titleon == true
    title({'Global feature relevances' sprintf('\\eta_{\\lambda} = %.4f',lambdeta)},'FontSize',12);
  end
  lgd = legend;
  lgd.FontSize = 12;
  grid on
  hold off
end
function plot_error_curve(E,nProt,eta,titleon)
  plot(1:length(E), E,'LineWidth',3,'DisplayName',sprintf('prototypes: %g - %g',nProt(1),nProt(2)));
  ylim([E(end)-0.2 E(1)+0.2]);
  xlabel('Epoch','FontSize',13); 
  ylabel('Classification error (training)','FontSize',13);
  if titleon == true
    title({'LVQ training error curve' sprintf('\\eta = %.2f',eta)},'FontSize',12);
  end
  lgd = legend;
  lgd.FontSize = 12;
  grid on
end
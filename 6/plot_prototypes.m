function plot_prototypes(prototypes,old_prototypes,startend)
  k = size(prototypes,1);
  colors = colors_shapes(k);
  for i = 1:k
    if exist('startend','var')
      if startend == "start"
        shape = 's';
      elseif startend == "end"
        shape = 'o';
      end
      scatter(prototypes(i,1),prototypes(i,2),180,colors(i,:),shape,'filled','DisplayName',sprintf('Prototype %g %s',i,startend))
      hold on
      %viscircles([prototypes(i,1) prototypes(i,2)],0.05,'color','k');
    else
      s = scatter(prototypes(i,1),prototypes(i,2),180,colors(i,:),'p','filled');
      set(get(get(s,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
      hold on
    end
    if any(old_prototypes)
      plot_arrow(old_prototypes(i,1),old_prototypes(i,2),prototypes(i,1),prototypes(i,2));
      hold on
    end
  end
  xlabel('feature 1','FontSize',13);
  ylabel('feature 2','FontSize',13);
  title({'Prototypes moving in feature space' sprintf('k = %g',k)},'FontSize',13);
  lgd = legend;
  lgd.FontSize = 12;
end
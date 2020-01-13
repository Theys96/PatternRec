function scatter_cp(clusters,prototypes)
  k = size(prototypes,1);
  [colors,shapes] = colors_shapes(k);
  for i = 1:k
    scatter(clusters{i}(:,1),clusters{i}(:,2),50,colors(i,:),shapes(i));
    hold on
    scatter(prototypes(i,1),prototypes(i,2),230,'MarkerEdgeColor',[1 1 0],'MarkerFaceColor',colors(i,:),'LineWidth',1.5);
  end
  xlabel('feature 1','FontSize',13);
  ylabel('feature 2','FontSize',13);
  title({'Clustered feature space' sprintf('k = %g',k)},'FontSize',13);
end
function plotData(X,prototype,Xprot,titl)
  if exist('prototype','var')
    scatter(prototype(prototype(:,3) == 1,1), prototype(prototype(:,3) == 1,2),75,'r','filled','DisplayName','Prototypes A');
    hold on
    scatter(prototype(prototype(:,3) == 2,1), prototype(prototype(:,3) == 2,2),75,'b','filled','DisplayName','Prototypes B');
    P = length(X);
    for i = 1:P
      X(i,3) = prototype(Xprot(i),3);
    end
  end
  scatter(X(X(:,3) == 1,1), X(X(:,3) == 1,2),'r','DisplayName','Class A points');
  hold on
  scatter(X(X(:,3) == 2,1), X(X(:,3) == 2,2),'b','DisplayName','Class B points');
  xlabel('Feature 1','FontSize',14);
  ylabel('Feature 2','FontSize',14);
  if exist('prototype','var') == 0
    title('Data points','FontSize',12)
  end
  lgd = legend;
  lgd.FontSize = 12;
  if exist('titl','var')
    ax = gca;
    ax.Title.String = titl;
  end
  hold off;
end

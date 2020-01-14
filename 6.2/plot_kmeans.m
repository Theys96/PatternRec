data = load('checkerboard.mat').checkerboard;

[clusters, prototypes, epochs] = k_means(data, 100, false, false, true);

figure(1)
plot(data(:,1),data(:,2),'bo','markersize',3)
hold on
plot(prototypes(:,1),prototypes(:,2),'r.','markersize',10,'linewidth',3)
title(sprintf('{\\it k}-means after %d epochs', epochs))
voronoi(prototypes(:,1),prototypes(:,2))
hold off
studentNr = 's2922924';

c = imread('cameraman.tif');
edges = edge(c,'canny');
hc = hough(edges);

figure(1);
imagesc(hc);
xlabel('\theta','FontSize',14);
ylabel('\rho','FontSize',14);
title(studentNr,'FontSize',12);

hcTh = hc;
hcTh(hcTh < 0.999*max(hc(:))) = 0;

%{
figure(2)
imagesc(hcTh);
xlabel('\theta','FontSize',14);
ylabel('\rho','FontSize',14);
title(studentNr,'FontSize',12);
%}

figure(3)
imagesc(hc);
hold on
npeaks = 5;
peaks = houghpeaks(hc,npeaks)
plot(peaks(:,2),peaks(:,1),'x','color','r','MarkerSize',10);
xlabel('\theta','FontSize',14);
ylabel('\rho','FontSize',14);
title('Unthresholded with marked peaks','FontSize',12);

figure(4)
imagesc(c);
hold on
myhoughline(c,peaks(1,1),peaks(1,2));
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
title(studentNr,'FontSize',12);
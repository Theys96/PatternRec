I = rgb2gray(imread('chess.jpg'));
diag = floor(sqrt(size(I,1)^2 + size(I,2)^2))
rhomax = diag-1;
BW = edge(I,'canny');
[H,T,R] = hough(BW);

figure(1)
imagesc('XData',T,'YData',R,'CData',H);
xlabel('\theta','FontSize',14);
ylabel('\rho','FontSize',14);
hold on
npeaks = 15;
thres = ceil(0.3*max(H(:)));
P = houghpeaks(H,npeaks,'threshold',thres)
x = T(P(:,2));
y = R(P(:,1));
plot(x,y,'s','color','white');
xlim([-90,90]);
ylim([-diag,diag]);
title(sprintf('Acc. array with %g strongest points',npeaks),'FontSize',13);
hold off

figure(2)
imagesc(I)
hold on
for i = 1:15
  rho = P(i,1) - rhomax - 1;
  theta = P(i,2) - 91;
  myhoughline(I,rho,theta);
  hold on
end
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
title('15 strongest lines overlay','FontSize',12);
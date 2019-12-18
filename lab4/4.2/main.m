function main
  c = imread('cameraman.tif');
  edges = edge(c,'canny');
  hc = hough(edges);
  myhc = myhough(edges);
  
  subplot(1,2,1);
  imagesc(hc)
  xlabel('\theta','FontSize',14);
  ylabel('\rho','FontSize',14);
  title('built-in Hough Transform','FontSize',12);
  subplot(1,2,2);
  
  imagesc(myhc)
  xlabel('\theta','FontSize',14);
  ylabel('\rho','FontSize',14);
  title('my Hough Transform','FontSize',12);
  
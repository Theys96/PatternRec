mu = [3 4];
sigma = [1 0; 0 2];
x = [-10:0.02:10];
y = x;
[X Y] = meshgrid(x,y);
normfit = zeros(size(X,1),size(X,1));
for i = 1:size(X,1)
    normfit(:,i) = mvnpdf([X(:,i) Y(:,i)],mu,sigma);
end
mesh(x,y,normfit);
xlabel('dim 1','FontSize',13)
ylabel('dim 2','FontSize',13)
zlabel('PDF','FontSize',13)
title('$\mathcal{N}(\mu,\Sigma)$','Interpreter','latex','FontSize',15)
obs = [10 10; 0 0; 3 4; 6 8];
format long
MD = diag(sqrt((obs-mu)*inv(sigma)*(obs-mu)'))
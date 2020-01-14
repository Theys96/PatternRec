data = load('kmeans1.mat').kmeans1;
npatterns = size(data,1);
dim = size(data,2);

%Q4 - D(k) & Q5 - J(k),R(k)
kmax = 30;
kvec = 1:kmax;
nrep = 10;
Jvec = zeros([1,kmax]);
Rvec = zeros([1,kmax]);
Dvec = zeros([1,kmax]);

for k = kvec
  fprintf('k_meaning k = %g ... \n',k);
  for rep = 1:nrep %repeat nrep times for each value of k to average out random fluctuations
    J = 0;
    [clusters,prototypes] = k_means(data,k,false,false);
    J = J + quantization_error(clusters,prototypes);
  end
  J = J/nrep;
  if k == 1
    J1 = J;
  end
  R = J1*(k^(-2/dim));
  Jvec(k) = J;
  Rvec(k) = R;
  Dvec(k) = R/J;
end
kopt = kvec(Dvec == max(Dvec));

figure(1)
plot(kvec,Dvec,'color','b','LineWidth',3)
hold on
plot(kopt,max(Dvec),'color','r','Marker','p','MarkerSize',20,'LineStyle','none','DisplayName',sprintf('k_{opt} = %g \n D(k_{opt}) = %.2f',kopt,max(Dvec)));
xlabel('k','FontSize',14);
ylabel('D(k)','FontSize',14);
title({'D(k) curve' sprintf('%g reps for each k',nrep)},'FontSize',13);
lgd = legend;
lgd.FontSize = 13;
grid on

figure(2)
plot(kvec,Jvec,'color',[0.4660 0.6740 0.1880],'LineWidth',3,'DisplayName','J(k)');
hold on
plot(kvec,Rvec,'color','k','LineWidth',3,'DisplayName','R(k)');
plot(kopt,Jvec(kopt),'color','r','Marker','p','MarkerSize',20,'LineStyle','none','DisplayName',sprintf('k_{opt} = %g \n J(k_{opt}) = %.2f \n R(k_{opt}) = %.2f',kopt,Jvec(kopt),Rvec(kopt)));
xlabel('k','FontSize',14);
ylabel('error','FontSize',14);
title({'J(k) & R(k) curves' sprintf('%g reps for each k',nrep)},'FontSize',13); 
lgd = legend;
lgd.FontSize = 13;
grid on
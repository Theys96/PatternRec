data = load('checkerboard.mat').checkerboard;

%Q9:Q13
k = 100;
nruns = 20;
nseries = 10;
J = zeros([1,nseries]);
Jpp = zeros([1,nseries]);

for i = 1:2
  if i == 1
    plusplus = false;
    init = 'k_means';
  elseif i == 2
    plusplus = true;
    init = 'k_means++';
  end
  for series = 1:nseries
    Jvec = zeros([1,nruns]);
    for run = 1:nruns
      fprintf('series %g, run %g \n',series,run);
      [clusters,prototypes] = k_means(data,k,false,plusplus);
      Jvec(run) = quantization_error(clusters,prototypes);
    end
    if i == 1
      J(series) = min(Jvec);
    elseif i == 2
      Jpp(series) = min(Jvec);
    end
  end
end

fprintf('mean J(100): %.3f \n',mean(J));
fprintf('mean J(100) (++ init.): %.3f \n',mean(Jpp));
fprintf('std J(100): %.3f \n',std(J));
fprintf('std J(100) (++ init.): %.3f \n',std(Jpp));

format long
[~,pi,~,~] = ttest2(J,Jpp,'Vartype','unequal')

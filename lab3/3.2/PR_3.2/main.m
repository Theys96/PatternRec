function void = main

i = 1;

%question 3
for K = [1 3 5 7]
  figure(i);
  knn_wrapper(2,K);
  i = i+1;
end

%qq 4-8
Kmax = 20;
figure(i);
LOOCV(2,Kmax);
i = i+1;

%question 9
for K = [1 3 5 7]
  figure(i)
  knn_wrapper(4,K);
  i = i+1;
end

%qq 10-11
figure(i);
LOOCV(4,Kmax);
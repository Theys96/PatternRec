cat1 = load('lab3_3_cat1.mat').x_w1;
cat2 = load('lab3_3_cat2.mat').x_w2;
cat3 = load('lab3_3_cat3.mat').x_w3;

u = [0.5 1.0 0.0]
v = [0.31 1.51 -0.50]
w = [-1.7 -1.7 -1.7]

h = 1

Q1 = pd(cat1, u, h)
Q2 = pd(cat2, u, h)
Q3 = pd(cat3, u, h)
Q4 = pd(cat1, v, h)
Q5 = pd(cat2, v, h)
Q6 = pd(cat3, v, h)
Q7 = pd(cat1, w, h)
Q8 = pd(cat2, w, h)
Q9 = pd(cat3, w, h)

num = size(cat1, 1) + size(cat2, 1) + size(cat3, 1);
P1 = size(cat1, 1)/num
P2 = size(cat2, 1)/num
P3 = size(cat3, 1)/num

Q13 = p(u, cat1, cat2, cat3, P1, P2, P3, h)
Q14 = p(u, cat2, cat1, cat3, P2, P1, P3, h)
Q15 = p(u, cat3, cat2, cat1, P3, P2, P1, h)
Q16 = p(v, cat1, cat2, cat3, P1, P2, P3, h)
Q17 = p(v, cat2, cat1, cat3, P2, P1, P3, h)
Q18 = p(v, cat3, cat2, cat1, P3, P2, P1, h)
Q19 = p(w, cat1, cat2, cat3, P1, P2, P3, h)
Q20 = p(w, cat2, cat1, cat3, P2, P1, P3, h)
Q21 = p(w, cat3, cat2, cat1, P3, P2, P1, h)

Q22 = [
    1 p(u, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(u, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(u, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q22);
disp(Q22(i(2)));

Q23 = [
    1 p(v, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(v, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(v, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q23); disp(Q23(i(2)));

Q24 = [
    1 p(w, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(w, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(w, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q24); disp(Q24(i(2)));

h = 2;

Q25 = [
    1 p(u, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(u, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(u, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q25); disp(Q25(i(2)));

Q26 = [
    1 p(v, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(v, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(v, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q26); disp(Q26(i(2)));

Q27 = [
    1 p(w, cat1, cat2, cat3, P1, P2, P3, h) ;
    2 p(w, cat2, cat1, cat3, P2, P1, P3, h) ;
    3 p(w, cat3, cat2, cat1, P3, P2, P1, h) ;
]
[m,i] = max(Q27); disp(Q27(i(2)));


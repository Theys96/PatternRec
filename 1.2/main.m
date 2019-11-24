function void = main
codes = load_iriscodes(20,'person%02d.mat');
[Smean,Svar] = SetS(codes,10000,true)
[Dmean,Dvar] = SetD(codes,10000,true)
DoF = (Dmean*(1-Dmean))/Dvar %effective degrees of freedom
title('HDs for iris codes from same (S) and different (D) individuals','FontSize',15);
end
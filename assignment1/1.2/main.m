function void = main
codes = load_iriscodes(20,'person%02d.mat');
[Smean,Svar] = SetS(codes,10000,true)
[Dmean,Dvar] = SetD(codes,10000,true)
DoF = (Dmean*(1-Dmean))/Dvar %effective degrees of freedom
title('HDs for iris codes from same (S) and different (D) individuals','FontSize',15);
dc = find_dc(Dmean,Dvar,0.0005)
frr = 1-normcdf(dc,Smean,sqrt(Svar)) %false rejection rate
testcode = load('testperson2.mat');
testcode = testcode.iriscode;
testcode(testcode==2) = 0;
testcode
test_person = whosecode(codes,testcode)
end
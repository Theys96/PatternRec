function void = main;
[Smean,Svar] = SetS(7)
[Dmean,Dvar] = SetD(7)
DoF = (Dmean*(1-Dmean))/Dvar
end
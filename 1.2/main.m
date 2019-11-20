function void = main(bins) 
[Smean,Svar] = SetS(bins)
[Dmean,Dvar] = SetD(bins) %Dvar looks too big!
DoF = (Dmean*(1-Dmean))/Dvar %effective degrees of freedom
end
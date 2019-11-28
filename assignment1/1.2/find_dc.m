function [dc,actual_err] = find_dc(mean,var,err) %input PDF parameters and desired false acceptance rate
%naive bracketing: find initial guess interval for root finder
cp = 0;
x = [0:0.01:1];
i = 0;
while cp < err    
    i = i+1;
    cp = normcdf(x(i),mean,sqrt(var));
%Now we know correspondent HD value is somewhere in [x(i-1),x(i)]
end
f = @(z)(normcdf(z,mean,sqrt(var))-err);  %define f in RHS = 0 form
dc = bisection(f,x(i-1),x(i),1e-10);       %call root finder with arbitrary treshold
actual_err = normcdf(dc,mean,sqrt(var));
end

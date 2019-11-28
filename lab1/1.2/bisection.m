function p = bisection(f,a,b,thres) %f is written in RHS = 0 form
if f(a)*f(b)>0 
    error('No root in (a,b)!')
else
    p = (a + b)/2;
    err = abs(f(p));
    while err > thres
      if f(a)*f(p)<0 %root is in left interval
        b = p;       %right boundary of new interval is center of old interval
      else
        a = p;       %otherwise left boundary of new interval is center of old interval
      end
      p = (a + b)/2; 
      err = abs(f(p));
    end
end
function f = time_interval( x1,x2,v1,v2,a)
global omega;
if x1 > x2
    f = -(v2-v1)/(x1-x2);
else
    f = -100000;
end
if a<-2 || a>2
    f = f+ omega*min(abs(a+2),abs(a-2));
end


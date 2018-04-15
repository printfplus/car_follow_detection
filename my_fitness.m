function [f] = my_fitness( x )

%Wmatrixsize = size(x,2);
vmax = 40;
vmin = 0;
global STEP;
global x1;
global x2;
global v1;
global v2;
x0 = x1;
v0 = v1;
lastx = x2;
lastv = v2;
global dt;
f = x0;
v1t = v0;
x1t = x0;
x2t = lastx;
v2t = lastv;
a2 = pid_follow(x0,lastx,v0,lastv);
f = time_interval(x1t,x2t,v1t,v2t);

for i = 1:STEP
    x1t = x1t + v1t*dt + 0.5*x(i)*dt*dt;
    v1t = v1t + x(i)*dt;
    
    
    if v2t > vmax
        v2t = vmax;
        a2 = 0;
    elseif v2t < vmin
        v2t = vmin;
        a2 = 0;
    end
    
    x2t = x2t + v2t*dt + 0.5*a2*dt*dt;
    v2t = v2t + a2*dt;
    
    a2 = pid_follow(x1t,x2t,v1t,v2t);
    ttc = time_interval(x1t,x2t,v1t,v2t);
    
    f = f+ttc;
    %if f > ttc+10*i
    %    f = ttc+10*i;
    %end

end
%f = f;%+100*max(abs(diff(x)));


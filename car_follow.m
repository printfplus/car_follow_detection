function a = car_follow( x1,x2,v1,v2 )
PAR = 500;
amax = 3;
amin = -3;
a = ((PAR*(v2)^0.6)*(v2-v1)/((abs(x2-x1))^2.4*sign(x2-x1)));
    
if a > amax
    a = amax;
elseif a < amin
    a = amin;
end

%if x1 < x2
%    a = 0;
%end
end


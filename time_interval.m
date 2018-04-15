function f = time_interval( x1,x2,v1,v2)

if x1 > x2
    f = -(v2-v1)/(x1-x2);
    %f = x1-x2;
    %f = (x1-x2)/(v2-v1);
    %if f < -1000
    %    f = -1000;
    %end
%    end
%else
%    f = -65526;
%end
else
    f = -2000;
end

end


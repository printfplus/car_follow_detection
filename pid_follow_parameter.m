function a = pid_follow_parameter(x1,x2,v1,v2,k1,k2)
	maxdis = 30;
	safedis = 10;
	headway = 1.4;
	%K = [1.12,1.70];
    K = [k1,k2];
	amax = 3;
	amin = -3;
	range_error = x1-x2-headway*v2;
	range_rate_error = v1-v2;
	Y = [range_error;range_rate_error];
	a = K*Y;
	if a > amax
		a = amax;
	elseif a < amin
		a = amin;
	end
end
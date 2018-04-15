Nc = 20;
T = 1;
X1 = 200;
V1 = 25;
X2 = 0;
V2 = 10;
U = 3;
vmin = 0;
vmax = 40;
amax = 3;
amin = -3;

cvx_begin

    variable x1(1,Nc)
    variable v1(1,Nc)
    variable u1(1,Nc)
    variable x2(1,Nc)
    variable v2(1,Nc)
    variable u2(1,Nc)
    
    e = 65536;
    for m = 1:Nc
        e = e + x1(m)-x2(m);
            
    end
    
    e = e + 20*sum(abs(u1));
    minimize(e)
    
    subject to
    
        x1(1) == X1;
        v1(1) == V1;
        x2(1) == X2;
        v2(1) == V2;
        u1(1) >= -U;
        u1(1) <= U;
        u2(1) <= U;
        u2(1) >= -U;
        
        for n = 2:Nc
            %x(:,n) == x(:,n-1) + A*x(:,n-1).*T + B.*u(1,n).*T + C.*u(1,n).*T^2;
            x1(n) == x1(n-1) + v1(n-1)*T + 0.5*u1(n-1)*T^2;
            x2(n) == x2(n-1) + v2(n-1)*T + 0.5*u2(n-1)*T^2;
            v1(n) == v1(n-1) + u1(n-1)*T;
            v2(n) == v2(n-1) + u2(n-1)*T;
            %u2(n) == 1.12*(x1(n)-x2(n)-1.4*v2(n))+1.7*(v1(n)-v2(n));
            u2(n) == 0.5*(v1(n)-v2(n))*amax/vmax+0.5*(amin+(x1(n)-x2(n)-20)*2*amax/400);
            %if newa > amax
            %    u2(n) == amax;
            %elseif newa < amin
            %    u2(n) == amin;
            %else
            %    u2(n) == newa;
            %end
            %u2(n) == 0;
            u1(n) <= U;
            u1(n) >= -U;
            u2(n) <= U;
            u2(n) >= -U;
            v1(n) >= vmin;
            v1(n) <= vmax;
            v2(n) >= vmin;
            v2(n) <= vmax;

        end
cvx_end

figure;
%figure('visible','off')
plot(x1,'LineWidth',2);
hold on;
plot(x2,'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Distance','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');

figure;
%figure('visible','off')
plot(v1,'LineWidth',2);
hold on;
plot(v2,'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Velocity','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');

figure;
%figure('visible','off')
plot(u1,'LineWidth',2);
hold on;
plot(u2,'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Acceleration','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');

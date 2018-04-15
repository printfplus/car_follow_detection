function [] = accelerationplot_parameter( x,k1,k2)
x1t = 100;
v1t = 25;
x2t = 0;
v2t = 10;
global dt;
vmax = 40;
vmin = 0;

x1_list = ones(1,size(x,2));
x2_list = ones(1,size(x,2));
v1_list = ones(1,size(x,2));
v2_list = ones(1,size(x,2));
a1_list = x;
a2_list = ones(1,size(x,2));
x_size = size(x,2);
for i = 1:size(x,2)
    x1_list(i) = x1t;
    x2_list(i) = x2t;
    v1_list(i) = v1t;
    v2_list(i) = v2t;
    a2t = pid_follow(x1t,x2t,v1t,v2t,k1,k2);
    a2_list(i) = a2t;
    a1t = a1_list(i);
    
    
    x1t = x1t + v1t*dt + 0.5*a1t*dt*dt;
    v1t = v1t + a1t*dt;
    if v2t > vmax
        v2t = vmax;
        a2 = 0;
    elseif v2t < vmin
        v2t = vmin;
        a2 = 0;
    end
    x2t = x2t + v2t*dt + 0.5*a2t*dt*dt;
    v2t = v2t + a2t*dt;
    
    if x_size == size(x,2)
        if x1t < x2t
            x_size = i;
        end
    end


end

subplot(1,3,1);
%figure;
%figure('visible','off')
plot(x1_list(:,1:x_size),'LineWidth',2);
hold on;
plot(x2_list(:,1:x_size),'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Distance','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');
saveas(gca,'space.jpg');

subplot(1,3,2);
%figure;
%figure('visible','off')
plot(v1_list(:,1:x_size),'LineWidth',2);
hold on;
plot(v2_list(:,1:x_size),'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Velocity','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');
saveas(gca,'velocity.jpg');

subplot(1,3,3);
%figure;
%figure('visible','off')
plot(a1_list(:,1:x_size),'LineWidth',2);
hold on;
plot(a2_list(:,1:x_size),'LineWidth',2);
xlabel('Time','FontSize',15);
ylabel('Acceleration','FontSize',15);
set(gca,'linewidth',2,'FontName','Times New Roman','FontSize',14);
legend('CAR1','CAR2');
saveas(gca,'acceleration.jpg');

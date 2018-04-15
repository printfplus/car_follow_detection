clear;
clc;
STEP = 50;
global dt;
dt = 0.5;
%k1 =  linspace(0,0.01,3);
%k2 =  linspace(0,0.01,3);
range1 = 2;
range2 = 2;
interval = 0.01;
k1_list = 0:interval:range1;
k2_list = 0:interval:range2;
f1 = zeros(length(k1_list),length(k2_list));
f2 = zeros(length(k1_list),length(k2_list));
f3 = zeros(length(k1_list),length(k2_list));

for c1 = 1:length(k1_list)
    for c2 = 1:length(k2_list)
        
        x1 = generate_a_list(STEP,0);%先匀速后减速
        x2 = generate_a_list(STEP,1);%先加速后减速
        x3 = generate_a_list(STEP,2);%全力减速
        f1(c1,c2) = my_fitness(x1,k1_list(c1),k2_list(c2));
        %f2(c1,c2) = my_fitness(x2,k1_list(c1),k2_list(c2));
        f3(c1,c2) = my_fitness(x3,k1_list(c1),k2_list(c2));
    end
end
C = zeros(length(k1_list),length(k2_list));
%CO(:,:,1) = zeros(25); % red
%CO(:,:,2) = ones(25).*linspace(0.5,0.6,25); % green
%CO(:,:,3) = ones(25).*linspace(0,1,25); % blue
%accelerationplot(x,k1,k2);
%f = my_fitness(x1,k1,k2);
%[k1_list,k2_list] = meshgrid(k1_list,k2_list);

figure;
%surf(k1_list,k2_list,f1,'FaceAlpha',0.5)
%imagesc(k1_list,k2_list,f1);
imagesc([0,2],[0,3],f1);
colorbar;
title('先匀速后减速');
%shading interp;
%figure;
%surf(k1_list,k2_list,f2,'FaceAlpha',0.5)
%shading interp;
%hold on;
%surf(k1_list,k2_list,f3,'FaceAlpha',0.5)
figure;
imagesc(k1_list,k2_list,f3);
colorbar;
title('全力减速');
figure;
%[k1_list,k2_list] = meshgrid(k1_list,k2_list);
surf(k1_list,k2_list,f3);
shading interp;


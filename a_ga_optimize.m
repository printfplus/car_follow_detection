clear;
%clc;

global x1;
global x2;
global v1;
global v2;
x1 = 100;
v1 = 25;
x2 = 0;
v2 = 10;

global dt;
dt = 1;
global STEP;
STEP = 20;
global omega;
omega = 10;
amin = -3;
amax = 3;
vmax = 40;
vmin = 0;
nvars = STEP;
v0 = 25;

x0 = ones(1,STEP);
A = tril(ones(STEP,STEP),0);
ObjectiveFunction = @my_fitness;
LB = amin*ones(1,STEP);
UB = amax*ones(1,STEP);
ConstraintFunction = @constraint;
B = (vmax-v0)*ones(STEP,1);
a = dt*tril(ones(STEP,STEP),0);
b = (v0-vmin)*ones(STEP,1);
A = [A;-1*a];
B = [B;b];

handle = @my_fitness;
problem = createOptimProblem('fmincon','x0',x0,'objective',handle,...
    'lb',LB,'ub',UB,'Aineq',A,'bineq', B, 'Aeq',[], 'beq',[],'options',optimset('Algorithm','SQP','Disp','none'));
gs = GlobalSearch;
xgs = run(gs,problem);
accelerationplot(xgs);
accelerationplot(-3*ones(1,STEP));

now_val = my_fitness(xgs);
newf_val = my_fitness(-3*ones(1,STEP));

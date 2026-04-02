clc;
clear;
close all;


% PARAMETERS

params.U0 = 2*pi;
params.L = 1;
params.B = 0;
params.omega = 2*pi;
params.vs = 0.2;
params.alpha = 0.1;

% TASK 1: STREAMLINES
x = linspace(0,1,150);
y = linspace(0,1,150);
[X,Y] = meshgrid(x,y);

[u,v,speed] = flow_field(X,Y,0,params);

figure;
streamslice(X,Y,u,v,2);
axis equal;
xlim([0 1]);
ylim([0 1]);
xlabel('x');
ylabel('y');
title('Task 1: Streamlines for B = 0');
grid on;


% TASK 2: SPEED CONTOUR

figure;
contourf(X,Y,speed,25,'LineColor','none');
hold on;
streamslice(X,Y,u,v,2);
colorbar;
axis equal;
xlim([0 1]);
ylim([0 1]);
xlabel('x');
ylabel('y');
title('Task 2: Velocity magnitude + streamlines');
grid on;


% TASK 3: PARTICLE EVOLUTION
alpha_values = [0.1 0.9 1.0];
times = [0 1 2 3];

good_solver = odeset('RelTol',1e-8,'AbsTol',1e-10);

plot_particle_snapshots(params,alpha_values,times,good_solver);


% TOLERANCE STUDY
plot_tolerance_comparison(params);

% TASK 4: B = 0.12

params.B = 0.12;

plot_particle_snapshots(params,alpha_values,times,good_solver);

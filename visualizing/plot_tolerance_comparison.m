function plot_tolerance_comparison(params)

alpha_values = [0.1 0.9 1.0];
times = [0 1 2 3];

good = odeset('RelTol',1e-8,'AbsTol',1e-10);
bad  = odeset('RelTol',1e-2,'AbsTol',1e-3);

disp('GOOD TOLERANCE');
plot_particle_snapshots(params,alpha_values,times,good);

disp('POOR TOLERANCE');
plot_particle_snapshots(params,alpha_values,times,bad);

end

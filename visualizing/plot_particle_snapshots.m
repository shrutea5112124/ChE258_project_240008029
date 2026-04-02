function plot_particle_snapshots(params, alpha_values, times, solver_options)

n = 20;
xg = linspace(0.05,0.95,n);
yg = linspace(0.05,0.95,n);
[X0,Y0] = meshgrid(xg,yg);
particles = [X0(:), Y0(:)];

figure;
plot_id = 1;

for a = 1:length(alpha_values)

    params.alpha = alpha_values(a);

    for k = 1:length(times)

        subplot(length(alpha_values),length(times),plot_id);
        hold on;

        for p = 1:size(particles,1)

            Yinit = [particles(p,1); particles(p,2); 0];

            % IMPORTANT FIX FOR t = 0
            if times(k) == 0
                xfinal = Yinit(1);
                yfinal = Yinit(2);
            else
                [~,Ysol] = ode45(@(t,Y) particle_ode(t,Y,params), ...
                                 [0 times(k)], Yinit, solver_options);

                xfinal = mod(Ysol(end,1),1);
                yfinal = mod(Ysol(end,2),1);
            end

            plot(xfinal,yfinal,'k.','MarkerSize',5);
        end

        axis equal;
        xlim([0 1]);
        ylim([0 1]);
        grid on;

        if a == 1
            title(['t = ',num2str(times(k))]);
        end

        if k == 1
            ylabel(['\alpha = ',num2str(alpha_values(a))]);
        end

        plot_id = plot_id + 1;
    end
end

end

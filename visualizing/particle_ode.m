function dYdt = particle_ode(t,Y,params)

x = Y(1);
y = Y(2);
theta = Y(3);

[u,v,~,dux,duy,dvx,dvy] = flow_field(x,y,t,params);

vs = params.vs;
alpha = params.alpha;

theta_dot = alpha * ( ...
    0.5*(duy-dvx)*cos(2*theta) ...
    - dux*sin(2*theta) ...
    - 0.5*(dux+dvy) );

x_dot = u + vs*cos(theta);
y_dot = v + vs*sin(theta);

dYdt = [x_dot; y_dot; theta_dot];

end

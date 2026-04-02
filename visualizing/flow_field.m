function [u,v,speed,dux,duy,dvx,dvy] = flow_field(x,y,t,params)

U0 = params.U0;
L = params.L;
B = params.B;
omega = params.omega;

x_shift = B*sin(omega*t);

% Velocity field
u = U0*sin(2*pi*(x-x_shift)/L).*cos(2*pi*y/L);
v = -U0*cos(2*pi*(x-x_shift)/L).*sin(2*pi*y/L);

% Speed magnitude
speed = sqrt(u.^2 + v.^2);

% Velocity gradients
dux = U0*(2*pi/L)*cos(2*pi*(x-x_shift)/L).*cos(2*pi*y/L);
duy = -U0*(2*pi/L)*sin(2*pi*(x-x_shift)/L).*sin(2*pi*y/L);

dvx = U0*(2*pi/L)*sin(2*pi*(x-x_shift)/L).*sin(2*pi*y/L);
dvy = -U0*(2*pi/L)*cos(2*pi*(x-x_shift)/L).*cos(2*pi*y/L);

end 

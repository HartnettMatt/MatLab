function [n,m] = sys_dyn(dt)
% Given a discretization step dt, the function
% sys_dyn(dt) is used to define the discrete-time system:
%
% x_k+1 = f(x_k,u_k)
% 
% where x and u are arrays of size [5x1] and [1x1].
%
% The function should create the MATLAB function
% f(x,u) in the current folder.

%% System Size
    n = 5;
    m = 1;

%% Define symbolic variables
    x = sym('x', [n 1]);
    u = sym('u', [m 1]);
    
%% Define model parameters
    M = 2041;   % [kg]     Vehicle mass
    I = 4964;   % [kg m^2] Vehicle inertia (yaw)
    Lf = 1.56;  % [m]      CG distance, front
    Lr = 1.64;  % [m]      CG distance, back
    mu = 0.8;   % []       Coefficient of friction
    b = 12;     % []       Tire parameter (Pacejka model)
    c = 1.285;  % []       Tire parameter (Pacejka model)
    s = 30;     % [m/s]    Vehicle speed
    g = 9.81;   % [m/s^2]  Gravity acceleration
    
    
%% Compute system dynamics
% Relative tire angles
    af = x(5)-atan((x(2)+Lf*x(4))/s);
    ar = -atan((x(2)+Lr*x(4))/s);
    
% Tire forces
    Ff = mu*g*M*sin(c*atan(b*(af)));
    Fr = mu*g*M*sin(c*atan(b*(ar)));
    
% Dynamic Model (continuos-time)
    fc = [s*sin(x(3))+x(2)*cos(x(3)); -x(1)*x(4)+(Ff*cos(u(1))+Fr)/M; x(4); (Ff*cos(x(5))*Lf-Fr*Lr)/I; u(1)];
    
    
% Forward Euler approximation
    f = x + dt*fc;
    
% Generate A(x, u) and B(x, u)
    A = jacobian(f, x);
    B = jacobian(f, u);
    
    
%% Convert symbolic functions to MATLAB functions
    matlabFunction(f, 'File', 'f', 'Vars', {x,u});
    matlabFunction(A, 'File', 'A', 'Vars', {x,u});
    matlabFunction(B, 'File', 'B', 'Vars', {x,u});
end


% Matt Hartnett ECEN 2310 Midterm
dt = 0.02; % Sampling time
[n,m] = sys_dyn(dt); % Generate system dynamics

N = 150; % Prediction Axis
x0 = [-3.7; 0; 0; 0; 0]; % Initial Conditions

% Used for the control problem
Q = eye(5);
R = 1; 

% SQP Termination parameters
imax = 10;
tol = 0.1;

% Initial guess of all zeroes
z = zeros((n+m)*N, 1);

% SQP
for i = 1:imax
    % Generate and solve the sub-QP problem, and update guess
    [H, h, E, e] = gen_QP(z, Q, R, x0, n, m, N);
    [dz, l] = sol_QP(H, h, E, e);
    z = z + dz;
    
    res = [H*z+E'*l; e ]'*[H*z+E'*l; e ]; % Residual
    if res <= tol
        % System has been solved
        break
    end
end
% Extract x_k and u_k from z
X = reshape(z(1:N*n), n, N);
U = reshape(z(N*n+(1:N*m)), m, N);

t = dt:dt:N*dt; % Time axis

% Graph the various plots
subplot(3, 2, 1)
plot([0 t], [x0(1) X(1,:)])
grid on
ylabel('Position [m]')
xlabel('Time')
title('Lateral Position')

grid on
subplot(3, 2, 2)
plot([0 t],[x0(2) X(2,:)])
grid on
ylabel('Velocity [m/sec]')
xlabel('Time')
title('Lateral Velocity')

subplot(3, 2, 3)
plot([0 t],[x0(3) X(3,:)])
grid on
ylabel('Angle [rad]')
xlabel('Time')
title('Yaw Angle')

subplot(3, 2, 4)
plot([0 t],[x0(4) X(4,:)])
grid on
ylabel('Angular Velocity [rad/sec]')
xlabel('Time')
title('Angular Velocity')

subplot(3, 2, 5)
plot([0 t],[x0(5) X(5,:)])
grid on
ylabel('Steering Angle [rad]')
xlabel('Time')
title('Steering Angle')

subplot(3, 2, 6)
plot(t-dt,U(1,:))
grid on
ylabel('Steering Rate [rad/sec]')
xlabel('Time')
title('Steering Rate')
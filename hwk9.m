% ECEN 2310 HWK9: Matt Hartnett

% Exercise 1:
R = 100;
C = .02;
q0 = 5;
a = 1;
w = 1;

V = @(t) a*sin(w*t);

dq1 = @(t, q) -1/(R*C)*q + V(t);

t1 = 25;
[t,q] = ode45(dq1, [0 t1], q0);
plot(t,q)
grid on
hold on

dq2 = @(q, V) -1/(R*C)*q + V;
[t,q] = ode45(@(t,q) dq2(q, V(t)), [0 t1], q0);
plot(t,q) % Since the curves are the same, the method is valid

dq3 = @(q) -1/(R*C)*q;
[t,q] = ode45(@(t,q) dq3(q), [0 t1], q0);
plot(t,q)

dq = dq4(q, R, C);
[t,q] = ode45(@(t,q) dq(q), [0 t1], q0);
plot(t,q)
legend('dq1', 'dq2', 'dq3', 'dq4')

% Exercise 2:
x0 = [1;1;1];
dx = Lorentz(x, a, b, c);
disp(dx)
figure
for i = 1:5
    delx = ((-10^(-3)):(10^(-3)):(10^(-3)))';
    disp(x0)
   [t, x] = ode45(@(t,x) dx(x,10,28,8/3), [0,50], x0);
   x0 = x0 + delx;
   plot3(x(:,1), x(:,2), x(:,3))
   p = plot3(x(end, 1), x(end, 2), x(end, 3), 'k*')
   p.LineWidth = 2;
   hold on
end


% Exercise 3:
g = 9.81;
m = 30;
L = 2.5;
mu = 7;
th = linspace(-pi, pi, 101);
dth = linspace(-2*sqrt(g/L), 2*sqrt(g/L), 101);
[TH, DTH] = meshgrid(th, dth);
E = m*g*L*(1-cos(TH)) + 1/2 * m*L^2*DTH.^2;
figure
contour(TH, DTH, E, 20);
hold on
[c,h] = contour (TH, DTH, E, [2*m*g*L 2*m*g*L], 'k--');
xmin = min(abs(c(1,:)));
ymin = min(abs(c(2,:)));
plot(xmin,ymin, 'k*')
legend('Energy Contours', 'E = 2gmL', 'min')
set(0,'DefaultLegendAutoUpdate','off')

options = odeset('RelTol', 1e-3)
[t,x] = ode45(pendulum(x,u,m,g,L,mu), [0, 60], [.99*pi, 0], options);
plot(x(:,1), x(:,2))
comet(x(:,1), x(:,2), .99)

% Resolving the ODE:
[t,x] = ode45(pendulum1(x,u,m,g,L,mu), [0, 60], [x(end,1), x(end,2)], options);


% Function for exercise 1, part g
function dq = dq4(q, R, C)
    dq = @(q) -q/(R*C);
end
% Function for exercise 2, part a
function dx = Lorentz(x, a, b, c)
    dx = @(x,a,b,c) [a * (x(2) -x(1)); x(1)*(b-x(3))-x(2); x(1)*x(2)-c*x(3)];
end
% Function for exercise 3, part e
function dx = pendulum(x,u,m,g,L,mu)
    dx = @(t, x) [x(2); -g/L*sin(x(1))-mu/m*abs(x(2)).*x(2)]
end
% Function for exercise 3, part h (includes a forcing function)
function dx = pendulum1(x,u,m,g,L,mu)
    dx = @(t, x) [x(2); -g/L*sin(x(1)) - mu/m*abs(x(2)).*x(2) + (1/(m*L^2))*sin(t*sqrt(g/L))]
end
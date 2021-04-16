% ECEN 2310 HWK8: Matt Hartnett

% Exercise 1:
r1 = 11;
r2 = 2;
x = @(t) (r1+r2)*cos(t) -r2*cos((r1/r2+1)*t);
y = @(t) (r1+r2)*sin(t) -r2*sin((r1/r2+1)*t);
figure(1)
hold on
t = linspace(0, 4*pi, 500);
plot(t, x(t))
plot(t, y(t))
legend('x(t)', 'y(t)')
xlabel('t')

% Exercise 2:
P0 = 120;
ap = 3*10^-4;
an = 7*10^-4;
P = @(q) P0 - ap*q.^2;
N = @(q) an*q.^2;
q = linspace(0, 500, 100);
figure(2)
hold on
plot(q, P(q))
plot(q, N(q))
xlabel('q')
q0a = 1;
qsola = fsolve(@(q) P(q)-N(q), q0a)
q0b = 0;
qsolb = fsolve(@(q) P(q)-N(q), q0b)
q0c = -1;
qsolc = fsolve(@(q) P(q)-N(q), q0c)
% The solution that begins at 1 is the best for this task, as the one
% starting at 0 does not find a solution, and the one starting at -1 finds
% the solution where q is negative, which does not make sense in the
% context of the problem. This is due to how fsolve uses newton's method
% where it takes the derivative and moves forward based on the value of the
% derivative. At 0, the derivative is 0, so it can't move forward. When it
% begins at -1, the derivative is negative and it moves backwards. However,
% beginning at 1 finds the solution in the correct fashion.
plot(qsola, P(qsol), 'kd')
legend('P(q)', 'N(q)', 'Intersection')

% Exercise 3:
a = 3;
b = 40;
f = @(x) a*x.^2 + b*x;
x = [-20:20];
figure(3)
hold on
plot(x, f(x))
xmin = fminsearch(@(x) f(x), 1);
plot(xmin, f(xmin), 'r*')
c = 200;
g = @(x) f(x) + c*sin(x/2);
plot(x, g(x))
for i = 1:5
    x0 = 40*rand-20;
    plot(x0, g(x0), 'ro')
    x0min = fminsearch(@(x) g(x), 0);
    plot(x0min, g(x0min), 'b*')
    if x0 < x0min
        x = [x0: x0min];
    else
        x = [x0min: x0];
    end
    plot(x, g(x), 'k--')
end
% The solutions always converge to a global minimum because fminsearch uses
% the random value as a starting point, and ideally, the starting point
% does not effect the output of fminsearch, meaning that the random values
% for the starting point all return the same xmin.
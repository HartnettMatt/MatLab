% Exercise 1:
% Part A:
syms a b c x

% Part B:
f = a*x^2+b*x+c
solve(f, x)

% Part C:
f = subs(f, a, 10)
f = subs(f, c, -1)

% Part D:
solve(f,x)

% Part E:
f = subs(f, b, 4)
solve(f == 5, x)
a = solve(f, x);

% Part F:
fplot(f, [-1 1])

% Part G:
hold on
scatter(a(1),0,'k','*')
scatter(a(2),0,'k','*')
hold off



% Exercise 2:
% Part A:
syms k x
f = exp(-k*x^2)

% Part B:
g = diff(f)
g= subs(g, k, 4);

% Part C:
fplot(g, [-2 2])
hold on

% Part D:
dg = diff(g);
a = solve(dg == 0, x)

% Part E:
b = subs(g, x, a(1));
scatter(a(1),b, 'r')
b = subs(g, x, a(2));
scatter(a(2),b, 'r')
hold off


% Exercise 3:
syms u1 u2 s v c y real;
dv = u1 + u2 - y;
ds = u2 - c*y;
syms dc real;

% Part A:
dc = solve(ds == v*dc + c*dv, dc)

% Part B:
collect([dv;dc],[u1;u2])

% Part C:
[u1e u2e] = solve([dv dc] ==[0 0],[u1 u2])

% Exercise 4:
syms f1 f2 f3 f4 x a
f1 = exp(1i*x);
f2 = sin(2*pi*x)*(1-x^2);
f3 = sin(x)*cos(x);
f4 = log(a*x)*tan(x);

% Part A:
diff(f1, x)
diff(f1, x, 2)
int(f1, x)

% Part B:
diff(f2, x)
diff(f2, x, 2)
int(f2, x)

% Part C:
diff(f3, x)
diff(f3, x, 2)
int(f3, x)

% Part D:
diff(f4, x)
diff(f4, x, 2)
int(f4, x)

% Exercise 5:
% Part A:
syms p(t) m b k x0
myode = m*diff(p,t, 2) + b*diff(p,t) + k * p == 0;
myode = subs(myode, p , x);
myode = subs(myode, m , 1);
myode = subs(myode, b , 2*c*w);
myode = subs(myode, k , w^2)

% Part B:
dx = diff(x,t);
cond = [x(0) == x0, dx(0) ==0];
S = dsolve(myode, cond)

% Part C:
S0 = subs(S, x0, 1);
S0 = subs(S0, w, 10);
S1 = subs(S0, c, .1);
S2 = subs(S0, c, .2);
S3 = subs(S0, c, .4);
hold on
fplot(S1, [0 5])
fplot(S2, [0 5])
fplot(S3, [0 5])
legend('\zeta = 0.1', '\zeta = 0.2', '\zeta = 0.4')
title('Effect of \zeta')
hold off

% Part D:
S0 = subs(S, x0, 1);
S0 = subs(S0, c, .1);
S1 = subs(S0, w, 10);
S2 = subs(S0, w, 20);
S3 = subs(S0, w, 40);
f1 = figure;
hold on
fplot(S1, [0 5])
fplot(S2, [0 5])
fplot(S3, [0 5])
legend('\omega = 10', '\omega = 20', '\omega = 40')
title('Effect of \omega')
hold off

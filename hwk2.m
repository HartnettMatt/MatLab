% Exercise 1
syms a b c x
f = a*x^2+b*x+c
solve(f, x)
f = subs(f, a, 10)
f = subs(f, c, -1)
solve(f,x)
f = subs(f, b, 4)
solve(f == 5, x)
a = solve(f, x);
%fplot(f, [-1 1])
%hold on
%scatter(a(1),0,'k','*')
%scatter(a(2),0,'k','*')
%hold off

% Exercise 2
syms k x
f = exp(-k*x^2)
g = diff(f)
g= subs(g, k, 4);
% fplot(g, [-2 2])
% hold on
% dg = diff(g);
% a = solve(dg == 0, x)
% b = subs(g, x, a(1));
% scatter(a(1),b, 'r')
% b = subs(g, x, a(2));
% scatter(a(2),b, 'r')
% hold off

% Exercise 3
syms u1 u2 s v c y dv dc ds
s = v*c
dv = u1 + u2 - y
ds = u2 - c*y
ds = v*dc + c*dv
dv = diff(v)
dc = diff(c)
ds = diff(s)

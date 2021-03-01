% Exercise 1
a = [0:5:100]
disp(a(7))
disp(a([4, 8, 15, 16]))
disp(a(1:5))
disp(flip(a(1:5)))
disp(a(end-4:end))
disp(flip(a(end-4:end)))
disp(a(find(a<42)))
disp(a(a < 42))

% Exercise 2
one = ones(1, 100)';
zero = zeros(1, 100)';
ramp = [-1:0.01:.99]';
t = (0:1:199)';
y = cos(2*pi*t/200);
x = [one; zero; ramp; y];
% plot(x)
t = [0:0.01:length(x)/100 - 0.01]';
w = 10*pi;
y = sin(w*t);
% This line is commented out since it is impossible to use matrix
% multiplication on column vectors so it throws an error
% a1 = size(x*y)
a2 = size(x.*y)
a3 = size(x'*y)
a4 = size(x*y')
% The outputs of these three are so different because a1 is an invalid matrix multiplication operator,
% which throws an error. a2 is the result of multiplying each element of x by each element of y, which
% results in a matrix of the same size as x (600x1). a3 is the actual matrix product of the transpose(x) and
% and y, which has a size of 1x1 since a 1x600*600x1 results in a 1x1 matrix.
% In a similar fasion, x*transpose(y) is the multiplication of a 600x1*1x600 matrix, which results in
% a 600x600 matrix
z = x.*y;
hold on;
plot(x)
plot(z)
legend('x', 'z');
hold off;
xd = z./y;

% Exercise 3
% Part A, B, C:
q = [0:5:500];
P0 = 120;
ap = 3*10^-4;
P = P0 - ap.*(q.^2);
an = 7*10^-4;
N = an.*(q.^2);
% Part C:
hold on
plot(q, P)
plot(q, N)
% Part E, F:
e = abs(P - N);
x = (e < 1);
plot(q(x), P(x), '*', 'Color', 'k')
% When you zoom in, you can see that the marker is not exactly over the intersections
% Part G:
j = find(e == min(e));
q2 = q(j-1):0.05:q(j+1);
% Part H:
P2 = P0 - ap.*(q2.^2);
N2 = an.*(q2.^2);
e2 = abs(P2 - N2);
j = find(e2 == min(e2));
plot(q2(j), P2(j), '+', 'Color', 'k')
hold off

% Exercise 4
hold on
x = -1:0.02:1;
k = 4;
f = exp(-1*k*(x).^2);
g = diff(f);
plot(x(1:end-1),g)
x1 = find(g == min(g))
x2 = find(g == max(g))
plot(x(x1), g(x1), '*', 'Color', 'r')
plot(x(x2), g(x2), '*', 'Color', 'r')
hold off

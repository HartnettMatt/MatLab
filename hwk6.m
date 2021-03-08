% % Exercise 1
% fR = 1;
% al = 2.5;
% N = 10;
% H0 = hamiltonian(fR, al, N);
% % V are the eigenvectors, e are the eigenvalues.
% [V,D] = eig(H0);
% e = diag(D);
% b = V(:,1:1);
% p = -N:N;
% figure
% bar(p,b)
% b = V(:,2:2)
% figure
% bar(p,b)

% Exercise 2
A = [-4];
X0 = 5;
dT = .2;
T = 1.1;
[t,X] = f_Euler(A,X0,dT,T);
% plot(t,X)

% Exercise 3
% Part A/Code from week 2:
syms c w y(t) dy(t)
myode = diff(y, t, 2) + 2*c*w*diff(y,t) + (w^2)*y == 0;
dy = diff(y,t);
cond = [y(0) == 10, dy(0) == 0];
S = dsolve(myode, cond)
S0 = subs(S, w, 1);
S0 = subs(S0, c, .5);
fplot(S0, [0 20]);

% Part B:
w = 1;
c = 0.5;
hold on
title('Forward Euler')
A = [0 1;-1*w^2 -2*c*w];
X0 = [10; 0];
T = 20;
dT = .01;
[t,X] = f_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = .1;
[t,X] = f_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = .5;
[t,X] = f_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = 1;
[t,X] = f_Euler(A,X0,dT,T);
plot(t, X(1,:))
% Plotting dT=2 creates a very inaccurate graph that ruins the scale
% because its inaccuracy is compounding
% dT = 2;
% [t,X] = f_Euler(A,X0,dT,T);
% plot(t, X(1,:))
legend('y(t)', 'dT = 0.01', 'dT = 0.1', 'dT = 0.5','dT = 1')
% As shown in the graph, as the discretization step, dT, gets smaller, the
% output of the Euler approximation becomes more accurate to the analytic
% solution

% Part C:
figure
fplot(S0, [0 20]);
hold on
title('Backward Euler')
dT = .01;
[t,X] = b_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = .1;
[t,X] = b_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = .5;
[t,X] = b_Euler(A,X0,dT,T);
plot(t, X(1,:))
dT = 1;
[t,X] = b_Euler(A,X0,dT,T);
plot(t, X(1,:))
% dT = 2, still looks fairly accurate (at least it doesn't ruin everything)
dT = 2;
[t,X] = b_Euler(A,X0,dT,T);
plot(t, X(1,:))
legend('y(t)', 'dT = 0.01', 'dT = 0.1', 'dT = 0.5','dT = 1', 'dT = 2')
% As shown in the graph, as the discretization step, dT, gets smaller, the
% output of the Euler approximation becomes more accurate to the analytic
% solution

% Part D:
figure
fplot(S0, [0 20]);
hold on
title('Trapeziod Rule')
dT = .01;
[t,X] = trapz_rule(A,X0,dT,T);
plot(t, X(1,:))
dT = .1;
[t,X] = trapz_rule(A,X0,dT,T);
plot(t, X(1,:))
dT = .5;
[t,X] = trapz_rule(A,X0,dT,T);
plot(t, X(1,:))
dT = 1;
[t,X] = trapz_rule(A,X0,dT,T);
plot(t, X(1,:))
% dT = 2, still looks fairly accurate (at least it doesn't ruin everything)
dT = 2;
[t,X] = trapz_rule(A,X0,dT,T);
plot(t, X(1,:))
legend('y(t)', 'dT = 0.01', 'dT = 0.1', 'dT = 0.5','dT = 1', 'dT = 2')

% Part E:
figure
subplot(2,1,1);
hold on
dT = 0.2;
[t,x0] = f_Euler(A,X0,dT,T);
[t,x1] = b_Euler(A,X0,dT,T);
[t,x2] = trapz_rule(A,X0,dT,T);
fplot(S0, [0 20]);
plot(t, x0(1,:));
plot(t, x1(1,:));
plot(t, x2(1,:));
legend('y(t)', 'f Euler', 'b Euler', 'Trapeziod')
subplot(2,1,2);
hold on
disp(S0);
dS = diff(S0);
fplot(dS, [0 20]);
plot(t, x0(2,:));
plot(t, x1(2,:));
plot(t, x2(2,:));
legend('dy/dt', 'f Euler', 'b Euler', 'Trapeziod')
% Note: I don't know why there are those weird gray bars when plotting
% dy/dt. If I remove the fplot, they go away, but I can't figure out the
% cause of them. However, dy/dt does show up correctly, so I didn't think
% it would be a huge issue.
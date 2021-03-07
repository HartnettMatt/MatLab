% Exercise 1
% Part A:
px = plot3([0 1],[0 0],[0 0], 'Color', 'r');
hold on;
py = plot3([0 0],[0 1],[0 0], 'Color', 'g');
pz = plot3([0 0],[0 0],[0 1], 'Color', 'b');
px.LineWidth = 2;
py.LineWidth = 2;
pz.LineWidth = 2;
% Part B:
grid on
axis([-1 1 -1 1 -1 1])
% Part C:
w = 0.5.*[1;1;1]
p = plot3([0 w(1)], [0, w(2)], [0, w(3)], 'Color', 'k');
p.LineWidth = 2;

% Rotation matrix system
syms T;
Rx = [1 0 0; 0 cos(T) -1*sin(T); 0 sin(T) cos(T)];
Ry = [cos(T) 0 sin(T); 0 1 0; -1*sin(T) 0 cos(T)];
Rz = [cos(T) -1*sin(T) 0; sin(T) cos(T) 0; 0 0 1];
% Part D:
for i = 0:4*pi/90:4*pi/3
    Rx1 = subs(Rx,T,i);
    w1 = Rx1*w;
    p = plot3([0 w1(1)], [0, w1(2)], [0, w1(3)], 'Color', 'r');
end
p.LineWidth = 2;
p.Color = 'm';
% Part E
for i = 0:5*pi/120:5*pi/3
    Ry1 = subs(Ry,T,i);
    w2 = Ry1*w1;
    p = plot3([0 w2(1)], [0, w2(2)], [0, w2(3)], 'Color', 'g');
end
p.LineWidth = 2;
p.Color = 'c';
% Part F
for i = 0:pi/20:5*pi
    Rz1 = subs(Rz,T,i);
    w3 = Rz1*w2;
    p = plot3([0 w3(1)], [0, w3(2)], [0, w3(3)], 'Color', 'b');
end
p.LineWidth = 2;
p.Color = 'k';
% Part G
Rx1 = subs(Rx,T,4*pi/3);
Ry1 = subs(Ry,T,5*pi/4);
Rz1 = subs(Rz,T,pi);
Ru = Rz1*Ry1*Rx1;
u = Ru*w
p = plot3([0 u(1)], [0, u(2)], [0, u(3)], '--y');
p.LineWidth = 2;
% Part H
Rx1 = subs(Rx,T,4*pi/3);
Ry1 = subs(Ry,T,5*pi/4);
Rz1 = subs(Rz,T,pi);
Re = Rx1*Ry1*Rz1;
e = Re*w
p = plot3([0 e(1)], [0, e(2)], [0, e(3)], ':k');
p.LineWidth = 2;
% e and u don't match since the order of rotation is important, so 
% RxRyRz =/= RzRyRx, which makes the outputs u =/= e. u had the same
% rotation order as w3, which is why they are equal and why e is not equal 
% to w3

% Exercise 2
% Part A:
syms x1 x2
x = [x1; x2];
A = [1 1; -.3/10 (1-.3)/10];
b = [4; 0];
% Part B:
x = A\b
% Part C:
Ai = inv(A)
% Part D:
c = all(Ai*b - x) % Should return logical zero if Ai is the inverse of A

% Exercise 3
R = [90 30 100 15 20 20 60];
W = [200 250 120 300];
% Part A:
G = 1./R
% Part B:
% x is the vector of node voltages
syms v1 v2 v3
x = [v1; v2; v3]
A = [(G(1)+G(2)+G(3)+G(4)) -1*G(2) 0; 
    -1*G(2) (G(2)+G(3)+G(5)) -1*(G(3)+G(5)); 
    0 -1*G(3)-G(5) (G(3)+G(5)+G(6)+G(7))]
b = [G(1)*W(1)+G(2)*W(2);
    G(2)*W(2)+G(3)*W(3);
    G(3)*W(3)-G(7)*W(4)]
% Part C:
x = A\b

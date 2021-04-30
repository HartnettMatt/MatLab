L = [3 25 4 24 26 6 24];
th = 4*pi/6;


e = @(x) mechanism(th,x,L);

x0 = [0 -1*pi/2 0 -1*pi/2];
opts = optimset('Display','off');
x = fsolve(e, x0, opts);

D = [25 25];
figure(1)
hold on
p1 = [0 0];
p2 = p1 + L(1)*[cos(th) sin(th)];
p3 = p2 + L(2)*[cos(x(1)) sin(x(1))];
p4 = p3 - L(3)*[cos(x(2)) sin(x(2))];
p5 = p3 + L(5)*[cos(x(3)) sin(x(3))];
p6 = p5 - L(6)*[cos(x(4)) sin(x(4))];

P = [p1;p2;p3;p4;p3;p5;p6];

r1 = p4;
r2 = r1 - D(1)*[cos(x(2)) sin(x(2))];
s1 = p6;
s2 = s1 - D(2)*[cos(x(4)) sin(x(4))];

R = [r1; r2];
S = [s1; s2];

plot(P(:,1),P(:,2),'-o')
hold on
plot(R(:,1),R(:,2),'k',S(:,1),S(:,2),'k')
hold off
    axis([-10 60 -10 60])


for th = linspace(pi/2, 13*pi/2, 150)
    x0 = x;
    e = @(x) mechanism(th,x,L);
    [x, ~, flag] = fsolve(e, x0, opts);
    if flag == 0
        disp('No solution found, press any key to exit')
        pause
        return
    end
    
    p1 = [0 0];
    p2 = p1 + L(1)*[cos(th) sin(th)];
    p3 = p2 + L(2)*[cos(x(1)) sin(x(1))];
    p4 = p3 - L(3)*[cos(x(2)) sin(x(2))];
    p5 = p3 + L(5)*[cos(x(3)) sin(x(3))];
    p6 = p5 - L(6)*[cos(x(4)) sin(x(4))];
    
    P = [p1;p2;p3;p4;p3;p5;p6];
    
    r1 = p4;
    r2 = r1 - D(1)*[cos(x(2)) sin(x(2))];
    s1 = p6;
    s2 = s1 - D(2)*[cos(x(4)) sin(x(4))];
    
    R = [r1; r2];
    S = [s1; s2];
    
    plot(P(:,1),P(:,2),'-o')
    hold on
    plot(R(:,1),R(:,2),'k',S(:,1),S(:,2),'k')
    hold off
    axis([-10 60 -10 60])
    pause(0.05)
end


function e = mechanism(th,x,L)
    e = [L(1)*cos(th)+L(2)*cos(x(1))-L(3)*cos(x(2))-L(4);
        L(1)*sin(th)+L(2)*sin(x(1))-L(3)*sin(x(2));
        L(3)*cos(x(2))+L(5)*cos(x(3))-L(6)*cos(x(4))-L(7);
        L(3)*sin(x(2))+L(5)*sin(x(3))-L(6)*sin(x(4))];
end
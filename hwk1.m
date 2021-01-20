%Exercise 2:
% Two similar functions are logspace and colon. The difference between
% linspace(0,1,10) and 0:0.1:1 is that linspace creates a column vector
% that linearly increases from 0 to 1 in 10 steps, which means it increases
% by 1/9, whereas the colon command increases from 0 to 1 in steps of 0.1,
% which results in a column vector that is 1 larger.

%Exercise 3:
x = linspace(0, 2*pi);
y = sin(x);
figure
plot(x,y)
title('y=sin(x)')
xlabel('x[rad]')
ylabel('y[]')

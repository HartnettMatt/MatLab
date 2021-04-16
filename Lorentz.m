% Function for exercise 2, part a
function dx = Lorentz(x, a, b, c)
    dx = @(x, a, b, c) [a * (x(2) -x(1)); x(1)*(b-x(3))-x(2); x(1)*x(2)-c*x(3)];
end
function B = B(in1,u1)
%B
%    B = B(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    03-Apr-2021 19:19:24

x2 = in1(2,:);
x4 = in1(4,:);
x5 = in1(5,:);
B = [0.0;sin(atan(x5.*1.2e+1-atan(x2./3.0e+1+x4.*(1.3e+1./2.5e+2)).*1.2e+1).*(2.57e+2./2.0e+2)).*sin(u1).*(-1.5696e-1);0.0;0.0;1.0./5.0e+1];

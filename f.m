function f = f(in1,u1)
%F
%    F = F(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    03-Apr-2021 17:53:47

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
x4 = in1(4,:);
x5 = in1(5,:);
t2 = x5.*1.2e+1;
t3 = x2./3.0e+1;
t4 = x4.*(1.3e+1./2.5e+2);
t5 = x4.*(4.1e+1./7.5e+2);
t6 = t3+t4;
t7 = t3+t5;
t8 = atan(t6);
t9 = atan(t7);
t10 = t8.*1.2e+1;
t12 = t9.*1.2e+1;
t11 = -t10;
t13 = atan(t12);
t14 = t2+t11;
t16 = t13.*(2.57e+2./2.0e+2);
t15 = atan(t14);
t17 = sin(t16);
t18 = t15.*(2.57e+2./2.0e+2);
t19 = sin(t18);
f = [x1+sin(x3).*(3.0./5.0)+(x2.*cos(x3))./5.0e+1;t17.*(-1.5696e-1)+x2-(x1.*x4)./5.0e+1+t19.*cos(u1).*1.5696e-1;x3+x4./5.0e+1;t17.*1.058385959709911e-1+x4+t19.*cos(x5).*1.006757376309428e-1;u1./5.0e+1+x5];

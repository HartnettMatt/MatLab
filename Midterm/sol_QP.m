 function [dz, l] = sol_QP(H, h, E, e)
 % Create matrices
    nz = size(H, 1);
    nl = size(E, 1);
    O = zeros(nl);
    
 % Build system of equations
    A = [H E'; E O];
    b =-[h; e];
  
 % Solved and extract
    y = A\b;
    dz = y(1:nz);
    l = y(nz+(1:nl));
 end
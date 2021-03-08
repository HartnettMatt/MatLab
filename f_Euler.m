function [t,X] = f_Euler(A,X0,dT,T)
% Part A:
    [n m] = size(A);
    [j k] = size(X0);
    [a b] = size(dT);
    [c d] = size(T);
    if n ~= m
        error('Matrix must be square')
    end
    if k ~= 1 | j ~= n
        error('X0 must be a column vector of size A')
    end
    if a ~= 1 | b ~= 1
        error('dT must be a scalar')
    end
    if c ~= 1 | d ~= 1
        error('T must be a scalar')
    end
    
% Part B:
    N = T/dT;
    if floor(N) ~= N;
        warning('Rounding N down to an integer value')
        N = floor(N);
    end
    
% Part C:
    t = 0:dT:N*dT;
  
% Part D:
    I = eye(n);
    K0 = eye(N+1);
    K1 = zeros(N+1);
    K1 = K1 + diag(ones(N, 1), -1);
    D = kron(K0,I) - kron(K1,(I+dT*A));
    
% Part E:
    [e f] = size(D);
    e = zeros(f-j,1);
    e = [X0; e];
    
% Part F:
    X = reshape(D\e, [j, N+1]);
end
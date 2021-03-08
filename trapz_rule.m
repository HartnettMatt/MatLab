function [t,X] = trapz_rule(A,X0,dT,T)
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
    
    N = T/dT;
    if floor(N) ~= N;
        warning('Rounding N down to an integer value')
        N = floor(N);
    end
    
    t = 0:dT:N*dT;
  
    I = eye(n);
    K0 = eye(N+1);
    K1 = zeros(N+1);
    K1 = K1 + diag(ones(N, 1), -1);
    D = kron(K0,I) - kron(K1,(I-dT/2*A)\(I + dT/2*A));
    
    [e f] = size(D);
    e = zeros(f-j,1);
    e = [X0; e];
    
    X = reshape(D\e, [j, N+1]);
end
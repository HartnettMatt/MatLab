 function [H,h,E,e] = gen_QP(z,Q,R,x0,n,m,N)
%  Extract state and input
     X = reshape(z(1:N*n), n, N);
     U = reshape(z(N*n+(1:N*m)), m, N);
%  Build H and h
     H = blkdiag(kron(eye(N),Q), kron(eye(N),R));  
     h = H*z;
     
%  Build E and e
     Ea = eye(n*N);
     Eb = zeros(n*N, m*N);
     e = zeros(n*N, 1);
     Eb(1:n, 1:m) = -B(x0, U(:,1));
     e(1:n, 1) = -f(x0,U(:, 1))+X(:, 1);
%  Remove the first column from U
     U(:, 1) = [];

%  Update elements
     for j = 1:N-1 
        Ea(j*n+(1:n), (j-1)*n+(1:n)) = -A(X(:,j) ,U(:,j));
        Eb(j*n+(1:n), j*m+(1:m)) = -B(X(:,j), U(:,j));
        e(j*n+(1:n), 1) = -f(X(:,j), U(:,j))+X(:,j+1);
     end

     E = [Ea Eb];

 end

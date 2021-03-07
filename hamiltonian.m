% Function that generates the hamiltonian that describes a cloud of
% ultracold atoms trapped in an optical lattice. Returns H, a matrix that
% describes the cloud. Has the inputs fR: recoil frequency, al:
% normalized lattice depth, N: number of momentum states
function H = hamiltonian(fR,al,N)
    d1 = -N:1:N;
    a = -1*al*ones(1,2*N);
    H = diag(4*[d1].^2) + diag(a, -1) + diag(a, 1);
end
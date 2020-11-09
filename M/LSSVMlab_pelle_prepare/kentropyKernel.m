function [en,U,lam] = kentropyKernel(X, kernel, kernel_par, etype, nb)
% Quadratic Renyi Entropy for a kernel based estimator
% 
% The eigenvalue decomposition can also be computed (or
% approximated) implicitly:
% >> H = kentropy(X, kernel, kernel_par, type, nb)
% 
%       Outputs    
%         H          : Quadratic Renyi entropy of the kernel matrix
%       Inputs    
%         X          : N x d matrix with the training data
%         kernel     : Kernel type (e.g. 'RBF_kernel')
%         kernel_par : Kernel parameter (bandwidth in the case of the 'RBF_kernel')
%         type(*)    : 'eig'(*), 'eigs', 'eign'
%         nb(*)      : Number of eigenvalues/eigenvectors used in the eigenvalue decomposition approximation

n = size(X,1);

if ~(strcmp(etype, 'eig') |strcmp(etype, 'eigs') |strcmp(etype,'eign')),
   error('type has to be ''eig'', ''eigs'' or ''eign''...');
end

if strcmp(etype,' ')
    etype='eig';
end
if strcmp(etype,'eign')
    [U,lam] = eign(X,kernel,kernel_par,nb);
    
elseif strcmp(etype,'eig')
    omega = kernel_matrix(X, kernel, kernel_par);
    if strcmp(nb, ' ')
        [U,lam] = eig(omega);
    else
        [U,lam] = eig(omega, nb);
    end
    if size(lam,1)==size(lam,2), lam = diag(lam); end
    %onen = ones(n,1)./n; en = -log(onen'*omega*onen);
elseif strcmp(etype,'eigs')
    omega = kernel_matrix(X, kernel, kernel_par);
    if strcmp(nb, ' ')
        [U,lam] = eigs(omega);
    else
        [U,lam] = eigs(omega, nb);
    end 
    if size(lam,1)==size(lam,2), lam = diag(lam); end   
end
 
en = -log((sum(U,1)/n).^2 * lam);
  
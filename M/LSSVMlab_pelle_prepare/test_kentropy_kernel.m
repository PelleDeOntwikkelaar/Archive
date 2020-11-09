x = sort(2.*randn(2000,1));
x0 = sort(2.*randn(2000,1));
%x=(-9.95:0.1:10)';
%x0=(-9.95:0.05:10)';
eval('y = sinc(x)+0.05.*randn(length(x),1);',...
     'y = sin(pi.*x+12345*eps)./(pi*x+12345*eps)+0.05.*randn(length(x),1);');

eval('y0 = sinc(x0)+0.05.*randn(length(x0),1);',...
     'y0 = sin(pi.*x0+12345*eps)./(pi*x0+12345*eps)+0.05.*randn(length(x0),1);');

disp(' The parameters are initialized...');


%
% initiate values
kernel = 'RBF_kernel';
sigma2=.75;
gamma=1;
crit_old=-inf;
Nc=15;
Xs=x(1:Nc,:);
Ys=y(1:Nc,:);

disp(' The optimal reduced set is constructed iteratively: ');

Xsp=Xs; Ysp=Ys;
  
S=ceil(length(x)*rand(1));
Sc=ceil(Nc*rand(1));
Xs(Sc,:) = x(S,:);
Ys(Sc,:) = y(S);
Ncc=Nc;

%
% automaticly extract features and compute entropy
%
crit = kentropyKernel(Xs,kernel, sigma2,' ',1);
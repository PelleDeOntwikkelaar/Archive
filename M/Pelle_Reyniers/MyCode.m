% Test of matlab parallel computing toolbox.
function a = MyCode(A)

tic
parfor i = 1:200
    a(i) = max(abs(eig(rand(A))));
end
toc
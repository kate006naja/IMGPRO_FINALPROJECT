function v = gmean(A)
mn = size(A,1);     %% The length of the columns of A is always mn.
v = prod(A,1).^(1/mn);

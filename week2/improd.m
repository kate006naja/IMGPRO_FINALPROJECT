function [p, pmax, pmin, pn] = improd(f, g);
% IMPROD computes the product of two images
%  [P, PMAX, PMIN, PN]
fd = double(f);
gd = double(g);
p = fd*gd;
pmax = max(p(:));
pmin = min(p(:));
pn = mat2gray(p);

% the end
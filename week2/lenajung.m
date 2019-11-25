function [pmax, pmin, pmean, b] = lenajung(f)
% LENAJUNG compute the eieiei of lena jung image
pmax = max(f(:));
pmin = min(f(:));
pmean = mean(f(:));
b = imbinarize(f);
% the end

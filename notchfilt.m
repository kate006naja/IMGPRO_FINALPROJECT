C:\Users\theka\OneDrive\desktop\codefunction [H, D] = notchfilt(type, M, N, D0, n, c)
%
% Use function dftuv to set up the meshgrid arrays needed for
% computing the required distances.
[U, V] = dftuv(M, N);

% Compute the distances D(U, V).
D = sqrt(U.^2 + V.^2);
s = 0.000000001;
% Begin filter computations.
switch type
    case 'notch'
        u0 = c(1); % error point
        v0 = c(2); % error point
        D1 = sqrt( ((U - u0).^2 ) + ((V - v0).^2) );
        D2 = sqrt( ((U + u0).^2 ) + ((V + v0).^2) );
        H = 1./(1 + ((D0.^2)./(s + D1.*D2)).^n);
    otherwise
        error('Unknown filter type.');
end

%  ex_snf.m 
%  Restoration in the presence of Noise Only-Spatial Filtering
%  -------------------------------------------------------------
%  Demostration of Spatial Noise Filtering

f = imread('lena.bmp');
[M N] = size(f);
R = imnoise2('salt & pepper', M, N, 0.1, 0); % img corrupted by pepper noise
c = find(R == 0);
gp = f;
gp(c) = 0;
figure(1); imshow(f);
figure(2); imshow(gp);

R = imnoise2('salt & pepper', M, N, 0, 0.1); % corrupted by salt noise
c = find(R == 1); % seeking where noise == 1(white)
gs = f;
gs(c) = 255; % making salt (if not it only being pepper)
figure(3); imshow(gs);

% using Contraharmonic filter.
fp = spfilt(gp, 'chmean', 3, 3, 1.5);
figure(4); imshow(fp);

fs = spfilt(gs, 'chmean', 3, 3, -1.5);
figure(5); imshow(fs);

fpmax = spfilt(gp, 'max', 3, 3);
fsmin = spfilt(gs, 'min', 3, 3);

figure(6); imshow(fpmax); % min filtering
figure(7); imshow(fsmin); % max filtering
% ex4_03.m

% Obtaining Frequency Domain Filter from spartial Filter

%% read picture
f = imread('lena.bmp');
figure(1); imshow(f);

%% fourier transform picture fft(standard)
F = fft2(f); % usually have negative side
S = fftshift(log(1+abs(F))); % so you must shift it to positive side
S = gscale(S); % scale the picture to see easily (no touch processing img)
figure(2);
imshow(S, []);

h = fspecial('sobel'); 
figure(3);
freqz2(h); % plot 3d graph

% h top view
PQ = paddedsize(size(f)); %padding (two time of the picture)
H = freqz2(h, PQ(1), PQ(2));
H1 = ifftshift(H);
figure(4);
imshow(abs(H), []);

%% filtering
% double (transform normal form into double form)
gs = imfilter(double(f), h); % performing on spartial domain
gf = dftfilt(f, H1); 
% performing on frequency domain
% transform f into frequency domain first

figure(5);
subplot(2,2,1); imshow(gs, []);
subplot(2,2,2); imshow(gf, []);
subplot(2,2,3); imshow(abs(gs), []);
subplot(2,2,4); imshow(abs(gf), []);

% cause matlab(img) cant see negative 
figure(6);
subplot(1,2,1); imshow(gs > 0.2*abs(max(gs(:))));
subplot(1,2,2); imshow(gf > 0.2*abs(max(gf(:))));

d = abs(gs-gf);
max(d(:))
min(d(:))

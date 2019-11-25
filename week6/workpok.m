%ex1
%h1 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
%figure(1);
%freqz2(h1);

%h2 = [1 1 1; 1 -8 1; 1 1 1];
%figure(2);
%freqz2(h2);

%h3 = [1 1 0; 1 0 1; 0 1 1];
%figure(3);
%freqz2(h3);

%ex2
%f = imread('lena.bmp');
%F = fft2(f);
%S = fftshift(log(1+abs(F)));
%S = gscale(S);

%h1 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
%h2 = [1 1 1; 1 -8 1; 1 1 1];
%h3 = [1 1 0; 1 0 1; 0 1 1];

%PQ = paddedsize(size(f));
%H1 = freqz2(h1, PQ(1), PQ(2));
%HH1 = ifftshift(H1);
%H2 = freqz2(h2, PQ(1), PQ(2));
%HH2 = ifftshift(H2);
%H3 = freqz2(h3, PQ(1), PQ(2));
%HH3 = ifftshift(H3);

%gh1 = dftfilt(f, HH1);
%gh2 = dftfilt(f, HH2);
%gh3 = dftfilt(f, HH3);

%figure(1);
%subplot(2,2,1); imshow(gh1, []);
%subplot(2,2,2); imshow(gh2, []);
%subplot(2,2,3); imshow(gh3, []);

%ex3
%h1 = [-1 -2 -1; -1 10 -1; -1 -2 -1];
%figure(1);
%freqz2(h1);

%h2 = [1 2 3; -1 2 -1; -3 -2 -1];
%figure(2);
%freqz2(h2);

%l1 = [1 2 3; 1 0 1; 4 5 6];
%figure(3);
%freqz2(l1);

%l2 = [-1 -1 -2; 1 0 1; -1 -1 -1];
%figure(4);
%freqz2(l2);

%ex4
f = imread('lena.bmp');
h1 = [-1 -2 -1; -1 10 -1; -1 -2 -1];
h2 = [1 2 3; -1 2 -1; -3 -2 -1];
l1 = [1 2 3; 1 0 1; 4 5 6];
l2 = [-1 -1 -2; 1 0 1; -1 -1 -1];

PQ = paddedsize(size(f));
H1 = freqz2(h1, PQ(1), PQ(2));
HH1 = ifftshift(H1);
H2 = freqz2(h2, PQ(1), PQ(2));
HH2 = ifftshift(H2);
L1 = freqz2(l1, PQ(1), PQ(2));
LL1 = ifftshift(L1);
L2 = freqz2(l2, PQ(1), PQ(2));
LL2 = ifftshift(L2);

gh1 = dftfilt(f, HH1);
gh2 = dftfilt(f, HH2);
gl1 = dftfilt(f, LL1);
gl2 = dftfilt(f, LL2);



figure(1);
subplot(2,2,1); imshow(gh1, []);
subplot(2,2,2); imshow(gh2, []);
subplot(2,2,3); imshow(gl1, []);
subplot(2,2,4); imshow(gl2, []);
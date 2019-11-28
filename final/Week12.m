%% Week12.m Image Segmentation using Hough Transform

%% ex_hough_5dots
clear all;
close all;
f = zeros(101, 101);
f(1, 1) = 1;
f(101, 1) = 1;
f(1, 101) = 1;
f(101, 101) = 1;
f(51, 51) = 1;

[H, theta, rho] = hough(f);
figure(1); imshow(H, []);
figure(2); imshow(H, 'XData', theta, 'YData', rho);
axis on, axis normal;
xlabel('\theta'), ylabel('\rho');

%% line_segment
clear all;
close all;

f = imread('building.tif');
g_canny_best = edge(f, 'canny', [.04 .1], 1.5);

figure(1); imshow(g_canny_best);
[H, theta, rho] = hough(g_canny_best);

figure(2);
imshow(uint8(H), 'XData', theta, 'YData', rho); 
axis on, axis normal;
xlabel('\theta'), ylabel('\rho');
r = houghpeaks(H, 20);

hold on;

plot(theta(r(:, 2)), rho(r(:, 1)), 'linestyle', 'none',...
    'marker', 's', 'color', 'w');
lines = houghlines(g_canny_best, theta, rho, r);

figure(3); imshow(g_canny_best), hold on
for k = 1:length(lines)
xy = [lines(k).point1 ; lines(k).point2];
plot(xy(:, 1), xy(:, 2), 'LineWidth', 4, 'Color', ...
    [.6 .6 .6]);
end

%% Global Thresholding
clear all; close all;
f = imread('rice.tif');
T = 0.5*(double(min(f(:))) + double(max(f(:))));
done = false;

while ~done
    g = f>=T;
    Tnext = 0.5*(mean(f(g)) + mean(f(~g)));
    done = abs(T-Tnext) < 0.5;
    T = Tnext;
end
clc
T
To = graythresh(f)*255

%% Local Thresholding
clear all; close all;
f = imread('rice.tif');
figure(1); imshow(f);

se = strel('disk', 10);
fo = imopen(f, se);
figure(2); imshow(fo);

To = graythresh(fo);
T = fo + (To*255);
figure(3); imshow(T);

[m, n] = size(f);
out = zeros(m, n);
out_idx = find(f >= T);
out(out_idx) = 1;
figure(4); imshow(out);
%% line_segent.m
%% ----------------------
clear all
close all

f = imread('building.tif');

g_canny_best = edge(f, 'canny', [0.04 0.1], 1.5);
figure(1); imshow(g_canny_best);

[H, theta, rho] = hough(g_canny_best);
figure(2);
imshow(uint8(H), 'XData', theta, 'YData', rho); axis on, axis normal;
xlabel('\theta'), ylabel('\rho');

r = houghpeaks(H, 20);

hold on; % Sohw line first and then plot theta
plot(theta(r(:, 2)), rho(r(:, 1)), 'linestyle', 'none', 'marker', ...
    's', 'color', 'w');

lines = houghlines(g_canny_best, theta, rho, r);
figure(3); imshow(g_canny_best), hold on
for k = 1:length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 4, 'Color', ...
        [.6 .6 .6]);

end
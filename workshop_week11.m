%% CannyEdge.m
%%Canny Edge Detection
clear all;
close all;
clc; clf;
step=0;

FILTER_SIZE = 5;
SIGMA = 14;

LOW_THRESHOLD_FACTOR = 0.1;
HIGH_THRESHOLD_FACTOR = 0.3;

im = imread('building.tif');
im = double(im);
step = step+1;
figure(step);

gaussian_filter = fspecial('gaussian', FILTER_SIZE, SIGMA);

conv_im = conv2(im, gaussian_filter, 'same');
step = step+1;
figure(step);

[gaussian_filter_x gaussian_filter_y] = gradient(gaussian_filter);
im_gradient_x = conv2(conv_im, gaussian_filter_x, 'same');

% PAGE 2
im_gradient_y = conv2(conv_im, gaussian_filter_y, 'same');
n_direction = atan2(im_gradient_y, im_gradient_x);
n_direction = n_direction*180/pi;

n_direction_dis =zeros(512, 512);
for i = 1:512
    for j = 1:512
        if ((n_direction(i, j) > 0) && (n_direction(i, j) < 22.5) || (n_direction(i, j) > 157.5) && (n_direction(i, j) < -157.5))
            n_direction_dis(i, j) = 0;
        end
        
        if ((n_direction(i, j) > 22.5) && (n_direction(i, j) < 67.5) || (n_direction(i, j) < -112.5) && (n_direction(i, j) > -157.5))
            n_direction_dis(i, j) = 45;
        end
        
        if ((n_direction(i, j) > 67.5) && (n_direction(i, j) < 112.5) || (n_direction(i, j) < -67.5) && (n_direction(i, j) > 112.5))
            n_direction_dis(i, j) = 90;
        end
        
        if ((n_direction(i, j) > 112.5) && (n_direction(i, j) <= 157.5) || (n_direction(i, j) < -22.5) && (n_direction(i, j) > -67.5))
            n_direction_dis(i, j) = 135;
        end
    end
end
step = step + 1;
figure(step);

step = step +1;
figure(step);

step = step + 1;
figure(step);
imagesc(n_direction_dis); colorbar;

im_gradient_mag = sqrt(im_gradient_x.^2 + im_gradient_y.^2);
step = step + 1;
figure(step);

% PAGE 3
supressed_im = zeros(512, 512);
for i = 2:511
    for j = 2:511
        if (n_direction_dis(i, j) == 0)
            if (im_gradient_mag(i, j) > im_gradient_mag(i, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i, j+1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end
        if (n_direction_dis(i, j) == 45)
            if (im_gradient_mag(i, j) > im_gradient_mag(i + 1, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i - 1, j+1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end
        if (n_direction_dis(i, j) == 90)
            if (im_gradient_mag(i, j) > im_gradient_mag(i - 1, j) && im_gradient_mag(i, j) > im_gradient_mag(i + 1, j))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end
        if (n_direction_dis(i, j) == 135)
            if (im_gradient_mag(i, j) > im_gradient_mag(i - 1, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i + 1, j + 1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end
    end
end
step = step + 1;
figure(step);

% PAGE 4
ThreshL = LOW_THRESHOLD_FACTOR * max(max(supressed_im));
ThreshH = HIGH_THRESHOLD_FACTOR * max(max(supressed_im));
thresh_im = zeros(512, 512);
for i = 1:512
    for j = 1:512
        if (supressed_im(i, j) < ThreshL)
            thresh_im(i, j) = 0;
        elseif (supressed_im(i, j) > ThreshH)
            thresh_im(i, j) = 1;
        else
            if ((supressed_im(i + 1, j) > ThreshH) || (supressed_im(i - 1, j) > ThreshH) || (supressed_im(i, j + 1) > ThreshH) || (supressed_im(i, j - 1) > ThreshH))
                thresh_im(i, j) = 1;
            end
        end
    end
end
step = step + 1;
figure(step);
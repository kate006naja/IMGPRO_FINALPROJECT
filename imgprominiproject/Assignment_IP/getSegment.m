function [seg1, seg2] = getSegment(img, edge)

    % segment horizontal
    [H, theta, rho] = hough(edge, 'Theta', [-90, 89, 88, 87, -89, -88]);

    peaks = houghpeaks(H, 2);

    lines = houghlines(edge, theta, rho, peaks);

    x_upper = 1000000;
    x_lower = -100000;

    for k = 1:length(lines)

        xy = [lines(k).point1 ; lines(k).point2];
        x_upper = min(min(x_upper, xy(1, 2)), xy(2, 2));
        x_lower = max(max(x_lower, xy(1, 2)), xy(2, 2));

    end
    
    
    img = img(x_upper:x_lower, :, :);
    edge = edge(x_upper:x_lower, :, :);
    seg1 = img;
    
    % segment vertical

    [H, theta, rho] = hough(edge, 'Theta', [0]);

    peaks = houghpeaks(H, 2);

    lines = houghlines(edge, theta, rho, peaks);

    y_upper = 1000000;
    y_lower = -100000;

    for k = 1:length(lines)

        xy = [lines(k).point1 ; lines(k).point2];
        y_upper = min(min(y_upper, xy(1, 1)), xy(2, 1));
        y_lower = max(max(y_lower, xy(1, 1)), xy(2, 1));

    end
    seg2 = img(:, y_upper:y_lower, :);
end


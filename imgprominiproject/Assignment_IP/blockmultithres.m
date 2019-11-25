function out_img = blockmultithres(img)
%MULTITHRES Summary of this function goes here
%   Detailed explanation goes here
    s = 40;
    
    img = mat2gray(img);
    
    h = size(img, 1);
    w = size(img, 2);
    
    for x = 1:s:size(img, 1)
        for y = 1:s:size(img, 2)
            block = img(x:min(x+s-1, h), y:min(y+s-1, w));
            [level, metric] = multithresh(block);
            if metric > 0.8
                img(x:min(x+s-1, h), y:min(y+s-1, w)) = imquantize(block, level);
            else
                img(x:min(x+s-1, h), y:min(y+s-1, w)) = ones(size(block, 1), size(block, 2)).*mean(block);
            end
        end
    end
    
    out_img = mat2gray(img);
    
end


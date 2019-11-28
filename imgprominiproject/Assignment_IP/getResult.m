function res = getResult(gray)
%GETRESULT Summary of this function goes here
%   Detailed explanation goes here

    res = {};
    
    %%
    % for label
    
    [level, metric] = multithresh(gray);
    se = strel('disk', 1, 0);

    tmp = mat2gray(imerode(imquantize(gray, level), se));
    
    try
        [img_bb, ocr_res] = getBB(tmp);
        text = strip(ocr_res.Text);
        disp('Passed: 1')
        res = {img_bb, text};
    end

    %%
    % for HAIR
    
    se = strel('disk', 1, 0);

    tmp = mat2gray(imerode(im2bw(gray, 0.66), se));
    
    try
        [img_bb, ocr_res] = getBB(tmp);
        text = strip(ocr_res.Text);
        disp('Passed: 2')
        prev_size = size(res{2}, 2);
        cur_size = size(text, 2);
        if cur_size > prev_size
            res = {img_bb, text};
        end
    end
    
    %%
    % for VOLVO
    
    if size(res{2}) == 0
    
        h = fspecial('prewitt');

        gray = gray(60:220, 1:end);

        tmp = mat2gray(imerode(imfilter(gray, h), se));

        try
            [img_bb, ocr_res] = getBB(tmp);
            text = strip(ocr_res.Text);
            disp('Passed: 3')
            prev_size = size(res{2}, 2);
            cur_size = size(text, 2);
            if cur_size >= prev_size
                res = {img_bb, text};
            end
        end
    end
end


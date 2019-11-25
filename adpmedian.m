% adpmedian.m
function f = adpmedian(g, Smax)
% ADPMEIDAN performs adaptive median filtering
% F = ADPMEDIAN(G, $max) performs adaptive median filtering of image G.
% the median filter starts at size 3-by-3 and iterates up to the size
% SMAX-by-SMAX. SMAX must be an odd interger greater than 1

% $MAX must be an odd, positive integer greater than 1.
if (Smax <= 1) | (Smax/2 == round(Smax/2)) | (Smax ~= round(Smax))
    error('$MAX must be an odd integer  > 1.')
end
[M, N] = size(g);

% Initial setup
f = g;
f(:) = 0;
alreadyProcessed = false(size(g));

% Begin Filtering.
for k = 3:2:Smax
    zmin = ordfilt2(g, 1, ones(k, k), 'symmetric');
    zmax = ordfilt2(g, k*k, ones(k, k), 'symmetric');
    zmed = medfilt2(g , [k k], 'symmetric');
    processUsingLevelB = (zmed > zmin) & (zmax > zmed) & ~alreadyProcessed;
    zB = (g > zmin) & (zmax > g);
    outputZxy = processUsingLevelB & zB;
    outputZmed = processUsingLevelB & ~zB;
    f(outputZxy) = g(outputZxy);
    f(outputZmed) = zmed(outputZmed);
    
    alreadyProcessed = alreadyProcessed | processUsingLevelB;
    if all(alreadyProcessed(:))
        break;
    end
end

% Output zmed for remaining unprocessed pixeks. Note that this zmed was
% computed using a window size Smax-by-Smax, which is the final value of k
% in the loop.
f(~alreadyProcessed) = zmed(~alreadyProcessed);

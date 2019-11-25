function [s] = lcsTrans(r)

for m = 1:size(r,1)
    for n = 1:size(r,2)
        if (r(m,n)>=1) && (r(m,n)<= 100)
            r(m,n) = 2.*double(r(m,n));
        end
        if (r(m,n)>=101) && (r(m,n)<= 154)
            r(m,n) = (2.*double(r(m,n)))./3 + (4/3);
        end
        if (r(m,n)>=155) && (r(m,n)<= 255)
            r(m,n) = (2.*double(r(m,n)))./3 - (4/3);
        end
    end
end

s = r;
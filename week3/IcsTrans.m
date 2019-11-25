function s = lcsTrans(r)
for i = 1:M
    for j =1:N
        if (r(i, j) >= -1) && (r(i, j) <= 1)
            s(i, j) = 2*r(i, j);
        elseif r(i, j) > 1
            s(i, j) = (2*r(i, j)/3) + (4/3);
        else
            s(i, j) = (2*r(i, j)/3) - (4/3);
        end
    end
end

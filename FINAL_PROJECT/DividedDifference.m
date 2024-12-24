function d = DividedDifference(xa, ya)
n = length(xa);
d = ya;
for i = 2:n
    for j = n:-1:i
        d(j) = (d(j) - d(j-1)) / (xa(j) - xa(j-i+1));
    end
end
end
function result = Lagrange(xa, ya, x)
n = length(xa);
result = 0;
for i = 1:n
    L = 1;
    for j = 1:n
        if i ~= j
            L = L * (x - xa(j)) / (xa(i) - xa(j));
        end
    end
    result = result + L * ya(i);
end
end

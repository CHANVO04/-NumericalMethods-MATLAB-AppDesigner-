function result = Lagrange(xa, ya, x)
k = length(xa);
result = 0;
for i = 1:k
    L = 1;
    for j = 1:k
        if i ~= j
            L = L * (x - xa(j)) / (xa(i) - xa(j));
        end
    end
    result = result + L * ya(i);
end
end

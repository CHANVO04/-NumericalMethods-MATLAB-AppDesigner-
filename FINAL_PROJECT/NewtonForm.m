function result = NewtonForm(xa, da, x)
n = length(da);
result = da(n);
for i = n-1:-1:1
    result = result * (x - xa(i)) + da(i);
end
end
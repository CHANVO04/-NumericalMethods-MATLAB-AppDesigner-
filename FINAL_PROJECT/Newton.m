function result = Newton(xa, ya, x)
da = DividedDifference(xa, ya);
result = NewtonForm(xa, da, x);
end
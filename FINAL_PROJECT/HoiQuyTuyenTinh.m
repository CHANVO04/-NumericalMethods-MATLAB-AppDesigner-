function [a1, a0] = HoiQuyTuyenTinh(x,y)
    n = length(x);
    sumx = sum(x);
    sumy = sum(y);
    sumxy = sum(x .* y);
    sumx2 = sum(x .^ 2);
    xm = sumx / n;
    ym = sumy / n;

    % H? s? a1 và a0
    a1 = (n * sumxy - sumx * sumy) / (n * sumx2 - sumx^2);
    a0 = ym - a1 * xm;
end
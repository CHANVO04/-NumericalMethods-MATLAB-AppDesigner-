function [m,n] = chiadoi(fx, a, b, ss)
fxi = str2func(['@(x)',fx]);
n = 0;
    while(1)
        %middle value
        m = (a+b)/2;
        if fxi(m)*fxi(a)<0
            b = m;
        else
            a = m;
        end
        n = n + 1;
        if (b - a)<ss
            break;
        end
    end
end
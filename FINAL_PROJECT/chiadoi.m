function [m,solanlap] = chiadoi(f, a, b, e)
fxi = str2func(['@(x)',f]);
solanlap = 0;
    while(1)
        %middle value
        m = (a+b)/2;
        if fxi(m)*fxi(a)<0
            b = m;
        else
            a = m;
        end
        solanlap = solanlap + 1;
        if (b - a)<e
            break;
        end
    end
end
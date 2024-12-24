function [I] = TichPhanSimpson13(x,y,ham,N,c,d)
    if x ~= "" && y ~= ""
        x = str2num(x);
        y = str2num(y);
        n = length(x);
        a = x(1);
        b = x(n);
        h = (b-a)/N;
                
        yle = 0;
        ychan = 0;
        for i=2:2:n-1
            yle = yle + y(i);
        end
        for i=3:2:n-2
            ychan = ychan + y(i);
        end
        I = h/3*(y(1) + y(n) + 4*yle + 2*ychan);
            
    else
        h = (d-c)/N;
        ham = str2func(['@(x)',strrep(ham,'y = ',' ')]);
        hamle = 0;
        hamchan = 0;
        for i=1:2:N-1
            hamle = hamle + ham(c + i*h);
        end
        for i=2:2:N-1
            hamchan = hamchan + ham(c + i*h);
        end
        I = h/3*(ham(c) + ham(d) + 4*hamle + 2*hamchan);
    end
end
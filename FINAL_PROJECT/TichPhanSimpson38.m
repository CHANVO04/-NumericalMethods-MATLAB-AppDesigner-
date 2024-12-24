function [I] = TichPhanSimpson38(x,y,ham,N,c,d)
    if x ~= "" && y ~= ""
        x = str2num(x);
        y = str2num(y);
        n = length(x);
        a = x(1);
        b = x(n);
        h = (b-a)/N;
                
        y3 = 0;
        ytong = 0;
        for i=4:3:n-3
            y3 = y3 + y(i);
        end
        for i=2:1:n-1
            ytong = ytong + y(i);
        end
        I = (3*h)/(8) * (y(1) + y(n) + 3*(ytong - y3) + 2*y3);
            
    else
        h = (d-c)/N;
        ham = str2func(['@(x)',strrep(ham,'y = ',' ')]);
        ham3 = 0;
        hamtong = 0;
        for i=3:3:N-1
            ham3 = ham3 + ham(c + i*h);
        end
        for i=1:1:N-1
            hamtong = hamtong + ham(c + i*h);
        end
        I = (3*h)/(8) * (ham(c) + ham(d) + 3*(hamtong - ham3) + 2*ham3);
    end
end
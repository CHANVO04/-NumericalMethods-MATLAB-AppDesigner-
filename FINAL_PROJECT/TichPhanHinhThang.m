function [I] = TichPhanHinhThang(x,y,ham,N,c,d)
    if x ~= "" && y ~= ""
        x = str2num(x);
        y = str2num(y);
        n = length(x);
        a = x(1);
        b = x(n);
        I = (b-a)/(2*N)*(y(1)+y(n)+2*sum(y(2:n-1)));
            
    else
        h = (d-c)/N;                
        x = c+h:h:d-h;
        ham = str2func(['@(x)',strrep(ham,'y = ',' ')]);                
        I = (d-c)/(2*N)*(ham(c)+ham(d)+2*sum(ham(x)));
    end
end
function [x0,n,check] = lap(fx, fp, a, b, ss)
x0 = 0;
n = 0; % S? l?n l?p
check = 0;
fxi = str2func(['@(x)',fx]);

% Ki?m tra ?i?u ki?n l?p
syms x;
% Chuy?n chu?i hàm l?p thành bi?u th?c symbolic
fp_sym = str2sym(fp);
                    
% Tính ??o hàm c?a hàm l?p
dfp_sym = diff(fp_sym, x);
                    
% Chuy?n ??o hàm và hàm l?p thành function handle
dfp_func = matlabFunction(dfp_sym, 'Vars', x);
fpi = matlabFunction(fp_sym, 'Vars', x);
                
            
% Ki?m tra ?i?u ki?n |fp'(x)| < 1 trên ?o?n [a, b]
x_values = linspace(a, b, 100); % Chia ?o?n [a, b] thành 100 ?i?m ?? ki?m tra
dfp_values = abs(dfp_func(x_values)); % Tính tr? tuy?t ??i ??o hàm t?i các ?i?m
            
if all(dfp_values < 1)
    check = 1;                    
    m = (a + b) / 2; % Giá tr? gi?a
    if fxi(m) * fxi(a) < 0
        x0 = a;
    else
        x0 = b;
    end
            
    while true
        x1 = fpi(x0); % G?i hàm l?p
        n = n + 1;
        if abs(x1 - x0) < ss
            break;
        end
        x0 = x1;
    end
end
end
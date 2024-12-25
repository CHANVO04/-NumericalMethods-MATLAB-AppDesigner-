function [x0,n,check] = tieptuyen(fx,a,b,ss)
x0 = 0;
n = 0;
check = 0;
max_iter = 100; % Gi?i h?n s? vòng l?p

% Kh?i t?o symbolic bi?n x
syms x;
                
% Chuy?n chu?i hàm thành bi?u th?c symbolic
fx_sym = str2sym(fx);
fdx_sym = diff(fx_sym, x); % ??o hàm c?p 1
fdxx_sym = diff(fdx_sym, x); % ??o hàm c?p 2
                
% Chuy?n hàm và ??o hàm thành function handle
fx_func = matlabFunction(fx_sym, 'Vars', x);
fdx_func = matlabFunction(fdx_sym, 'Vars', x);
fdxx_func = matlabFunction(fdxx_sym, 'Vars', x);
                
% Ki?m tra n?u f'(x) và f''(x) không ??i d?u trên kho?ng [a, b]
fdx_a = fdx_func(a);
fdx_b = fdx_func(b);
fdxx_a = fdxx_func(a);
fdxx_b = fdxx_func(b);
                
% Ki?m tra ?i?u ki?n ??i d?u cho ??o hàm
if (fdx_a * fdx_b > 0)
    if (fdxx_a * fdxx_b > 0)
        check = 1;
        % Giá tr? kh?i t?o
        x0 = (a + b) / 2; % Giá tr? ban ??u
        
        % C?u trúc l?p Newton-Raphson                
        while n < max_iter        
        % Tính ti?p tuy?n Newton
            x1 = x0 - fx_func(x0) / fdx_func(x0); % C?p nh?t ?úng
            n = n + 1; % T?ng s? l?n l?p
                            
        % Ki?m tra ?i?u ki?n h?i t?
            if abs(fx_func(x1)) < ss
                break;
            end
            % C?p nh?t giá tr? x0
            x0 = x1;
        end
        % Ki?m tra sau vòng l?p n?u không h?i t?
        if n >= max_iter
            check = 2;
        end
    end
end
end
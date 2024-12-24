function [result, check] = Xapxitien(fx, x, Xi,  Yi, h, saiso)
    result = 0;
    %check la bien kiem tra
    %check == 1 : LOI du lieu x va y khong cung do dai
    %check == 2 : LOI chon sai sai so cat cut
    check = 0;
    
    % Kiem tra du lieu
    %Neu dung du lieu xi va yi
    if Xi ~= "" && Yi ~= ""
        xi = str2num(Xi);
        yi = str2num(Yi);
        if length(xi) ~= length(yi)
            check = 1;
            return;
        end
        n = round((x-xi(1))/h + 1);
        % Tính toan theo sai so
        if saiso == 1 % Sai so O(h)
            result = (yi(n + 1) - yi(n))/h; %Dao ham tien sai so O(h)
        elseif saiso == 2 % Sai so O(h²)
            result = (-yi(n + 2) + 4*yi(n + 1) - 3*yi(n))/(2*h); %Dao ham tien sai so O(h²)
        else
            check = 2;
            return;
        end

    % Neu dung ham so
    else
        f = str2func(['@(x)' fx]); % Chuyen thanh ham MATLAB
        % Tinh toan theo sai so
        if saiso == 1 % Sai so O(h)
            result = (f(x + h) - f(x)) / h; %Dao ham tien sai so O(h)
        elseif saiso == 2 % Sai so O(h²)
            result = (-f(x + 2*h) + 4*f(x + h) - 3*f(x)) / (2*h); %Dao ham tien sai so O(h²)
        else
            check = 2;
            return;
        end
    end
end

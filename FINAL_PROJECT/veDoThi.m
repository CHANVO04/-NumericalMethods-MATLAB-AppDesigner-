function veDoThi(app, fx)
    % Hàm ?? v? ?? th? trên giao di?n app
    % app: ??i t??ng c?a ?ng d?ng ch?a UIAxes
    % fx: Hàm s? c?n v?
    
    fxi = str2func(['@(x)',fx]);
    
    % R?i r?c hóa tín hi?u x
    x_t2 = -15:1/1000:15;

    % Tính các giá tr? y theo x
    y_t2 = fxi(x_t2);

    % V? ?? th? trên UIAxes
    plot(app.UIAxes, x_t2, y_t2);
    grid(app.UIAxes, 'on');
end

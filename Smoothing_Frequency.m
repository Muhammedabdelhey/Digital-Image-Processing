fig1=uifigure('name','Smoothing Filters');
label = uilabel(fig1,...
    'Text', 'Smoothing Filters',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Ideal_LowPass_btn = uibutton(fig1,'push',...
    'Text', 'Ideal LowPass',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Ideal_LowPass_btn,event) Ideal_LowPass_btn_fun(Ideal_LowPass_btn));
Ideal_LowPass_btn.FontSize = 14;
Ideal_LowPass_btn.FontWeight='bold';

Butterworth_LowPass_btn = uibutton(fig1,'push',...
    'Text', 'Butterworth LowPass',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Butterworth_LowPass_btn,event) Butterworth_LowPass_btn_fun(Butterworth_LowPass_btn));
Butterworth_LowPass_btn.FontSize = 14;
Butterworth_LowPass_btn.FontWeight='bold';


Gaussian_LowPass_btn=uibutton(fig1,'push',...
    'Text', 'Gaussian LowPass',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Gaussian_LowPass_btn,event) Gaussian_LowPass_btn_fun(Gaussian_LowPass_btn));
Gaussian_LowPass_btn.FontSize = 14;
Gaussian_LowPass_btn.FontWeight='bold';

function Ideal_LowPass_btn_fun(~)
run("Ideal_LowPass.m");
end

function Butterworth_LowPass_btn_fun(~)
run("Butterworth_LowPass");
end

function Gaussian_LowPass_btn_fun(~)
    run("Gaussian_LowPass");
end


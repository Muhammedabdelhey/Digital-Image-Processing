fig1=uifigure('name','Sharpening Filters');
label = uilabel(fig1,...
    'Text', 'Sharpening Filters',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Ideal_HighPass_btn = uibutton(fig1,'push',...
    'Text', 'Ideal HIGH Pass',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Ideal_HighPass_btn,event) Ideal_HighPass_btn_fun(Ideal_HighPass_btn));
Ideal_HighPass_btn.FontSize = 14;
Ideal_HighPass_btn.FontWeight='bold';

Butterworth_HIGHPass_btn = uibutton(fig1,'push',...
    'Text', 'Butterworth HIGH Pass',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Butterworth_HIGHPass_btn,event) Butterworth_HIGHPass_btn_fun(Butterworth_HIGHPass_btn));
Butterworth_HIGHPass_btn.FontSize = 14;
Butterworth_HIGHPass_btn.FontWeight='bold';


Gaussian_HIGHPass_btn=uibutton(fig1,'push',...
    'Text', 'Gaussian HIGH Pass',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Gaussian_HIGHPass_btn,event) Gaussian_HIGHPass_btn_fun(Gaussian_HIGHPass_btn));
Gaussian_HIGHPass_btn.FontSize = 14;
Gaussian_HIGHPass_btn.FontWeight='bold';

function Ideal_HighPass_btn_fun(~)
run("Ideal_HighPass");
end

function Butterworth_HIGHPass_btn_fun(~)
run("Butterworth_HIGHPass");
end

function Gaussian_HIGHPass_btn_fun(~)
    run("Gaussian_HIGHPass");
end


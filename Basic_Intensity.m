fig1=uifigure('name','Basic Intensity Transformation');
label = uilabel(fig1,...
    'Text', 'Basic Intensity Transformation',...
    'Position',[120, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Linear_Function_btn = uibutton(fig1,'push',...
    'Text', 'Linear Function (Image Negative)',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Linear_Function_btn,event) Linear_Function_btn_fun(Linear_Function_btn));
Linear_Function_btn.FontSize = 14;
Linear_Function_btn.FontWeight='bold';

Logarithmic_Function_btn = uibutton(fig1,'push',...
    'Text', 'Logarithmic Function (Log Transform)',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Logarithmic_Function_btn,event) Logarithmic_Function_btn_fun(Logarithmic_Function_btn));
Logarithmic_Function_btn.FontSize = 14;
Logarithmic_Function_btn.FontWeight='bold';


Power_Law_btn=uibutton(fig1,'push',...
    'Text', 'Power Law Function',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Power_Law_btn,event) Power_Law_btn_fun(Power_Law_btn));
Power_Law_btn.FontSize = 14;
Power_Law_btn.FontWeight='bold';

function Linear_Function_btn_fun(~)
run("Image_Negative.m");
end

function Logarithmic_Function_btn_fun(~)
run("Logarithmic_Function.m");
end

function Power_Law_btn_fun(~)
run("Power_Law.m");
end


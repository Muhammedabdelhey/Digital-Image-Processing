fig1=uifigure('name','Intensity (gray level) transformations');
label = uilabel(fig1,...
    'Text', 'Intensity transformations',...
    'Position',[150, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Basic_Intensity_btn = uibutton(fig1,'push',...
    'Text', 'Basic Intensity Transformation',...
    'Position',[150, 230, 300, 50],...
    'ButtonPushedFcn', @(Basic_Intensity_btn,event) Basic_Intensity_btn_fun(Basic_Intensity_btn));
Basic_Intensity_btn.FontSize = 14;
Basic_Intensity_btn.FontWeight='bold';


piecewise_Linear_btn=uibutton(fig1,'push',...
    'Text', 'piecewise Linear transformation functions',...
    'Position',[150, 100, 300, 50],...
    'ButtonPushedFcn', @(piecewise_Linear_btn,event) piecewise_Linear_btn_fun(piecewise_Linear_btn));
piecewise_Linear_btn.FontSize = 14;
piecewise_Linear_btn.FontWeight='bold';


function Basic_Intensity_btn_fun(~)
    run("Basic_Intensity.m");
end

function piecewise_Linear_btn_fun(~)
    run("piecewise_Linear.m");
end


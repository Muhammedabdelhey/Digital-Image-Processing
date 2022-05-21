fig1=uifigure('name','Smoothing Spatial Filters');
label = uilabel(fig1,...
    'Text', 'Smoothing Spatial Filters',...
    'Position',[130,350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


linear_filter_btn = uibutton(fig1,'push',...
    'Text', 'Linear Filter',...
    'Position',[160, 230, 250, 50],...
    'ButtonPushedFcn', @(linear_filter_btn,event) linear_filter_btn_fun(linear_filter_btn));
linear_filter_btn.FontSize = 14;
linear_filter_btn.FontWeight='bold';


Nonlinear_filter_btn=uibutton(fig1,'push',...
    'Text', 'NonLinear Filter',...
    'Position',[160, 100, 250, 50],...
    'ButtonPushedFcn', @(Nonlinear_filter_btn,event) Nonlinear_filter_btn_fun(Nonlinear_filter_btn));
Nonlinear_filter_btn.FontSize = 14;
Nonlinear_filter_btn.FontWeight='bold';


function linear_filter_btn_fun(~)
    run("linear_filters");
end

function Nonlinear_filter_btn_fun(~)
    run("NonLinear_Filter");
end


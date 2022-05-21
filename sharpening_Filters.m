fig1=uifigure('name','sharpening Spatial Filters');
label = uilabel(fig1,...
    'Text', 'sharpening Spatial Filters',...
    'Position',[130,350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


f_derivative_filter_btn = uibutton(fig1,'push',...
    'Text', 'First Derivative Filter',...
    'Position',[160, 230, 250, 50],...
    'ButtonPushedFcn', @(f_derivative_filter_btn,event) f_derivative_filter_btn_fun(f_derivative_filter_btn));
f_derivative_filter_btn.FontSize = 14;
f_derivative_filter_btn.FontWeight='bold';


sec_derivative_filter_btn=uibutton(fig1,'push',...
    'Text', 'second Derivative Filter',...
    'Position',[160, 100, 250, 50],...
    'ButtonPushedFcn', @(sec_derivative_filter_btn,event) sec_derivative_filter_btn_fun(sec_derivative_filter_btn));
sec_derivative_filter_btn.FontSize = 14;
sec_derivative_filter_btn.FontWeight='bold';


function f_derivative_filter_btn_fun(~)
    run("first_derivative.m");
end

function sec_derivative_filter_btn_fun(~)
    run("Sec_Derivative.m");
end
fig1=uifigure('name','neighborhood Processing');
label = uilabel(fig1,...
    'Text', 'neighborhood Processing',...
    'Position',[130,350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


smoothing_filter_btn = uibutton(fig1,'push',...
    'Text', 'Smoothing Spatial Filter',...
    'Position',[160, 230, 250, 50],...
    'ButtonPushedFcn', @(smoothing_filter_btn,event) smoothing_filter_btn_fun(smoothing_filter_btn));
smoothing_filter_btn.FontSize = 14;
smoothing_filter_btn.FontWeight='bold';


Sharpening_Filter_btn=uibutton(fig1,'push',...
    'Text', 'Sharpening Spatial Filter',...
    'Position',[160, 100, 250, 50],...
    'ButtonPushedFcn', @(Sharpening_Filter_btn,event) Sharpening_Filter_btn_fun(Sharpening_Filter_btn));
Sharpening_Filter_btn.FontSize = 14;
Sharpening_Filter_btn.FontWeight='bold';


function smoothing_filter_btn_fun(~)
    run("smoothing_filters");
end

function Sharpening_Filter_btn_fun(~)
    run("sharpening_Filters");
end


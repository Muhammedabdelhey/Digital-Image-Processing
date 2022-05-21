fig1=uifigure('name','Frequency domain');
label = uilabel(fig1,...
    'Text', 'Frequency domain',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Smoothing_Filters_btn = uibutton(fig1,'push',...
    'Text', 'Smoothing Filters (Low Pass Filter)',...
    'Position',[150, 230, 300, 50],...
    'ButtonPushedFcn', @(Smoothing_Filters_btn,event) Smoothing_Filters_btn_fun(Smoothing_Filters_btn));
Smoothing_Filters_btn.FontSize = 14;
Smoothing_Filters_btn.FontWeight='bold';


Sharpening_Filters_btn=uibutton(fig1,'push',...
    'Text', 'Sharpening Filters (High Pass Filter)',...
    'Position',[150, 100, 300, 50],...
    'ButtonPushedFcn', @(Sharpening_Filters_btn,event) Sharpening_Filters_btn_fun(Sharpening_Filters_btn));
Sharpening_Filters_btn.FontSize = 14;
Sharpening_Filters_btn.FontWeight='bold';


function Smoothing_Filters_btn_fun(~)
run("Smoothing_Frequency");
end

function Sharpening_Filters_btn_fun(~)
run("Sharpening_Frequency");
end


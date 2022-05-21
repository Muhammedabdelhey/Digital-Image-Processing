fig1=uifigure('name','Image Resolution');
label = uilabel(fig1,...
    'Text', 'Image Resolution Processing',...
    'Position',[120, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Spatial_resolution_btn = uibutton(fig1,'push',...
    'Text', 'Spatial Resolution',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Spatial_resolution_btn,event) Spatial_resolutionn_btn_fun(Spatial_resolution_btn));
Spatial_resolution_btn.FontSize = 14;
Spatial_resolution_btn.FontWeight='bold';


Gray_Level_Resolution_btn=uibutton(fig1,'push',...
    'Text', 'Gray_Level Resolution',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Gray_Level_Resolution_btn,event) Gray_Level_Resolution_btn_fun(Gray_Level_Resolution_btn));
Gray_Level_Resolution_btn.FontSize = 14;
Gray_Level_Resolution_btn.FontWeight='bold';


function Spatial_resolutionn_btn_fun(~)
run("Spatial_resolution.m")
end

function Gray_Level_Resolution_btn_fun(~)
run("Gray_Level_Resolution.m");
end


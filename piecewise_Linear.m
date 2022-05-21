fig1=uifigure('name','piecewis eLinear');
label = uilabel(fig1,...
    'Text', 'piecewise Linear transformation',...
    'Position',[120, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Contrast_Stretching_btn = uibutton(fig1,'push',...
    'Text', 'Contrast Stretching',...
    'Position',[150, 275, 300, 50],...
    'ButtonPushedFcn', @(Contrast_Stretching_btn,event) Contrast_Stretching_btn_fun(Contrast_Stretching_btn));
Contrast_Stretching_btn.FontSize = 14;
Contrast_Stretching_btn.FontWeight='bold';

Thresholding_btn = uibutton(fig1,'push',...
    'Text', 'Thresholding',...
    'Position',[150, 200, 300, 50],...
    'ButtonPushedFcn', @(Thresholding_btn,event) Thresholding_btn_fun(Thresholding_btn));
Thresholding_btn.FontSize = 14;
Thresholding_btn.FontWeight='bold';


Gray_level_Slicing_btn=uibutton(fig1,'push',...
    'Text', 'Gray level Slicing',...
    'Position',[150, 125, 300, 50],...
    'ButtonPushedFcn', @(Gray_level_Slicing_btn,event) Gray_level_Slicing_btn_fun(Gray_level_Slicing_btn));
Gray_level_Slicing_btn.FontSize = 14;
Gray_level_Slicing_btn.FontWeight='bold';


Bit_plane_slicing_btn=uibutton(fig1,'push',...
    'Text', 'Bit plane slicing',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Bit_plane_slicing_btn,event) Bit_plane_slicing_btn_fun(Bit_plane_slicing_btn));
Bit_plane_slicing_btn.FontSize = 14;
Bit_plane_slicing_btn.FontWeight='bold';

function Contrast_Stretching_btn_fun(~)
    run("Contrast_Stretching.m");
end

function Thresholding_btn_fun(~)
    run("Thresholdingp.m");
end

function Gray_level_Slicing_btn_fun(~)
    run("Gray_level_slicing.m");
end

function Bit_plane_slicing_btn_fun (~)
    run("Bit_plan_slicing.m");
end
fig1=uifigure('name','Point Processing');
label = uilabel(fig1,...
    'Text', 'Point Processing',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Intensity_transformations_btn = uibutton(fig1,'push',...
    'Text', 'Intensity (gray level) transformations',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Intensity_transformations_btn,event) Intensity_transformations_btn_fun(Intensity_transformations_btn));
Intensity_transformations_btn.FontSize = 14;
Intensity_transformations_btn.FontWeight='bold';

Arithmetic_operations_btn = uibutton(fig1,'push',...
    'Text', 'Arithmetic operations',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Arithmetic_operations_btn,event) Arithmetic_operations_btn_fun(Arithmetic_operations_btn));
Arithmetic_operations_btn.FontSize = 14;
Arithmetic_operations_btn.FontWeight='bold';


Histogram_processing_btn=uibutton(fig1,'push',...
    'Text', 'Histogram processing',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Histogram_processing_btn,event) Histogram_processing_btn_fun(Histogram_processing_btn));
Histogram_processing_btn.FontSize = 14;
Histogram_processing_btn.FontWeight='bold';

function Intensity_transformations_btn_fun(~)
run("intensity_transformations.m");
end

function Arithmetic_operations_btn_fun(~)
run("Arithmetic_Operations.m");
end

function Histogram_processing_btn_fun(~)
    run("Histogram_processing");
end


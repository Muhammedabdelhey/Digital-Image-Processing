fig1=uifigure('name','Spatial domain');
label = uilabel(fig1,...
    'Text', 'Spatial domain',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Point_Processing_btn = uibutton(fig1,'push',...
    'Text', 'Point Processing',...
    'Position',[150, 230, 300, 50],...
    'ButtonPushedFcn', @(Point_Processing_btn,event) Point_Processing_btn_fun(Point_Processing_btn));
Point_Processing_btn.FontSize = 14;
Point_Processing_btn.FontWeight='bold';


Neighborhood_processing_btn=uibutton(fig1,'push',...
    'Text', 'Neighborhood Processing',...
    'Position',[150, 100, 300, 50],...
    'ButtonPushedFcn', @(Neighborhood_processing_btn,event) Neighborhood_processing_btn_fun(Neighborhood_processing_btn));
Neighborhood_processing_btn.FontSize = 14;
Neighborhood_processing_btn.FontWeight='bold';


function Point_Processing_btn_fun(~)
run("Point_Processing");
end

function Neighborhood_processing_btn_fun(~)
run("neighborhood_Processing");
end


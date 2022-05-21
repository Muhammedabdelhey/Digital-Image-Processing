fig1=uifigure('name','Digital Image Processing');
label = uilabel(fig1,...
    'Text', 'All Image Processing you need',...
    'Position',[120, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';

Image_Resolution_btn = uibutton(fig1,'push',...
    'Text', 'Image Resolution Processing',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Image_Resolution_btn,event) Image_Resolution_btn_fun(Image_Resolution_btn));
Image_Resolution_btn.FontSize = 14;
Image_Resolution_btn.FontWeight='bold';

Spatial_domain_btn = uibutton(fig1,'push',...
    'Text', 'Spatial domain',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Spatial_domain_btn,event) Spatial_domain_btn_fun(Spatial_domain_btn));
Spatial_domain_btn.FontSize = 14;
Spatial_domain_btn.FontWeight='bold';


Frequency_Domain_btn=uibutton(fig1,'push',...
    'Text', 'Frequency Domain',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Frequency_Domain_btn,event) Frequency_Domain_btn_fun(Frequency_Domain_btn));
Frequency_Domain_btn.FontSize = 14;
Frequency_Domain_btn.FontWeight='bold';

function Image_Resolution_btn_fun(~)
run("Image_Resolution.m");
end

function Spatial_domain_btn_fun(~)
run("Spatial_domain.m");
end

function Frequency_Domain_btn_fun(~)
run('Frequency_Domain');
end


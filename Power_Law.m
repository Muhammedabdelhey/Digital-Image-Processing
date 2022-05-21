global constant;
global power_Value;
fig1=uifigure('name','Power- Law Function');
label = uilabel(fig1,...
    'Text', 'Power- Law Functions',...
    'Position',[170, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';

label = uilabel(fig1,...
    'Text', 'Constant ',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


constant=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
constant.FontSize = 16;
constant.FontWeight='bold';

label2 = uilabel(fig1,...
    'Text', 'Power Value ',...
    'Position',[200, 150,150, 40]);
label2.FontSize = 16;
label2.FontWeight='bold';


power_Value=uieditfield(fig1,'numeric',...
    'Position',[200, 100, 150, 40]);
power_Value.FontSize = 16;
power_Value.FontWeight='bold';

apply_btn = uibutton(fig1,'push',...
    'Text', ' Apply Processing',...
    'Position',[200, 30, 150, 40],...
    'ButtonPushedFcn', @(apply_btn,event) apply_btn_fun(apply_btn));
apply_btn.FontSize = 12;
apply_btn.FontWeight='bold';


function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function apply_btn_fun(~)
global originalImage;
global constant;
global power_Value;
[rows cols matricesNo] = size(originalImage);
c=constant.Value;
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
pow_factor=power_Value.Value;
for metricesIndex=1:1:matricesNo
    newImage(:,:,metricesIndex) = power_fun(im2double(originalImage(:,:,metricesIndex)),c,pow_factor);
end
subplot(1,2,2);
imshow(uint8(newImage));
title("New Image");
originalImage=uint8(newImage);
end

function [outImage] = power_fun(image,c,pow_f)

outImage=c*power(image,pow_f)*256;

end

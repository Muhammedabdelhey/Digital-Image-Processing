 global constant;
fig1=uifigure('name','Logarithmic Function');
label = uilabel(fig1,...
    'Text', 'Logarithmic Function',...
    'Position',[160, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';


label = uilabel(fig1,...
    'Text', 'constant ',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


constant=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
constant.FontSize = 16;
constant.FontWeight='bold';

applylog_btn = uibutton(fig1,'push',...
    'Text', 'Apply Log Transformation',...
    'Position',[50, 100, 220, 40],...
    'ButtonPushedFcn', @(applylog_btn,event)applylog_btn_fun(applylog_btn));
applylog_btn.FontSize = 12;
applylog_btn.FontWeight='bold';




applyinvlog_btn = uibutton(fig1,'push',...
    'Text', 'Apply Inverse Log Transformation',...
    'Position',[300, 100, 220, 40],...
    'ButtonPushedFcn', @(applyinvlog_btn,event)applyinvlog_btn_fun(applyinvlog_btn));
applyinvlog_btn.FontSize = 12;
applyinvlog_btn.FontWeight='bold';



function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end




function applylog_btn_fun(~)
global originalImage;
[rows cols matricesNo] = size(originalImage);
f=figure('Name','Log Function');
subplot(1,2,1);
imshow(originalImage);
title("Original image");
global constant;
c=constant.Value;
for metricesIndex=1:1:matricesNo
    newImage(:,:,metricesIndex) = log_fun(im2double(originalImage(:,:,metricesIndex)),c);
end
subplot(1,2,2);
imshow(uint8(newImage));
title("New Image");
originalImage=uint8(newImage);
end



function applyinvlog_btn_fun(~)
global originalImage;
[rows cols matricesNo] = size(originalImage);
f=figure('Name','Inverse Log Function');
subplot(1,2,1);
imshow(originalImage);
title("Original image");
global constant;
c=constant.Value;
for metricesIndex=1:1:matricesNo
    newImage(:,:,metricesIndex) = inv_log_fun(im2double(originalImage(:,:,metricesIndex)),c);
end
subplot(1,2,2);
imshow(uint8(newImage));
title("New Image");
originalImage=uint8(newImage);
end
function [outImage] = log_fun(image,c)

outImage=c*log(1+image)*256;

end

function [outImage] = inv_log_fun(image,c)

outImage=power(2,c*log(image))*256;

end
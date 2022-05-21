global Val;

fig1=uifigure('name','Addition and Subtraction');
label = uilabel(fig1,...
    'Text', 'Addition and Subtraction  ',...
    'Position',[140, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';

label = uilabel(fig1,...
    'Text', ' Enter an Integer  ',...
    'Position',[200, 250,200, 40]);
label.FontSize = 16;
label.FontWeight='bold';


Val=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
Val.FontSize = 16;
Val.FontWeight='bold';

Addition_btn = uibutton(fig1,'push',...
    'Text', ' Addtion make image lighten',...
    'Position',[75, 100, 200, 40],...
    'ButtonPushedFcn', @(Addition_btn,event) Addition_btn_fun(Addition_btn));
Addition_btn.FontSize = 12;
Addition_btn.FontWeight='bold';


substraction_btn = uibutton(fig1,'push',...
    'Text', ' Subtraction make image dark',...
    'Position',[325 , 100, 200, 40],...
    'ButtonPushedFcn', @(substraction_btn,event) substraction_btn_fun(substraction_btn));
substraction_btn.FontSize = 12;
substraction_btn.FontWeight='bold';

function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end

function Addition_btn_fun(~)
global originalImage;
[rows cols matricesNo] = size(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
global Val;
c=Val.Value;
for metricesIndex=1:1:matricesNo
    newImage(:,:,metricesIndex) = Addition(originalImage(:,:,metricesIndex),c);
end
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end

function substraction_btn_fun(~)
global originalImage;
[rows cols matricesNo] = size(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
global Val;
c=Val.Value;
for metricesIndex=1:1:matricesNo
    newImage(:,:,metricesIndex) = substraction(originalImage(:,:,metricesIndex),c);
end
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end

function [outImage] = Addition(image,c)
outImage=image+c;
end
function [outImage] = substraction(image,c)
outImage=image-c;
end
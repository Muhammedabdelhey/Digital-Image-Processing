
fig1=uifigure('name','Second Derivative');
label = uilabel(fig1,...
    'Text', 'Second Derivative',...
    'Position',[180, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 275, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';




applylaplacian_btn = uibutton(fig1,'push',...
    'Text', 'Apply laplacian',...
    'Position',[50, 150, 220, 40],...
    'ButtonPushedFcn', @(applylaplacian_btn,event)applylaplacian_btn_fun(applylaplacian_btn));
applylaplacian_btn.FontSize = 12;
applylaplacian_btn.FontWeight='bold';




apply_compositelaplacian_btn = uibutton(fig1,'push',...
    'Text', 'Apply composite laplacian',...
    'Position',[300, 150, 220, 40],...
    'ButtonPushedFcn', @(apply_compositelaplacian_btn,event)apply_compositelaplacian_btn_fun(apply_compositelaplacian_btn));
apply_compositelaplacian_btn.FontSize = 12;
apply_compositelaplacian_btn.FontWeight='bold';



function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end




function applylaplacian_btn_fun(~)
global originalImage;
newImage=laplacian(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end

function apply_compositelaplacian_btn_fun(~)
global originalImage;
newImage=compositelaplacian(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end


function[out]=laplacian(originalImage)
gray_image = double(originalImage);
[rows,cols]=size(gray_image);
mask = [0,1,0;1,-4,1;0,1,0];
out = gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*gray_image(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j)= value;
end
end
out = uint8(out);
end 

function[out]=compositelaplacian(originalImage)
gray_image = double(originalImage);
[rows,cols]=size(gray_image);
mask = [0,1,0;1,-5,1;0,1,0];
out = gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*gray_image(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j)= value;
end
end
out = uint8(out);
end




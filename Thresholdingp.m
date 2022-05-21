global s_max;
fig1=uifigure('name','Thresholding');
label = uilabel(fig1,...
    'Text', 'Thresholding',...
    'Position',[200, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


label = uilabel(fig1,...
    'Text', ' Enter Value ',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


s_max=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
s_max.FontSize = 16;
s_max.FontWeight='bold';

Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';


apply_btn = uibutton(fig1,'push',...
    'Text', 'Apply Processing',...
    'Position',[200, 125, 150, 40],...
    'ButtonPushedFcn', @(apply_btn,event)apply_btn_fun(apply_btn));
apply_btn.FontSize = 16;
apply_btn.FontWeight='bold';


function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function apply_btn_fun(~)
global originalImage;
global s_max;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newImage=Thresholding_fun(originalImage,s_max.Value);
subplot(1,2, 2), 
imshow(newImage);
title("Thresholding ")
originalImage=newImage;
end

function [outImage]=Thresholding_fun(image,k)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(image(i,j)>k)
                outImage(i,j)=1;
             else
                 outImage(i,j)=0;
             end
           end
       
       end
end 

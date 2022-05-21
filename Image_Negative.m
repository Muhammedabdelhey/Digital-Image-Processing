fig1=uifigure('name','Image Negative');
label = uilabel(fig1,...
    'Text', 'Image Negative',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 250, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';




apply_btn = uibutton(fig1,'push',...
    'Text', 'Apply Processing',...
    'Position',[200, 125, 150, 40],...
    'ButtonPushedFcn', @(apply_btn,event)apply_btn_fun(apply_btn));
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

figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
L = max(originalImage(:));
newImage=(L-1)-originalImage;
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end
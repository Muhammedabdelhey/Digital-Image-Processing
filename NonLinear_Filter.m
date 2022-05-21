fig1=uifigure('name','NonLinear Filter ');
label = uilabel(fig1,...
    'Text', 'NonLinear Filter ',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 275, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';


Med_Filter_btn = uibutton(fig1,'push',...
    'Text', ' Median Filter',...
    'Position',[35, 100, 150, 40],...
    'ButtonPushedFcn', @(Med_Filter_btn,event) Med_Filter_btn_fun(Med_Filter_btn));
Med_Filter_btn.FontSize = 12;
Med_Filter_btn.FontWeight='bold';


MAX_Filter_btn = uibutton(fig1,'push',...
    'Text', ' MAX Filter',...
    'Position',[210, 100, 150, 40],...
    'ButtonPushedFcn', @(MAX_Filter,event) MAX_Filter_btn_fun(MAX_Filter));
MAX_Filter_btn.FontSize = 12;
MAX_Filter_btn.FontWeight='bold';



MIN_Filter_btn = uibutton(fig1,'push',...
    'Text', ' MIN Filter',...
    'Position',[385, 100, 150, 40],...
    'ButtonPushedFcn', @(MIN_Filter_btn,event) MIN_Filter_btn_fun(MIN_Filter_btn));
MIN_Filter_btn.FontSize = 12;
MIN_Filter_btn.FontWeight='bold';



function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end



function Med_Filter_btn_fun(~)
global originalImage;
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newimage=Med_Filter(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title('originalImage')
subplot(1,2,2);
imshow(newimage);
title('New Image');
originalImage=newimage;
end



function MAX_Filter_btn_fun(~)
global originalImage;
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newimage=Max_Filter(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title('originalImage')
subplot(1,2,2);
imshow(newimage);
title('New Image');
originalImage=newimage;
end



function MIN_Filter_btn_fun(~)
global originalImage;
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newimage=Min_Filter(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title('originalImage')
subplot(1,2,2);
imshow(newimage);
title('New Image');
originalImage=newimage;
end



function[out]= Med_Filter(gray_image)
[rows,cols]=size(gray_image);
out=gray_image;
for i=2:rows-1
    for j=2:cols-1
        temp = [gray_image(i-1, j-1) gray_image(i-1, j) gray_image(i-1, j + 1) gray_image(i, j-1) gray_image(i, j) gray_image(i, j + 1) gray_image(i + 1, j-1) gray_image(i + 1, j) gray_image(i + 1, j + 1)];
        temp = sort(temp);
        out(i, j)= temp(5);
    end
end
end


function[out]= Min_Filter(gray_image)
[rows,cols]=size(gray_image);
out=gray_image;
for i=2:rows-1
    for j=2:cols-1
        temp = [gray_image(i-1, j-1) gray_image(i-1, j) gray_image(i-1, j + 1) gray_image(i, j-1) gray_image(i, j) gray_image(i, j + 1) gray_image(i + 1, j-1) gray_image(i + 1, j) gray_image(i + 1, j + 1)];
        temp = sort(temp);
        out(i, j)= temp(1);
    end
end
end

function[out]= Max_Filter(gray_image)
[rows,cols]=size(gray_image);
out=gray_image;
for i=2:rows-1
    for j=2:cols-1
        temp = [gray_image(i-1, j-1) gray_image(i-1, j) gray_image(i-1, j + 1) gray_image(i, j-1) gray_image(i, j) gray_image(i, j + 1) gray_image(i + 1, j-1) gray_image(i + 1, j) gray_image(i + 1, j + 1)];
        temp = sort(temp);
        out(i, j)= temp(9);
    end
end
end
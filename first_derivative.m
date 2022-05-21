
fig1=uifigure('name','First Derivative');
label = uilabel(fig1,...
    'Text', 'First Derivative',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 275, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';




applysobel_btn = uibutton(fig1,'push',...
    'Text', 'Apply sobel',...
    'Position',[50, 150, 220, 40],...
    'ButtonPushedFcn', @(applysobel_btn,event)applysobel_btn_fun(applysobel_btn));
applysobel_btn.FontSize = 12;
applysobel_btn.FontWeight='bold';




apply_robert_btn = uibutton(fig1,'push',...
    'Text', 'Apply Robert ',...
    'Position',[300, 150, 220, 40],...
    'ButtonPushedFcn', @(apply_robert_btn,event)apply_robert_btn_fun(apply_robert_btn));
apply_robert_btn.FontSize = 12;
apply_robert_btn.FontWeight='bold';



function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end




function applysobel_btn_fun(~)
global originalImage;
newImage=sobel(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end

function apply_robert_btn_fun(~)
global originalImage;
newImage=Robert(originalImage);
figure;
subplot(1,2,1);
imshow(originalImage);
title("Original image");
subplot(1,2,2);
imshow(newImage);
title("New Image");
originalImage=newImage;
end


function[out]=sobel(originalImage)
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = double(originalImage(:, :, 2)); % Take green channel.
end
[rows,cols]=size(originalImage);
mask = [-1,-2,-1;0,0,0;1,2,1];
out = originalImage;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*originalImage(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j)= value;
end
end
out = uint8(out);
end

function[out]=Robert(originalImage)
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = double(originalImage(:, :, 2)); % Take green channel.
end
filtered_image = zeros(size(originalImage));
Mx = [1 0; 0 -1];
My = [0 1; -1 0];
for i = 1:size(originalImage, 1) - 1
    for j = 1:size(originalImage, 2) - 1
  
        % Gradient approximations
        Gx = sum(sum(Mx.*originalImage(i:i+1, j:j+1)));
        Gy = sum(sum(My.*originalImage(i:i+1, j:j+1)));
                 
        % Calculate magnitude of vector
        filtered_image(i, j) = sqrt(Gx.^2 + Gy.^2);
         
    end
end

out = uint8(filtered_image);
end




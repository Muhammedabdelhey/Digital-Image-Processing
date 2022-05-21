global start;
global End;
fig1=uifigure('name','Gray_level_slicing ');
label = uilabel(fig1,...
    'Text', 'Gray level slicing ',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';

label = uilabel(fig1,...
    'Text', ' Enter Start of Range  ',...
    'Position',[200, 250,200, 40]);
label.FontSize = 16;
label.FontWeight='bold';


start=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
start.FontSize = 16;
start.FontWeight='bold';

label2 = uilabel(fig1,...
    'Text', 'Enter End of Range ',...
    'Position',[200, 150,200, 40]);
label2.FontSize = 16;
label2.FontWeight='bold';


End=uieditfield(fig1,'numeric',...
    'Position',[200, 100, 150, 40]);
End.FontSize = 16;
End.FontWeight='bold';

apply_App1_btn = uibutton(fig1,'push',...
    'Text', ' Apply Approach 1',...
    'Position',[75, 30, 150, 40],...
    'ButtonPushedFcn', @(apply_App1_btn,event) apply_App1_btn_fun(apply_App1_btn));
apply_App1_btn.FontSize = 12;
apply_App1_btn.FontWeight='bold';


apply_App2_btn = uibutton(fig1,'push',...
    'Text', ' Apply Approach 2',...
    'Position',[325 , 30, 150, 40],...
    'ButtonPushedFcn', @(apply_App2_btn,event) apply_App2_btn_fun(apply_App2_btn));
apply_App2_btn.FontSize = 12;
apply_App2_btn.FontWeight='bold';

function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function apply_App1_btn_fun(~)
global originalImage;
global start;
global End;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newImage=sclicing_app1(originalImage,start.Value,End.Value);
subplot(1,2, 2), 
imshow(newImage);
title("after ");
originalImage=newImage;
end

function apply_App2_btn_fun(~)
global originalImage;
global start;
global End;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newImage=sclicing_app2(originalImage,start.Value,End.Value);
subplot(1,2, 2), 
imshow(newImage);
title("after ");
originalImage=newImage;
end

function [outImage]=sclicing_app1(image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(image(i,j)>=s&&image(i,j)<=e)
                outImage(i,j)=255;
             else
                 outImage(i,j)=0;
             end
           end
       
       end
end 

function [outImage]=sclicing_app2(image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(image(i,j)>=s&&image(i,j)<=e)
                outImage(i,j)=255;
             else
                 outImage(i,j)=image(i,j);
             end
           end
       
       end
end

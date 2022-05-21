global start;
global End;
fig1=uifigure('name','logic_operations  ');
label = uilabel(fig1,...
    'Text', 'logic operations  ',...
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

And_one_btn = uibutton(fig1,'push',...
    'Text', ' Anding 1',...
    'Position',[50, 30, 100, 40],...
    'ButtonPushedFcn', @(And_one_btn,event) And_One_btn_fun(And_one_btn));
And_one_btn.FontSize = 12;
And_one_btn.FontWeight='bold';


And_zero_btn = uibutton(fig1,'push',...
    'Text', ' Anding 0',...
    'Position',[175 , 30, 100, 40],...
    'ButtonPushedFcn', @(And_zero_btn,event) And_zero_btn_fun(And_zero_btn));
And_zero_btn.FontSize = 12;
And_zero_btn.FontWeight='bold';


OR_one_btn = uibutton(fig1,'push',...
    'Text', ' OR 1',...
    'Position',[300, 30, 100, 40],...
    'ButtonPushedFcn', @(OR_one_btn,event) OR_one_btn_fun(OR_one_btn));
OR_one_btn.FontSize = 12;
OR_one_btn.FontWeight='bold';


OR_zero_btn = uibutton(fig1,'push',...
    'Text', ' OR 0',...
    'Position',[425 , 30, 100, 40],...
    'ButtonPushedFcn', @(OR_zero_btn,event) OR_zero_btn_fun(OR_zero_btn));
OR_zero_btn.FontSize = 12;
OR_zero_btn.FontWeight='bold';

function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function And_One_btn_fun(~)
global originalImage;
global start;
global End;
gray_image=rgb2gray(originalImage);
min_intensity=min(gray_image(:)); %%get r_min
max_intensity=max(gray_image(:)); %%get r_max 
K_value=(max_intensity+min_intensity)/2;
newImage=And_one(Thresholding_fun(gray_image,K_value),gray_image,start.Value,End.Value);
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
subplot(1,2, 2), 
imshow(originalImage);
title("after ");
end

function And_zero_btn_fun(~)
global originalImage;
global start;
global End;
gray_image=rgb2gray(originalImage);
min_intensity=min(gray_image(:)); %%get r_min
max_intensity=max(gray_image(:)); %%get r_max 
K_value=(max_intensity+min_intensity)/2;
newImage=And_zero(Thresholding_fun(gray_image,K_value),gray_image,start.Value,End.Value);
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
subplot(1,2, 2), 
imshow(newImage);
title("after ");
end

function OR_one_btn_fun(~)
global originalImage;
global start;
global End;
gray_image=rgb2gray(originalImage);
min_intensity=min(gray_image(:)); %%get r_min
max_intensity=max(gray_image(:)); %%get r_max 
K_value=(max_intensity+min_intensity)/2;
newImage=OR_one(Thresholding_fun(gray_image,K_value),gray_image,start.Value,End.Value);
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
subplot(1,2, 2), 
imshow(newImage);
title("after ");
end

function OR_zero_btn_fun(~)
global originalImage;
global start;
global End;
gray_image=rgb2gray(originalImage);
min_intensity=min(gray_image(:)); %%get r_min
max_intensity=max(gray_image(:)); %%get r_max 
K_value=(max_intensity+min_intensity)/2;
newImage=OR_zero(Thresholding_fun(gray_image,K_value),gray_image,start.Value,End.Value);
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
subplot(1,2, 2), 
imshow(originalImage);
title("after ");
end

function [outImage]=And_one(image,gray_image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(gray_image(i,j)>=s&&gray_image(i,j)<=e)
                outImage(i,j)=image(i,j)&&1;
             else
                 outImage(i,j)=image(i,j);
             end
           end
       
       end
end

function [outImage]=And_zero(image,gray_image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(gray_image(i,j)>=s&&gray_image(i,j)<=e)
                outImage(i,j)=image(i,j)&&0;
             else
                 outImage(i,j)=image(i,j);
             end
           end
       
       end
end

function [outImage]=OR_one(image,gray_image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(gray_image(i,j)>=s&&gray_image(i,j)<=e)
                outImage(i,j)=image(i,j)||1;
             else
                 outImage(i,j)=image(i,j);
             end
           end
       
       end
end

function [outImage]=OR_zero(image,gray_image,s,e)
    [rows ,cols] = size(image);
       for i=1:rows
           for j=1:cols
             if(gray_image(i,j)>=s&&gray_image(i,j)<=e)
                outImage(i,j)=image(i,j)||0;
             else
                 outImage(i,j)=image(i,j);
             end
           end
       
       end
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
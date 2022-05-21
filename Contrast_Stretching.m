global s_max;
global s_min;
fig1=uifigure('name','Contrast Stretching');
label = uilabel(fig1,...
    'Text', 'Contrast Stretching',...
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
    'Text', ' Enter S_MAX ',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


s_max=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
s_max.FontSize = 16;
s_max.FontWeight='bold';

label2 = uilabel(fig1,...
    'Text', 'Enter S_MIN ',...
    'Position',[200, 150,150, 40]);
label2.FontSize = 16;
label2.FontWeight='bold';


s_min=uieditfield(fig1,'numeric',...
    'Position',[200, 100, 150, 40]);
s_min.FontSize = 16;
s_min.FontWeight='bold';

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
global s_max;
global s_min;
gray_image=rgb2gray(originalImage);
min_intensity=min(gray_image(:)); %%get r_min
max_intensity=max(gray_image(:)); %%get r_max
newImage= Contrast_Stretching_fun(originalImage,s_max.Value,s_min.Value,max_intensity,min_intensity);
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image")
subplot(1,2, 2), 
imshow(uint8(newImage));
title("contrasted Image")
originalImage=uint8(newImage);
end

function[outImage]=Contrast_Stretching_fun(image,s_max,s_min,r_max,r_min)
outImage=((s_max-s_min)/(r_max-r_min))*((image-r_min)+s_min);
end


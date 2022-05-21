fig1=uifigure('name','Subtract Two Image (Motion Tracking)');
label = uilabel(fig1,...
    'Text', 'Subtract Two Image (Motion Tracking)',...
    'Position',[70, 350, 500, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Upload1_btn = uibutton(fig1,'push',...
    'Text', 'Upload backgroud Image',...
    'Position',[200, 275, 200, 40],...
    'ButtonPushedFcn', @(Upload1_btn,event) Upload1_btn_fun(Upload1_btn));
Upload1_btn.FontSize = 16;
Upload1_btn.FontWeight='bold';


Upload2_btn = uibutton(fig1,'push',...
    'Text', 'Upload object Image',...
    'Position',[200, 175, 200, 40],...
    'ButtonPushedFcn', @(Upload2_btn,event) Upload2_btn_fun(Upload2_btn));
Upload2_btn.FontSize = 16;
Upload2_btn.FontWeight='bold';

substraction_btn = uibutton(fig1,'push',...
    'Text', ' Subtract two Image',...
    'Position',[200 , 75, 200, 40],...
    'ButtonPushedFcn', @(substraction_btn,event) substraction_btn_fun(substraction_btn));
substraction_btn.FontSize = 16;
substraction_btn.FontWeight='bold';

function Upload1_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global backgroud_image;
backgroud_image = imread(filename);
end

function Upload2_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global back_with_obj_image;
back_with_obj_image = imread(filename);
end

function substraction_btn_fun(~)
global originalImage
global backgroud_image;
global back_with_obj_image;
figure;
subplot(2,2,1);
imshow(backgroud_image);
title('Background ');
subplot(2,2,2);
imshow(back_with_obj_image);
title('Background and Object');
Object_image=backgroud_image-back_with_obj_image;
subplot(2,2,3);
imshow(Object_image);
title('Object');
originalImage=Object_image;
end
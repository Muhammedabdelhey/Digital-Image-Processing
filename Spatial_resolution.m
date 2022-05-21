global SamplingFactor;
fig1=uifigure('name','Spatial resolution');
label = uilabel(fig1,...
    'Text', 'Spatial resolution',...
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
    'Text', 'Sampling Factor ',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


SamplingFactor=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
SamplingFactor.FontSize = 16;
SamplingFactor.FontWeight='bold';


SubSampling_btn = uibutton(fig1,'push',...
    'Text', 'Sub Sampling',...
    'Position',[200, 125, 150, 40],...
    'ButtonPushedFcn', @(SubSampling_btn,event) SubSampling_btn_fun(SubSampling_btn));
SubSampling_btn.FontSize = 12;
SubSampling_btn.FontWeight='bold';


SamplingUP_btn = uibutton(fig1,'push',...
    'Text', ' Sampling UP',...
    'Position',[200, 50, 150, 40],...
    'ButtonPushedFcn', @(SamplingUP_btn,event) SamplingUP_btn_fun(SamplingUP_btn));
SamplingUP_btn.FontSize = 12;
SamplingUP_btn.FontWeight='bold';


function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function SubSampling_btn_fun(~)
global SamplingFactor;
global originalImage;
[rows, cols, matricesNo] = size(originalImage);
for metricesIndex=1:1:matricesNo
    resizedImage(:,:,metricesIndex) = subSampling(originalImage(:,:,metricesIndex),SamplingFactor.Value);
end
figure;
imshow(originalImage);
title(' Original Image');
figure;
imshow(resizedImage);
title('New Image');
originalImage=resizedImage;
end

function SamplingUP_btn_fun(~)
global SamplingFactor;
global originalImage;
[rows, cols, matricesNo] = size(originalImage);
for metricesIndex=1:1:matricesNo
    resizedImage(:,:,metricesIndex) = upSampling(originalImage(:,:,metricesIndex),SamplingFactor.Value);
end
figure;
imshow(originalImage);
title(' Original Image');
figure;
imshow(resizedImage);
title('New Image');
originalImage=resizedImage;
end

function [outImage] = subSampling(image, subSamplingFactor)
[rows cols] = size(image);
outImage = image(1:subSamplingFactor:rows,1:subSamplingFactor:cols);
end

function [outImage] = upSampling(image, upSamplingFactor)
[rows cols] = size(image);
newRows = rows*upSamplingFactor;
newCols = cols*upSamplingFactor;
rowStart = 1;
for rowsIndex=1:upSamplingFactor:newRows
    colStart = 1;
    for columnIndex=1:upSamplingFactor:newCols
        outImage(rowsIndex:rowsIndex+upSamplingFactor-1,columnIndex:columnIndex+upSamplingFactor-1) = image(rowStart,colStart);
    colStart = colStart + 1;
    end
    rowStart = rowStart + 1;
end
end


% global SamplingFactor;
% fig1=uifigure('name','Spatial resolution');
% label = uilabel(fig1,...
%     'Text', 'Spatial resolution',...
%     'Position',[170, 370, 400, 50]);
% label.FontSize = 24;
% label.FontWeight='bold';
% 
% 
% 
% Upload_btn = uibutton(fig1,'push',...
%     'Text', 'Upload Image',...
%     'Position',[50, 300, 150, 40],...
%     'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
% Upload_btn.FontSize = 16;
% Upload_btn.FontWeight='bold';
% 
% label = uilabel(fig1,...
%     'Text', 'Sampling Factor ',...
%     'Position',[50, 250,150, 40]);
% label.FontSize = 16;
% label.FontWeight='bold';
% 
% 
% SamplingFactor=uieditfield(fig1,'numeric',...
%     'Position',[50, 200, 150, 40]);
% SamplingFactor.FontSize = 16;
% SamplingFactor.FontWeight='bold';
% global im;
% im = uiimage(fig1);
% im.Position=[220,70,300,300];
% SubSampling_btn = uibutton(fig1,'push',...
%     'Text', 'Sub Sampling',...
%     'Position',[50, 125, 150, 40],...
%     'ButtonPushedFcn', @(SubSampling_btn,event) SubSampling_btn_fun(SubSampling_btn));
% SubSampling_btn.FontSize = 12;
% SubSampling_btn.FontWeight='bold';
% 
% 
% SamplingUP_btn = uibutton(fig1,'push',...
%     'Text', ' Sampling UP',...
%     'Position',[50, 50, 150, 40],...
%     'ButtonPushedFcn', @(SamplingUP_btn,event) SamplingUP_btn_fun(SamplingUP_btn));
% SamplingUP_btn.FontSize = 12;
% SamplingUP_btn.FontWeight='bold';
% 
% 
% function Upload_btn_fun(~)
% global im
% [file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
% filename = [path file];
% global originalImage;
% originalImage = imread(filename);
% im.ImageSource=originalImage;
% end
% 
% 
% function SubSampling_btn_fun(~)
% global SamplingFactor;
% global originalImage;
% [rows, cols, matricesNo] = size(originalImage);
% for metricesIndex=1:1:matricesNo
%     resizedImage(:,:,metricesIndex) = subSampling(originalImage(:,:,metricesIndex),SamplingFactor.Value);
% end
% figure;
% imshow(originalImage);
% title(' Original Image');
% figure;
% imshow(resizedImage);
% title('New Image');
% originalImage=resizedImage;
% 
% end
% 
% function SamplingUP_btn_fun(~)
% global SamplingFactor;
% global originalImage;
% [rows, cols, matricesNo] = size(originalImage);
% for metricesIndex=1:1:matricesNo
%     resizedImage(:,:,metricesIndex) = upSampling(originalImage(:,:,metricesIndex),SamplingFactor.Value);
% end
% figure;
% imshow(originalImage);
% title(' Original Image');
% figure;
% imshow(resizedImage);
% title('New Image');
% originalImage=resizedImage;
% end
% 
% function [outImage] = subSampling(image, subSamplingFactor)
% [rows cols] = size(image);
% outImage = image(1:subSamplingFactor:rows,1:subSamplingFactor:cols);
% end
% 
% function [outImage] = upSampling(image, upSamplingFactor)
% [rows cols] = size(image);
% newRows = rows*upSamplingFactor;
% newCols = cols*upSamplingFactor;
% rowStart = 1;
% for rowsIndex=1:upSamplingFactor:newRows
%     colStart = 1;
%     for columnIndex=1:upSamplingFactor:newCols
%         outImage(rowsIndex:rowsIndex+upSamplingFactor-1,columnIndex:columnIndex+upSamplingFactor-1) = image(rowStart,colStart);
%     colStart = colStart + 1;
%     end
%     rowStart = rowStart + 1;
% end
% end
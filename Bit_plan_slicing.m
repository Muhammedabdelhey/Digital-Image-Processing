global start;

fig1=uifigure('name','Bit plan slicing ');
label = uilabel(fig1,...
    'Text', 'Bit plan slicing  ',...
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
    'Text', ' Enter num of Bit  ',...
    'Position',[200, 250,200, 40]);
label.FontSize = 16;
label.FontWeight='bold';


start=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
start.FontSize = 16;
start.FontWeight='bold';

apply_App1_btn = uibutton(fig1,'push',...
    'Text', ' Show only Spicfic bit',...
    'Position',[75, 100, 150, 40],...
    'ButtonPushedFcn', @(apply_App1_btn,event) apply_App1_btn_fun(apply_App1_btn));
apply_App1_btn.FontSize = 12;
apply_App1_btn.FontWeight='bold';


apply_App2_btn = uibutton(fig1,'push',...
    'Text', ' show All Bits',...
    'Position',[325 , 100, 150, 40],...
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
figure;
subplot(1,2, 1),
imshow(originalImage);
title("Original image");
[rows, cols, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end

newImage=zeros(rows,cols);
for r=1:rows
    for c=1:cols
        newImage(r,c)=bitget(originalImage(r,c),start.Value);
    end
end
subplot(1,2,2);
imshow(newImage);
end

function apply_App2_btn_fun(~)
global originalImage;
[rows ,cols, matricesNo] = size(originalImage);
figure;
subplot(2, 5, 1),
imshow(originalImage);
title("Original image");
grayImage=rgb2gray(originalImage);
newImage=zeros(rows,cols,8);
for k=1:8
    for r=1:rows
        for c=1:cols
            newImage(r,c,k)=bitget(grayImage(r,c),k);
        end
    end
    subplot(2,5,k+1);
    imshow(newImage(:,:,k));
end
originalImage=newImage;
end


global m;
global n;
fig1=uifigure('name','Linear Filter ');
label = uilabel(fig1,...
    'Text', 'Linear Filter ',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[325, 225, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';

label = uilabel(fig1,...
    'Text', ' Enter Num of Rows (m)   ',...
    'Position',[50, 275,200, 40]);
label.FontSize = 16;
label.FontWeight='bold';


m=uieditfield(fig1,'numeric',...
    'Position',[50, 225, 150, 40]);
m.FontSize = 16;
m.FontWeight='bold';

label2 = uilabel(fig1,...
    'Text', 'Enter Num of columns(n) ',...
    'Position',[50, 175,200, 40]);
label2.FontSize = 16;
label2.FontWeight='bold';


n=uieditfield(fig1,'numeric',...
    'Position',[50, 125, 150, 40]);
n.FontSize = 16;
n.FontWeight='bold';

Std_AVG_btn = uibutton(fig1,'push',...
    'Text', ' Apply Standred Average',...
    'Position',[50, 50, 175, 40],...
    'ButtonPushedFcn', @(Std_AVG_btn,event) Std_AVG_btn_fun(Std_AVG_btn));
Std_AVG_btn.FontSize = 12;
Std_AVG_btn.FontWeight='bold';


Weighted_AVG_btn = uibutton(fig1,'push',...
    'Text', ' Apply Weighted Average ',...
    'Position',[325 , 50, 175, 40],...
    'ButtonPushedFcn', @(Weighted_AVG_btn,event) Weighted_AVG_btn_fun(Weighted_AVG_btn));
Weighted_AVG_btn.FontSize = 12;
Weighted_AVG_btn.FontWeight='bold';

function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end


function Std_AVG_btn_fun(~)
global originalImage;
global m;
global n;
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newimage=stdavg_filter(double(originalImage),m.Value,n.Value);
figure
subplot(1,2,1);
imshow(uint8(originalImage));
title('originalImage')
subplot(1,2,2);
imshow(uint8(newimage));
title('New Image');
originalImage=uint8(newimage);
end

function Weighted_AVG_btn_fun(~)
global originalImage;
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
newimage=Weighted_avg_filter(double(originalImage));
figure
subplot(1,2,1);
imshow(uint8(originalImage));
title('originalImage')
subplot(1,2,2);
imshow(uint8(newimage));
title('New Image');
originalImage=uint8(newimage);
end

 
function[outimage]=stdavg_filter(image,m,n)

 [rows,cols]=size(image);
 filter_coefficient=1/(m*n);
 filter=zeros(m,n);
 for i=1:m
     for j=1:n
        filter(i,j)=filter_coefficient;
     end 
 end
    a=(m-1)/2;
    b=(n-1)/2;
    outimage=image;
    for i=a+1:rows-a
     for j=b+1:cols-b
      current_pixel_with_neighbour=image(i-a:i+a,j-b:j+b);
      new_pixel_with_neighbour= current_pixel_with_neighbour.*filter;
      newpixel=sum(new_pixel_with_neighbour(:),'double');
      outimage(i,j)=newpixel;
     end 
    end
end

function[outimage]=Weighted_avg_filter(image)
 [rows,cols]=size(image);
 filter=[1/16,2/16,1/16;2/16,4/16,2/16;1/16,2/16,1/16];
    a=(3-1)/2;
    b=(3-1)/2;
    outimage=image;
    for i=a+1:rows-a
     for j=b+1:cols-b
      current_pixel_with_neighbour=image(i-a:i+a,j-b:j+b);
      new_pixel_with_neighbour= current_pixel_with_neighbour.*filter;
      newpixel=sum(new_pixel_with_neighbour(:),'double');
      outimage(i,j)=newpixel;
     end 
    end
end

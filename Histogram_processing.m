fig1=uifigure('name','Histogram processing');
label = uilabel(fig1,...
    'Text', 'Histogram processing',...
    'Position',[200, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';


Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[150, 250, 300, 50],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 14;
Upload_btn.FontWeight='bold';

Draw_Histogram_btn = uibutton(fig1,'push',...
    'Text', 'Draw Image Histogram',...
    'Position',[150, 150, 300, 50],...
    'ButtonPushedFcn', @(Draw_Histogram_btn,event) Draw_Histogram_btn_fun(Draw_Histogram_btn));
Draw_Histogram_btn.FontSize = 14;
Draw_Histogram_btn.FontWeight='bold';


Histogram_Equalization_btn=uibutton(fig1,'push',...
    'Text', 'Apply Histogram Equalization',...
    'Position',[150, 50, 300, 50],...
    'ButtonPushedFcn', @(Histogram_Equalization_btn,event) Histogram_Equalization_btn_fun(Histogram_Equalization_btn));
Histogram_Equalization_btn.FontSize = 14;
Histogram_Equalization_btn.FontWeight='bold';

function Upload_btn_fun(~)
[file, path, ~] = uigetfile('D:\medcialinofrmatics\matlapprojects\project');
filename = [path file];
global originalImage;
originalImage = imread(filename);
end

function Draw_Histogram_btn_fun(~)
global originalImage;
 [rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
subplot(1, 2, 1),
% displaying the image
imshow(originalImage);
title("Original image");

[rows,cols]=size(originalImage);
counts=zeros(1,256);
for i=1:rows
 for j=1:cols
    grayLevel=originalImage(i,j);
    counts(grayLevel+1)=counts(grayLevel+1)+1;
end
end
% Plot the histogram.
subplot(1, 2, 2),
grayLevels = 0 : 255;
bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 20);
ylabel('Pixel Count', 'FontSize', 20);
title('Histogram', 'FontSize', 20);
grid on;
end

function Histogram_Equalization_btn_fun(~)
global originalImage;
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  originalImage = originalImage(:, :, 2); % Take green channel.
end
numofpixels=size(originalImage,1)*size(originalImage,2);
subplot(1, 2, 1),
imshow(originalImage);
title("Original image");

HIm=uint8(zeros(size(originalImage,1),size(originalImage,2)));

freq=zeros(256,1);

probc=zeros(256,1);

output=zeros(256,1);


%freq counts the occurrence of each pixel value.

%The probability of each occurrence is calculated by probf.


for i=1:size(originalImage,1)

    for j=1:size(originalImage,2)

        value=originalImage(i,j);

        freq(value+1)=freq(value+1)+1;

    end

end


sum=0;
no_bins=255;
% The cumulative distribution probability is calculated. 

for i=1:size(freq)

   sum=sum+freq(i);

   probc(i)=sum/numofpixels;

   output(i)=round(probc(i)*no_bins);

end

for i=1:size(originalImage,1)

    for j=1:size(originalImage,2)

            HIm(i,j)=output(originalImage(i,j)+1);

    end
end
subplot(1, 2, 2),
imshow(HIm);
originalImage=HIm;
title('Histogram equalization');
end


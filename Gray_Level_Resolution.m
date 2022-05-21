global num_of_bits;
fig1=uifigure('name','Gray_Level Resolution');
label = uilabel(fig1,...
    'Text', 'Gray_Level Resolution',...
    'Position',[160, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 300, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';


label = uilabel(fig1,...
    'Text', 'Number of Bits(K)',...
    'Position',[200, 250,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


num_of_bits=uieditfield(fig1,'numeric',...
    'Position',[200, 200, 150, 40]);
num_of_bits.FontSize = 16;
num_of_bits.FontWeight='bold';

apply_btn = uibutton(fig1,'push',...
    'Text', 'Apply Processing',...
    'Position',[200, 125, 150, 40],...
    'ButtonPushedFcn', @(apply_btn,event)apply_btn_fun(apply_btn));
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
gray_img=rgb2gray(originalImage);
global num_of_bits;
k = num_of_bits.Value;
    target_levels = 2^k;
    target_compr_factor = 256 / target_levels;
    reduced_image = uint8(floor(double(gray_img)/256 * target_levels) * target_compr_factor);
    figure;
    subplot(1, 2, 1);
    imshow(originalImage);
    title(' Original Image');
    subplot(1, 2, 2);
    imshow(reduced_image, [0 255]);
    title(['L =',num2str(power(2,k))]);
    originalImage=reduced_image;
end
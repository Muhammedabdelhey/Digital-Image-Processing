global radius;
fig1=uifigure('name','Ideal HIGH Pass');
label = uilabel(fig1,...
    'Text', 'Ideal HIGH Pass',...
    'Position',[190, 370, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



Upload_btn = uibutton(fig1,'push',...
    'Text', 'Upload Image',...
    'Position',[200, 270, 150, 40],...
    'ButtonPushedFcn', @(Upload_btn,event) Upload_btn_fun(Upload_btn));
Upload_btn.FontSize = 16;
Upload_btn.FontWeight='bold';


label = uilabel(fig1,...
    'Text', 'radius',...
    'Position',[200, 210,150, 40]);
label.FontSize = 16;
label.FontWeight='bold';


radius=uieditfield(fig1,'numeric',...
    'Position',[200, 170, 150, 40]);
radius.FontSize = 16;
radius.FontWeight='bold';

apply_btn = uibutton(fig1,'push',...
    'Text', 'Apply Processing',...
    'Position',[200, 70, 150, 40],...
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
global radius;
radius.Value;
% originalImage=uint8(IHPF(originalImage,radius.Value));
end

function[output_image]= IHPF(input_image,r)
[M, N] = size(input_image);
FT_img = fft2(double(input_image));
D0 = r; 

% Designing filter
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;

% MATLAB library function meshgrid(v, u) returns
% 2D grid which contains the coordinates of vectors
% v and u. Matrix V with each row is a copy 
% of v, and matrix U with each column is a copy of u
[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);
  
% Comparing with the cut-off frequency and 
% determining the filtering mask
H = double(D >= D0);
  
% Convolution between the Fourier Transformed
% image and the mask
G = H.*FT_img;
  
% Getting the resultant image by Inverse Fourier Transform
% of the convoluted image using MATLAB library function 
% ifft2 (2D inverse fast fourier transform)  
output_image = real(ifft2(double(G)));
% Displaying Input Image and Output Image
subplot(2, 1, 1), imshow(input_image),
subplot(2, 1, 2), imshow(output_image, [ ]);
end
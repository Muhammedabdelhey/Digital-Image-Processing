fig1=uifigure('name','Arithmetic Operations');
label = uilabel(fig1,...
    'Text', 'Arithmetic Operations',...
    'Position',[170, 350, 400, 50]);
label.FontSize = 24;
label.FontWeight='bold';



add_substarct_btn = uibutton(fig1,'push',...
    'Text', 'Addition and Subtraction',...
    'Position',[150, 270, 300, 50],...
    'ButtonPushedFcn', @(add_substarct_btn,event) add_substarct_btn_fun(add_substarct_btn));
add_substarct_btn.FontSize = 14;
add_substarct_btn.FontWeight='bold';


Subtract_Two_Image_btn=uibutton(fig1,'push',...
    'Text', 'Subtract Two Image (Motion Tracking)',...
    'Position',[150, 170, 300, 50],...
    'ButtonPushedFcn', @(Subtract_Two_Image_btn,event) Subtract_Two_Image_btn_fun(Subtract_Two_Image_btn));
Subtract_Two_Image_btn.FontSize = 14;
Subtract_Two_Image_btn.FontWeight='bold';


logic_operations_btn=uibutton(fig1,'push',...
    'Text', 'Logic Operations',...
    'Position',[150, 70, 300, 50],...
    'ButtonPushedFcn', @(logic_operations_btn,event) logic_operations_btn_fun(logic_operations_btn));
logic_operations_btn.FontSize = 14;
logic_operations_btn.FontWeight='bold';


function add_substarct_btn_fun(~)
run("Addition_Subtraction.m");
end

function Subtract_Two_Image_btn_fun(~)
    run("Subtract_Two_Image");
end

function logic_operations_btn_fun(~)
    run("logic_operation");
end

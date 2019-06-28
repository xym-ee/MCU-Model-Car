clc;
clear;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%单片机串口接收到的数据处理
image = textread('1.txt','%c');
image_data_length = size(image);

frame_size = 56*94/8;

%创建一个空的图片
Use_Image(56,94,3) = uint8(0);

%dec2hex(image(1))    dec2hex(abs(a(1)))
ImageByteCount = 1;


%图片头判断   帧头 0x55 0x55
if hex2dec('55') == image(ImageByteCount) && hex2dec('55') == image(ImageByteCount+1)
    ImageByteCount = ImageByteCount + 2; %跳过帧头
    
    for high = 0:6
        for j = 1:94        %列数增加
            for i = 1:8         %转换一个字节
                PixleTemp = bitget(abs(image(ImageByteCount)),i) * 255;
                Use_Image(i+high*8,j,:) = [PixleTemp, PixleTemp, PixleTemp];
            end
            ImageByteCount = ImageByteCount + 1;
        end
    end

end

imshow(Use_Image)
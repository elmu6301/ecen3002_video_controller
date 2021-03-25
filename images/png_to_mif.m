clc
clear all 
close all

I = imread('rainbow_pattern.png');

%imshow(I)

fid = fopen('C:\Users\elena\Documents\quartus_workspace\em_project\src\rom_data.mif','wt');
%fid = fopen('image.mif','wt');

fprintf(fid,"%s\n", "% DEPTH and WIDTH are decimal values %");
fprintf(fid,"%s\n", "% RADIX values can be BIN, DEC, or HEX %");
fprintf(fid,"%s\n", "% Address : Data %");
fprintf(fid,"%s\n", "% [A0..Ax] : D , address range 0 to x contain value D (each address gets this value %;");
fprintf(fid,"%s\n", "% [A0..Ax] : D0 D1 , A0 gets D0, A1 gets D1, A2 gets D0, etc %");
fprintf(fid,"%s\n\n", "% A : D0 D1 D2 , address A gets D0, address+1 gets D1, etc %");
fprintf(fid,"%s\n\n", "DEPTH = 57600;");
fprintf(fid,"%s\n\n", "WIDTH = 24;");
fprintf(fid,"%s\n\n", "ADDRESS_RADIX = DEC;");
fprintf(fid,"%s\n\n", "DATA_RADIX = HEX;");
fprintf(fid,"%s\n\n", "CONTENT");

fprintf(fid,"%s\n\n", "BEGIN");
fprintf(fid,"%s\n\n", "% Red, Green, Blue %");
v_pix = 179; 
h_pix = 319; 

for y = 0:v_pix %vertical pixels
    for x = 0:h_pix %horizontal pixels
        fprintf(fid, "%d : ", x + 320*y);
        fprintf(fid, "%s", dec2hex(I(y + 1, x + 1, 1), 2));
        fprintf(fid, "%s", dec2hex(I(y + 1, x + 1, 2), 2));
        fprintf(fid, "%s", dec2hex(I(y + 1, x + 1, 3), 2));
        fprintf(fid, ";\n");
    end
    fprintf(fid, "\n");
end

fprintf(fid,"%s", "END;");

fclose(fid);
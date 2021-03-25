clc
clear all 
close all

% Variables for 2x2
% max_h_pix = 639; 
% max_v_pix = 359; 
% num_bytes = 1; 
% depth = 230400; 
% width = 12; 

% Variables for 4x4
max_h_pix = 319; 
max_v_pix = 179; 
num_bytes = 2;  
depth = 57600; 
width = 24; 
I = imread('rainbow_pattern_640.png');

%imshow(I)

fid = fopen('C:\Users\elena\Documents\quartus_workspace\em_project\src\rom_data.mif','wt');

fprintf(fid,"%s\n", "% DEPTH and WIDTH are decimal values %");
fprintf(fid,"%s\n", "% RADIX values can be BIN, DEC, or HEX %");
fprintf(fid,"%s\n", "% Address : Data %");
fprintf(fid,"%s\n", "% [A0..Ax] : D , address range 0 to x contain value D (each address gets this value %;");
fprintf(fid,"%s\n", "% [A0..Ax] : D0 D1 , A0 gets D0, A1 gets D1, A2 gets D0, etc %");
fprintf(fid,"%s\n\n", "% A : D0 D1 D2 , address A gets D0, address+1 gets D1, etc %");
fprintf(fid, 'DEPTH=%d;\n', depth);
fprintf(fid, 'WIDTH=%d;\n', width);
fprintf(fid,"%s\n\n", "ADDRESS_RADIX = DEC;");
fprintf(fid,"%s\n\n", "DATA_RADIX = HEX;");
fprintf(fid,"%s\n\n", "CONTENT");

fprintf(fid,"%s\n\n", "BEGIN");
fprintf(fid,"%s\n\n", "% Red, Green, Blue %");


 

for y = 0:max_v_pix %vertical pixels
    for x = 0:max_h_pix %horizontal pixels
        fprintf(fid, "%d : ", x + (max_h_pix+1)*y); 
        r = extractBetween(num2str(dec2hex(I(y + 1, x + 1, 1), 2)),1,num_bytes);
        g = extractBetween(num2str(dec2hex(I(y + 1, x + 1, 2), 2)),1,num_bytes);
        b = extractBetween(num2str(dec2hex(I(y + 1, x + 1, 3), 2)),1,num_bytes);
        rgb = strcat(r,g,b,";\n"); 
        fprintf(fid, rgb);
    end
    fprintf(fid, "\n");
end

fprintf(fid,"%s", "END;");

fclose(fid);
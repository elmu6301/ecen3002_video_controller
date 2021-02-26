/*
    ECEN 3002
    Video Project: Parameter Definitions
    Elena Murray

*/
// `define highres
// `ifdef highres 
//     parameter DIV1 = 3;
// `else
//     parameter DIV1 = 10;
// `endif

//=======================================================
// TOP/All Module Parameters
//=======================================================

`ifdef highres 
    parameter PIXEL_CTR_W = 11;
    parameter LINE_CTR_W = 11;
`else
    parameter PIXEL_CTR_W = 11;
    parameter LINE_CTR_W = 11;
`endif
//=======================================================
// VTC Parameters
//=======================================================

`ifdef highres //1080 Resolution

//Horizontal 
parameter H_F_PORCH = 1279;
parameter H_S_PULSE = 1389;
parameter H_B_PORCH = 1429;
parameter H_MIN_PIXEL = 0;
parameter H_MAX_PIXEL = 1649;

parameter MIN_PIXEL = 0;
parameter MIN_LINE = 0;
// parameter MAX_PIXEL = H_F_PORCH;
// parameter MAX_LINE = V_F_PORCH;

//Vertical
parameter V_F_PORCH = 719;
parameter V_S_PULSE = 724;
parameter V_B_PORCH = 729;
parameter V_MIN_LINE = 0;
parameter V_MAX_LINE = 750;

`else //Defualt to 720 p resoluiton
//Horizontal 
parameter H_F_PORCH = 1279;
parameter H_S_PULSE = 1389;
parameter H_B_PORCH = 1429;
parameter H_MIN_PIXEL = 0;
parameter H_MAX_PIXEL = 1649;

parameter MIN_PIXEL = 0;
parameter MIN_LINE = 0;
// parameter MAX_PIXEL = H_F_PORCH;
// parameter MAX_LINE = V_F_PORCH;

//Vertical
parameter V_F_PORCH = 719;
parameter V_S_PULSE = 724;
parameter V_B_PORCH = 729;
parameter V_MIN_LINE = 0;
parameter V_MAX_LINE = 750;

`endif

parameter MAX_PIXEL = 1279;
parameter MAX_LINE = 719;


//=======================================================
// Phase 2 PIXEL GEN Parameters
//=======================================================

parameter BAR_W = 80;
parameter BARS = 16;


//=======================================================
// Color Parameters
//=======================================================

parameter OFF_COLOR = 24'h00_00_00;
parameter MIN_RGB = 0;
parameter MAX_RGB = 255;

parameter WHITE = 24'hFF_FF_FF; //0
parameter RED = 24'hFF_00_00;   //1
parameter ORANGE = 24'hFF_80_00;//2
parameter YELLOW = 24'hFF_FF_00;//3
parameter GREEN_Y = 24'h80_FF_00; //4
parameter GREEN = 24'h00_FF_00; //5
parameter GREEN_B = 24'h00_FF_80; //6
parameter TEAL = 24'h00_FF_FF; //7
parameter BLUE_G = 24'h00_80_FF; //8
parameter BLUE = 24'h00_00_FF; //9
parameter VIOLET = 24'h80_00_FF; //10
parameter PINK = 24'hFF_00_FF; //11
parameter FUSHIA = 24'hFF_00_80; //12
parameter DARK_GREY = 24'hE0_E0_E0; //13
parameter LIGHT_GREY = 24'h80_80_90; //14
parameter BLACK = 24'h00_00_00; //15

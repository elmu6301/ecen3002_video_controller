/*
    ECEN 3002
    Video Project: Parameter Definitions
    Elena Murray

*/
//Active definitions
// `define highres
 `define pixel2x2

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

/*---- 1080p Resolution ----*/
`ifdef highres 

//Horizontal 
parameter H_F_PORCH = 1919;
parameter H_S_PULSE = 2007;
parameter H_B_PORCH = 2051;
parameter H_MIN_PIXEL = 0;
parameter H_MAX_PIXEL = 2199;

//Vertical
parameter V_F_PORCH = 1079;
parameter V_S_PULSE = 1083;
parameter V_B_PORCH = 1088;
parameter V_MIN_LINE = 0;
parameter V_MAX_LINE = 1125;

/*---- Default 720p Resolution ----*/
`else 

//Horizontal 
parameter H_F_PORCH = 1279;
parameter H_S_PULSE = 1389;
parameter H_B_PORCH = 1429;
parameter H_MIN_PIXEL = 0;
parameter H_MAX_PIXEL = 1649;

//Vertical
parameter V_F_PORCH = 719;
parameter V_S_PULSE = 724;
parameter V_B_PORCH = 729;
parameter V_MIN_LINE = 0;
parameter V_MAX_LINE = 750;

`endif

/*---- Shared Parameters ----*/
parameter MIN_PIXEL = 0;
parameter MIN_LINE = 0;
parameter MAX_PIXEL = 1279;
parameter MAX_LINE = 750;


//=======================================================
// Phase 4B PIXEL GEN Parameters
//=======================================================
`ifdef pixel2x2
/*---- 2x2 Resolution ----*/
parameter PIXEL_BITS = 17; 
parameter PIXELS_PER_LINE = 640; 
parameter CTR_LOWEST_BIT = 1;
parameter ROM_DATA_SIZE = 11; 

`else 
/*---- Default 4x4 Resolution ----*/
parameter PIXEL_BITS = 15; 
parameter PIXELS_PER_LINE = 320; 
parameter CTR_LOWEST_BIT = 2;
parameter ROM_DATA_SIZE = 23; 

`endif
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
parameter INDIGO = 24'h50_00_FF; //10
parameter VIOLET = 24'h90_00_FF; //10
parameter PINK = 24'hFF_00_FF; //11
parameter FUSHIA = 24'hFF_00_80; //12
parameter LIGHT_GREY = 24'hE0_E0_E0; //13
parameter DARK_GREY = 24'h80_80_90; //14
parameter BLACK = 24'h00_00_00; //15

/*
    ECEN 3002
    Video Project: Parameter Definitions
    Elena Murray

*/

// `ifdef simulation 
//     parameter DIV1 = 3;
// `else
//     parameter DIV1 = 10;
// `endif

//=======================================================
// TOP/All Module Parameters
//=======================================================
parameter PIXEL_CTR_W = 11;
parameter LINE_CTR_W = 11;

//=======================================================
// VTC Parameters
//=======================================================

//Horizontal 
parameter H_F_PORCH = 1279;
parameter H_S_PULSE = 1389;
parameter H_B_PORCH = 1429;
parameter H_MAX_PIXEL = 1649;

//Vertical
parameter V_F_PORCH = 719;
parameter V_S_PULSE = 724;
parameter V_B_PORCH = 729;
parameter V_MAX_LINE = 750;



//=======================================================
// PIXEL GEN Parameters
//=======================================================

parameter BAR_W = 80;
parameter BARS = 16;

//Pixel 
parameter MIN_RGB = 0;
parameter MAX_RGB = 255;
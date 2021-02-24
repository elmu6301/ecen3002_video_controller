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
parameter H_MIN_PIXEL = 0;
parameter H_MAX_PIXEL = 1649;

parameter MIN_PIXEL = 0;
parameter MIN_LINE = 0;
parameter MAX_PIXEL = H_F_PORCH;
parameter MAX_LINE = V_F_PORCH;

//Vertical
parameter V_F_PORCH = 719;
parameter V_S_PULSE = 724;
parameter V_B_PORCH = 729;
parameter V_MIN_LINE = 0;
parameter V_MAX_LINE = 750;

//=======================================================
// Phase 2 PIXEL GEN Parameters
//=======================================================

//Box 1 Defualt Position
parameter B1_L_EDGE = 500;
parameter B1_WIDTH = 50;
parameter B1_R_EDGE = B1_L_EDGE + B1_WIDTH;
parameter B1_T_EDGE = 300;
parameter B1_HEIGHT = 50;
parameter B1_B_EDGE = B1_T_EDGE + B1_HEIGHT;

//Box 1 Colors
parameter B1_DEF_COLOR = 24'h0D_EA_D0;
parameter B1_ALT_COLOR = 24'h00_80_FF; 

//Box 2 Defualt Position
parameter B2_L_EDGE = 700;
parameter B2_WIDTH = 50;
parameter B2_R_EDGE = B2_L_EDGE + B2_WIDTH;
parameter B2_T_EDGE = 200;
parameter B2_HEIGHT = 50;
parameter B2_B_EDGE = B2_T_EDGE + B2_HEIGHT;

//Box 2 Colors
parameter B2_DEF_COLOR = 24'hB2_66_FF;
parameter B2_ALT_COLOR = 24'hCC_99_FF; 

//Overlap Color
parameter OVERLAP_COLOR = 24'hFF_FF_FF;


//Position increments
parameter DEF_MOV = 2;
parameter FAST_MOV = 5;

//=======================================================
// Color Parameters
//=======================================================

parameter OFF_COLOR = 24'h00_00_00;
parameter MIN_RGB = 0;
parameter MAX_RGB = 255;
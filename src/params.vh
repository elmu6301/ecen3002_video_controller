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
// Phase 2 PIXEL GEN Parameters
//=======================================================

//Box 1 Defualt Position
parameter B1_L_EDGE = 100;
parameter B1_WIDTH = 50;
parameter B1_R_EDGE = B1_L_EDGE + B1_WIDTH;
parameter B1_T_EDGE = 100;
parameter B1_HEIGHT = 50;
parameter B1_B_EDGE = B1_T_EDGE + B1_HEIGHT;




parameter B1_DEF_COLOR = 24'h0D_EA_D0;
parameter B2_ALT_COLOR = 24'hFF_20_20; 

//=======================================================
// Color Parameters
//=======================================================

parameter OFF_COLOR = 24'h00_00_00;
parameter MIN_RGB = 0;
parameter MAX_RGB = 255;
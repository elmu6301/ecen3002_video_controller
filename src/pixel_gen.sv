/*
    ECEN 3002
    Video Project: Pixel Generator Module
    Elena Murray

*/

module pixel_gen(
    input rfr_clk, 
    input reset_n,
    input video_on, 
    input [11:0] pixel_cnt, 
    input [11:0] line_cnt, 
    input h_sync, 
    input v_sync,

    //Phase 2 Inputs
    input move_box1,
    input dColor_box1, 
    input move_box2,
    input dColor_box2, 
    input [4:0] move_dir,
    input speed, 

    output [7:0] p_red, 
    output [7:0] p_green, 
    output [7:0] p_blue 
    
); 
`include "params.vh"

//=======================================================
//  REG/WIRE declarations
//=======================================================

//Color Declarations
logic [7:0] red, green, blue;
logic [23:0] color_hex;  
logic move_up, move_down, move_left, move_right; 

//Box 1 Declarations
logic in_box1; 
logic [PIXEL_CTR_W:0] b1_l_edge, b1_r_edge; 
logic [LINE_CTR_W:0] b1_t_edge, b1_b_edge;

//Box 2 Declarations
logic in_box2; 
logic [PIXEL_CTR_W:0] b2_l_edge, b2_r_edge; 
logic [LINE_CTR_W:0] b2_t_edge, b2_b_edge;

//Speed Declaration
logic [3:0] move_by; 
//=======================================================
//  Assignments
//=======================================================

//Assign RGB outputs only when the video is on
assign p_red = red & {8{video_on}}; 
assign p_green = green  & {8{video_on}}; 
assign p_blue = blue & {8{video_on}}; 

//Break out the hex color code into RGB values
assign red = color_hex[23:16]; 
assign green = color_hex[15:8] ; 
assign blue = color_hex[7:0]; 

assign in_box1 = (b1_l_edge <= pixel_cnt && pixel_cnt <= b1_r_edge) &&
                  ( b1_t_edge <= line_cnt && line_cnt <= b1_b_edge); 

assign in_box2 = (b2_l_edge <= pixel_cnt && pixel_cnt <= b2_r_edge) &&
                  ( b2_t_edge <= line_cnt && line_cnt <= b2_b_edge); 

//Movement assignmentes
assign move_left = move_dir[3];
assign move_right = move_dir[0];  
assign move_up = move_dir[1]; 
assign move_down = move_dir[2]; 

//Speed Assignment 
assign move_by = (DEF_MOV & {4{~speed}}) | (FAST_MOV & {4{speed}}) ; 

//=======================================================
//  Structural coding
//=======================================================
/*
    Drawing the boxes
*/

//Trigger on the positive edge of the clock and the reset 
always_ff @ (posedge rfr_clk, negedge reset_n) 
	begin 
		//Reset logic
		if(reset_n == 1'b0) begin  
            color_hex <= OFF_COLOR;
            
        end else begin
            
            if(in_box1 == 1 && in_box2 == 1) begin
                //Draw box overlap
                color_hex <= OVERLAP_COLOR; 
            end else if(in_box1 == 1 && dColor_box1 == 1) begin 
                //Draw box 1 with alternative color
                color_hex <= B1_ALT_COLOR; 
            end else if(in_box1 == 1) begin
                //Draw box 1 with default color
                color_hex <= B1_DEF_COLOR; 
            end else if(in_box2 == 1 && dColor_box2 == 1) begin
                //Draw box 2 with alternative color
                color_hex <= B2_ALT_COLOR; 
            end else if(in_box2 == 1) begin //Draw box 2 with default color
                color_hex <= B2_DEF_COLOR; 
            end else begin
                color_hex <= OFF_COLOR; 
            end
        end
      
    end

/*
    Update the positiont
*/
//Trigger on the positive edge of the vertical sync pulse and the reset 
always_ff @ (posedge v_sync, negedge reset_n) begin
    if(reset_n == 1'b0) begin  
        //Reset box 1 to the default location
        b1_l_edge <= B1_L_EDGE; 
        b1_r_edge <= B1_R_EDGE; 
        b1_t_edge <= B1_T_EDGE;
        b1_b_edge <= B1_B_EDGE;

        b2_l_edge <= B2_L_EDGE; 
        b2_r_edge <= B2_R_EDGE; 
        b2_t_edge <= B2_T_EDGE;
        b2_b_edge <= B2_B_EDGE;

    end else begin
        //Box 1 Movements
        if(move_box1 && move_right == 1 && (b1_r_edge + move_by) < MAX_PIXEL) begin
            b1_l_edge <= b1_l_edge + move_by; 
            b1_r_edge <= b1_r_edge + move_by; 
            b1_t_edge <= b1_t_edge;
            b1_b_edge <= b1_b_edge;
        end else if(move_box1 && move_left == 1 && MIN_PIXEL < (b1_l_edge - move_by)) begin
            b1_l_edge <= b1_l_edge - move_by; 
            b1_r_edge <= b1_r_edge - move_by; 
            b1_t_edge <= b1_t_edge;
            b1_b_edge <= b1_b_edge;
        end else if(move_box1 && move_down == 1 && (b1_b_edge + move_by) < MAX_LINE) begin
            b1_l_edge <= b1_l_edge;  
            b1_r_edge <= b1_r_edge; 
            b1_t_edge <= b1_t_edge + move_by;
            b1_b_edge <= b1_b_edge + move_by;
        end else if(move_box1 && move_up == 1 && MIN_LINE < (b1_t_edge - move_by)) begin
            b1_l_edge <= b1_l_edge;  
            b1_r_edge <= b1_r_edge; 
            b1_t_edge <= b1_t_edge - move_by;
            b1_b_edge <= b1_b_edge - move_by;
        end  

        //Box 2 Movements
        if(move_box2 && move_right == 1 && (b2_r_edge + move_by) < MAX_PIXEL) begin
            b2_l_edge <= b2_l_edge + move_by; 
            b2_r_edge <= b2_r_edge + move_by; 
            b2_t_edge <= b2_t_edge;
            b2_b_edge <= b2_b_edge;
        end else if(move_box2 && move_left == 1 && MIN_PIXEL < (b2_l_edge - move_by)) begin
            b2_l_edge <= b2_l_edge - move_by; 
            b2_r_edge <= b2_r_edge - move_by; 
            b2_t_edge <= b2_t_edge;
            b2_b_edge <= b2_b_edge;
        end else if(move_box2 && move_down == 1 && (b2_b_edge + move_by) < MAX_LINE) begin
            b2_l_edge <= b2_l_edge;  
            b2_r_edge <= b2_r_edge; 
            b2_t_edge <= b2_t_edge + move_by;
            b2_b_edge <= b2_b_edge + move_by;
        end else if(move_box2 && move_up == 1 && MIN_LINE < (b2_t_edge - move_by)) begin
            b2_l_edge <= b2_l_edge;  
            b2_r_edge <= b2_r_edge; 
            b2_t_edge <= b2_t_edge - move_by;
            b2_b_edge <= b2_b_edge - move_by;
        end    
        
    end    

end


endmodule



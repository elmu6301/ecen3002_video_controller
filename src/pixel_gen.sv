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
    // input move_box2,
    // input dColor_box2, 
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
                  ( b1_t_edge <= line_cnt&& line_cnt <= b1_b_edge); 

//Movement assignmentes
assign move_left = move_dir[3];
assign move_right = move_dir[0];  
assign move_up = move_dir[1]; 
assign move_down = move_dir[2]; 

//Speed Assignment 
assign move_by = (DEF_MOV & {4{~speed}}); 

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
            // in_box1 <= (pixel_cnt <= b1_l_edge && pixel_cnt <= b1_r_edge &&
            //             line_cnt <= b1_t_edge && line_cnt <= b1_b_edge); 
            //Draw  the box
            if(in_box1 == 1 && dColor_box1 == 1) begin //Draw box 1 with alternative color
                color_hex <= B1_ALT_COLOR; 
            end else if(in_box1 == 1) begin //Draw box 1 with default color
                // end else if(pixel_cnt <= B1_L_EDGE && pixel_cnt <= B1_R_EDGE && line_cnt <= B1_T_EDGE && line_cnt <= B1_B_EDGE) begin
                color_hex <= B1_DEF_COLOR; 
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

    end else begin
        
        if(move_box1 && move_right == 1 && (b1_r_edge + DEF_MOV) < MAX_PIXEL) begin
            b1_l_edge <= b1_l_edge + DEF_MOV; 
            b1_r_edge <= b1_r_edge + DEF_MOV; 
            b1_t_edge <= b1_t_edge;
            b1_b_edge <= b1_b_edge;
        end else if(move_box1 && move_left == 1 && MIN_PIXEL < (b1_l_edge - DEF_MOV)) begin
            b1_l_edge <= b1_l_edge - DEF_MOV; 
            b1_r_edge <= b1_r_edge - DEF_MOV; 
            b1_t_edge <= b1_t_edge;
            b1_b_edge <= b1_b_edge;
        end else if(move_box1 && move_down == 1 && (b1_b_edge + DEF_MOV) < MAX_LINE) begin
            b1_l_edge <= b1_l_edge;  
            b1_r_edge <= b1_r_edge; 
            b1_t_edge <= b1_t_edge + DEF_MOV;
            b1_b_edge <= b1_b_edge + DEF_MOV;
        end else if(move_box1 && move_up == 1 && MIN_LINE < (b1_t_edge - DEF_MOV)) begin
            b1_l_edge <= b1_l_edge;  
            b1_r_edge <= b1_r_edge; 
            b1_t_edge <= b1_t_edge - DEF_MOV;
            b1_b_edge <= b1_b_edge - DEF_MOV;
        end    
        
    end    

end


endmodule



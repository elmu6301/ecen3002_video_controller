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

logic [3:0] bar_cnt; 

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

//=======================================================
//  Structural coding
//=======================================================

/*
    Generating 16 vertical bars
*/

//Trigger on the positive edge of the clock and the reset 
always_ff @ (posedge rfr_clk, negedge reset_n) 
	begin 
		//Reset logic
		if(reset_n == 1'b0) begin  
            bar_cnt = 0; 
        end else begin
            if(pixel_cnt <= MAX_PIXEL && line_cnt <= MAX_LINE) begin
                if(pixel_cnt % BAR_W == 0) begin
                    bar_cnt <= (bar_cnt + 1) % BARS; 
                end


                case(pixel_cnt)
                    (0): color_hex <= RED;
                    (MAX_PIXEL/16): color_hex <= ORANGE;
                    (2*MAX_PIXEL/16): color_hex <= YELLOW;
                    (3*MAX_PIXEL/16): color_hex <= GREEN;
                    (4*MAX_PIXEL/16): color_hex <= BLUE;
                    (5*MAX_PIXEL/16): color_hex <= INDIGO;
                    (6*MAX_PIXEL/16): color_hex <= VIOLET;
                    (7*MAX_PIXEL/16): color_hex <= BLACK;
                    (8*MAX_PIXEL/16): color_hex <= WHITE; 
                    (9*MAX_PIXEL/16): color_hex <= VIOLET;
                    (10*MAX_PIXEL/16): color_hex <= INDIGO; 
                    (11*MAX_PIXEL/16): color_hex <= BLUE;
                    (12*MAX_PIXEL/16): color_hex <= GREEN;
                    (13*MAX_PIXEL/16): color_hex <= YELLOW;
                    (14*MAX_PIXEL/16): color_hex <= ORANGE;
                    (15*MAX_PIXEL/16): color_hex <= RED;
                   
                endcase
            end else begin
                color_hex <= BLACK;
            end

        end 
           
       
    end

endmodule



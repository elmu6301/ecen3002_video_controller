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
    Drawing the boxes
*/

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
            if(pixel_cnt % BAR_W == 0 && pixel_cnt <= MAX_PIXEL ) begin
                bar_cnt <= (bar_cnt + 1) % BARS; 
                case(bar_cnt)
                    0: begin
                        color_hex <= WHITE; 
                    end
                    1: begin
                        color_hex <= RED; 
                    end
                    2: begin
                        color_hex <= ORANGE; 
                    end
                    3: begin
                        color_hex <= YELLOW; 
                    end
                    4: begin
                        color_hex <= GREEN_Y; 
                    end
                    5: begin
                        color_hex <= GREEN; 
                    end
                    6: begin
                        color_hex <= GREEN_B; 
                    end
                    7: begin 
                        color_hex <= TEAL;    
                    end
                    8: begin
                        color_hex <= BLUE_G; 
                    end
                    9: begin
                        color_hex <= BLUE; 
                    end
                    10: begin
                        color_hex <= VIOLET; 
                    end
                    11: begin
                        color_hex <= PINK;  
                    end
                    12: begin
                        color_hex <= FUSHIA;  
                    end
                    13: begin
                        color_hex <= DARK_GREY; 
                    end
                    14: begin
                        color_hex <= LIGHT_GREY; 
                    end
                    15: begin   
                        color_hex <= BLACK; 
                    end

                endcase
            end
        end
       
    end

endmodule



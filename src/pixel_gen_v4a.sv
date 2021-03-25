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

logic [5:0] v_bar_cnt; 
logic [5:0] h_bar_cnt; 
logic [5:0] b_cnt; 

//ROM Declarations
logic [5:0] rom_addr;
logic [23:0] rom_data; 

//=======================================================
//  Module declarations
//=======================================================

rom_p4 ROM(.address(rom_addr), .clock(rfr_clk), .q(rom_data)); 

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

assign rom_addr = b_cnt; 
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
            b_cnt <= 0; 
            v_bar_cnt <= -1; 
            h_bar_cnt <= 0;
        end else begin
            if(pixel_cnt <= MAX_PIXEL && line_cnt <= MAX_LINE) begin
                if(pixel_cnt % V_BAR_W == 0) begin
                    v_bar_cnt <= (v_bar_cnt + 1) % BOXES; 
                    b_cnt <= (v_bar_cnt + h_bar_cnt) % BOXES; 
                    // b_cnt <= (b_cnt + 1) % BOXES; 
                end

                if(pixel_cnt == MAX_PIXEL && line_cnt % H_BAR_W == 0) begin
                    h_bar_cnt <= (h_bar_cnt + 1) % BOXES; 
                end

                
                // endcase
                color_hex <= rom_data; 

            end else begin
                color_hex <= BLACK;
            end

        end 
           
       
    end

endmodule



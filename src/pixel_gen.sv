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

    // output [3:0] bar,
    output [7:0] p_red, 
    output [7:0] p_green, 
    output [7:0] p_blue 
    
); 


//=======================================================
//  REG/WIRE declarations
//=======================================================

logic [3:0] bar_cnt; 
logic [7:0] red, green, blue; 

//=======================================================
//  Assignments
//=======================================================

//Assign RGB outputs only when the video is on
assign p_red = red & {8{video_on}}; 
assign p_green = green  & {8{video_on}}; 
assign p_blue = blue & {8{video_on}}; 

//Test output
// assign bar = bar_cnt; 

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
            if(pixel_cnt % 80 == 0 && pixel_cnt <= 1279) begin
                bar_cnt <= (bar_cnt + 1) % 16; 
                case(bar_cnt)
                    0: begin
                        red <= 255;
                        green <= 255; 
                        blue <= 255; 
                    end
                    1: begin
                        red <= 255;
                        green <= 0; 
                        blue <= 0; 
                    end
                    2: begin
                        red <= 255;
                        green <= 128; 
                        blue <= 0;  
                    end
                    3: begin
                        red <= 255;
                        green <= 255; 
                        blue <= 0;  
                    end
                    4: begin
                        red <= 128;
                        green <= 255; 
                        blue <= 0;  
                    end
                    5: begin
                        red <= 0;
                        green <= 255; 
                        blue <= 0; 
                    end
                    6: begin
                        red <= 0;
                        green <= 255; 
                        blue <= 128;  
                    end
                    7: begin
                        red <= 0;
                        green <= 255; 
                        blue <= 255;  
                    end
                    8: begin
                        red <= 0;
                        green <= 128; 
                        blue <= 255;  
                    end
                    9: begin
                        red <= 0;
                        green <= 0; 
                        blue <= 255;  
                    end
                    10: begin
                        red <= 128;
                        green <= 0; 
                        blue <= 255;  
                    end
                    11: begin
                        red <= 255;
                        green <= 0; 
                        blue <= 255;  
                    end
                    12: begin
                        red <= 255;
                        green <= 0; 
                        blue <= 128;  
                    end
                    13: begin
                        red <= 224;
                        green <= 224; 
                        blue <= 224;  
                    end
                    14: begin
                        red <= 128;
                        green <= 128; 
                        blue <= 128;  
                    end
                    15: begin
                        red <= 0;
                        green <= 0; 
                        blue <= 0;   
                    end

                endcase
            end
        end
       
    end

endmodule



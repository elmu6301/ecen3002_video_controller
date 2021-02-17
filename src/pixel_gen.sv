/*
    ECEN 3002
    Video Project: Video Controller Module
    Elena Murray

*/

module pixel_gen(
    input rfr_clk, 
    input reset_n,
    input video_on, 
    input pixel_cnt, 
    input line_cnt, 

    output [7:0] p_red, 
    output [7:0] p_green, 
    output [7:0] p_blue
    
); 


//=======================================================
//  REG/WIRE declarations
//=======================================================



//=======================================================
//  Assignments
//=======================================================



//=======================================================
//  Structural coding
//=======================================================

//Trigger on the positive edge of the clock and the reset 
always_ff @ (posedge rfr_clk, negedge reset_n) 
	begin 
		//Reset logic
		if(reset_n == 1'b0) begin //reset counter if button is hit   
         
        end else begin
        
        end
    end

endmodule



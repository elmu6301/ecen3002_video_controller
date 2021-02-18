/*
    ECEN 3002
    Video Project: Video Controller Module
    Elena Murray

*/

module vtc(
    input rfr_clk, 
    input reset_n,

    output h_sync,
    output [11:0] h_count, 
    output v_sync,
    output [11:0] v_count,
    output video_on
); 
`include "params.vh"

//=======================================================
//  REG/WIRE declarations
//=======================================================

logic [11:0] p_ctr; //Pixel counter
logic [11:0] l_ctr; //Line counter
logic video_on_h, video_on_v; //Track the on/off state of video for each axis
logic h_pulse, v_pulse; 

//=======================================================
//  Assignments
//=======================================================

assign video_on = video_on_h && video_on_v; 
assign h_count = p_ctr; 
assign v_count = l_ctr; 
assign h_sync = h_pulse; 
assign v_sync = v_pulse; 

//=======================================================
//  Structural coding
//=======================================================

//Trigger on the positive edge of the clock and the reset 
always_ff @ (posedge rfr_clk, negedge reset_n) 
	begin 
		//Reset logic
		if(reset_n == 1'b0) begin //reset counter if button is hit   
            //Reset horizontal 
            p_ctr <= 0; 
            video_on_h <= 1;
            h_pulse <= 0;

            //Reset vertical
            l_ctr <= 0; 
            video_on_v <= 1;
            v_pulse <= 0;
        end else begin
        
		
            //Horizontal Logic
            case (p_ctr)
                H_F_PORCH: begin //Beginning of front porch -> Turn off the video (now off screen)
                    video_on_h <= 0; 
                    p_ctr <= p_ctr + 1; 
                end
                H_S_PULSE: begin //Begining of sync pulse -> Turn on the sync pulse
                    h_pulse <= 1; 
                    p_ctr <= p_ctr + 1; 
                end
                H_B_PORCH: begin //Beginning of back porch -> Turn off the sync pulse
                    h_pulse <= 0; 
                    p_ctr <= p_ctr + 1; 
                end
                H_MAX_PIXEL: begin //End of screen -> Reset to left side of the screen
                    p_ctr <= 0; 
                    video_on_h <= 1;
                    l_ctr <= l_ctr + 1; //increment the line counter
                end
                default:  p_ctr <= p_ctr + 1; 
            endcase

            //Vertical Logic
            case (l_ctr)
                V_F_PORCH: begin //Beginning of front porch -> Turn off the video (now off screen)
                    video_on_v <= 0; 
                end
                V_S_PULSE: begin //Begining of sync pulse -> Turn on the sync pulse
                    v_pulse <= 1; 
                end
                V_B_PORCH: begin //Beginning of back porch -> Turn off the sync pulse
                    v_pulse <= 0; 
                end
                V_MAX_LINE: begin //End of screen -> Reset to left side of the screen
                    l_ctr <= 0; 
                    video_on_v <= 1;
                end
            endcase
        end
	end

endmodule



/*
    ECEN 3002
    Video Project: Reset Module
    Elena Murray

    Note: Code Taken from ResetTiming/source/reset.sv. 
*/

module reset (
    input clock, 
    input ext_reset_n,
    input lock,
    output reset_n
);


logic q0, q1;
logic asynch_reset_n;
logic rst_n; 

assign asynch_reset_n  = ext_reset_n & lock;
assign reset_n = rst_n; 

always_ff @ (posedge clock, negedge asynch_reset_n)
    if (asynch_reset_n == 1'b0)
        begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            rst_n <= 1'b0;
        end
    else
        begin
            q0 <= 1'b1;
            q1 <= q0;
            rst_n <= q1;
        end 

endmodule
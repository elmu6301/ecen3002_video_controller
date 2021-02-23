/*
    ECEN 3002
    Video Project: testbench
    Elena Murray

*/

`timescale 1 ns/100 ps

//Module Declaration
module tb(); 

//Port Definitions
logic CLOCK_50; 
logic [3:0]	KEY; 

logic VGA_BLANK_N,VGA_SYNC_N; 
logic [7:0] VGA_R, VGA_G, VGA_B; 
logic VGA_CLK; 
logic VGA_HS, VGA_VS; 


// logic pll_clk, reset_P, pll_locked; 
// logic [11:0] horz_count, vert_count; 
// logic horz_sync, vert_sync, v_on; 

logic [9:0] LEDR;
logic [9:0] SW;

//Device Declaration
em_project DUT(.*); 

//Simulation
always # 10 CLOCK_50 = ~CLOCK_50; 

initial begin
    //Set up inital values to all inputs
    CLOCK_50 = 1'b1; 
    KEY = 4'b1111;
    SW = 1; 

    //Let the system run
    #100 SW[0] = 1'b0;
    #15_529_800 KEY[0] = 1'b0; 
    // #15_529_800 KEY[0] = 1'b1; 
    // #15_529_800 KEY[0] = 1'b0; 
    // #15_529_800 KEY[0] = 1'b1; 
    // #15_529_800 KEY[0] = 1'b0; 
    //Switch to alternate color
    // #15_000_000 //SW[8] = 1'b1;  
    // #15_000_000
    // #30_000_000
    // #100_000_000 
    $stop; 
end


endmodule
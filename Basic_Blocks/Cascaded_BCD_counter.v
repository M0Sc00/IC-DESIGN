`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:41:07 AM
// Design Name: 
// Module Name: Cascaded_BCD_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Cascaded_BCD_counter(
    input clk , enable , reset, // enable the first enable .
    output done , // output of the final and gate.
    output [3:0] ones , tens , hundreds 
    );
    
    wire  done0,done1,done2;
    wire a0,a1,a2;
    
assign a0 = done0 & enable;
BCD_COUNTER o0(clk , enable , reset, done0 , ones);

assign a1 = done1 & a0;
BCD_COUNTER o1(clk , a0 , reset, done1 , tens);

assign a2 = done2 & a1;
BCD_COUNTER o2(clk , a1 , reset, done2 , hundreds);

assign done = a2 ;

endmodule

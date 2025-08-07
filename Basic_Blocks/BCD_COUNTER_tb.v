`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:33:00 AM
// Design Name: 
// Module Name: BCD_COUNTER_tb
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


module BCD_COUNTER_tb();

reg clk , reset , enable ;
wire done ;
wire [3:0] Q;


BCD_COUNTER p0 (clk , enable , reset , done , Q);
initial #1000 $stop;
initial clk =0 ;
always begin
clk =~clk; #20 ;
end

initial begin
    reset = 0 ;
    enable = 0 ;
    #100;
    reset = 1 ;
    enable = 1 ;
    
end
endmodule

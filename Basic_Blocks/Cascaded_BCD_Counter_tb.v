`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:56:08 AM
// Design Name: 
// Module Name: Cascaded_BCD_Counter_tb
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


module Cascaded_BCD_Counter_tb();
reg clk , enable , reset;
wire done ;
wire [3:0] ones , tens , hundreds ;

Cascaded_BCD_counter p8(clk , enable , reset , done , ones , tens , hundreds );

//initial #1900 $stop;
initial clk =0 ;
always begin
clk =~clk; #2 ;
end
/*initial begin
    reset = 0 ;
    enable = 0 ;
    #100;
    reset = 1 ;
    enable = 1 ;
    
end*/
initial begin 
reset =0 ;
#2;
reset =1 ;
#2;
enable =1 ;

repeat(115) @(negedge clk)
#10000 $stop;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 04:22:30 PM
// Design Name: 
// Module Name: D_latch
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


module D_latch(
    input  D,
    input clk,
    output reg Q , 
    output Q_bar 
    );
    
    assign Q_bar =~ Q ;
    
    always @(clk,D)
    begin
    if (clk)
       Q = D ;
    end
endmodule

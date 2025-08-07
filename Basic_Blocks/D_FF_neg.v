`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 04:30:12 PM
// Design Name: 
// Module Name: D_FF_neg
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


module D_FF_neg(
    input D,
    input clk,
    output reg Q
    );
    
    always@ (posedge clk)
    begin
        Q =D ;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2025 07:05:44 PM
// Design Name: 
// Module Name: MUX_2x1_dataflow
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

module MUX_2x1_dataflow(
    input I0 , I1 , S ,
    output F );
    
       assign F = I0 & ~S | I1 & S ;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 08:53:31 PM
// Design Name: 
// Module Name: Synchronous_Up_Counter_tb
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



module Synchronous_Up_Counter_tb();

reg clk,reset_n;
wire [3:0]Q ;

Synchronous_Up_Counter r0 ( clk , reset_n ,Q ); 

initial clk=0;

always begin
clk = ~clk ; #25;
        end
        
        initial begin
        reset_n = 0 ; #100 ;
        
        reset_n = 1 ;
        #1500; $stop; 
                end
endmodule

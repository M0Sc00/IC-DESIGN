`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 08:21:22 PM
// Design Name: 
// Module Name: Asynchronous_Up_Counter_tb
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


module Asynchronous_Up_Counter_tb();

reg clk,reset_n;
wire [3:0]Q ;

Asynchronous_Up_Counter p0 ( clk , reset_n ,Q ); 

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

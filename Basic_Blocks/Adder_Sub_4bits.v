`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:46:46 AM
// Design Name: 
// Module Name: Adder_Sub_4bits
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


module Adder_Sub_4bits(
        input [3:0]x,y,
        input M ,
        output [3:0]s,
        output cout
    );
  wire [3:0]g ;      
    
          generate
          genvar k ;
           for( k=0 ; k<4 ; k=k+1)
           begin:gate
           assign g[k] = y[k] ^ M ;
           end
           endgenerate 
            Ripple_carry_4bits l0 (x,g,M,s,cout);
    
endmodule

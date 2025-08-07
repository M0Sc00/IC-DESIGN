`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 08:36:32 PM
// Design Name: 
// Module Name: Synchronous_Up_Counter
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
module Synchronous_Up_Counter(
    input clk , reset_n ,
    output [3:0] Q
    );
    wire [2:0] And_out;
    
          assign And_out[0] = 1'b1 & Q[0] ;         //AND 1 
        TFF o0(                                     //T_FF 1
        .T(1'b1),
        .clk(clk),
        .reset_n(reset_n),
        .q(Q[0])
    );
    
          assign And_out [1]= And_out[0] & Q[1] ;   //AND 2
        TFF o1(                                     //T_FF 2
        .T(And_out[0]),
        .clk(clk),
        .reset_n(reset_n),
        .q(Q[1])
    );
          assign And_out [2]= And_out [1] & Q[2] ;  //AND 3
        TFF o2(                                     //T_FF 3
        .T(And_out[1]),
        .clk(clk),
        .reset_n(reset_n),
        .q(Q[2])
    );
    
            TFF o3(                                 //T_FF 4
        .T(And_out[2]),
        .clk(clk),
        .reset_n(reset_n),
        .q(Q[3])
    );

endmodule

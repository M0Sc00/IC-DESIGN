`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 05:56:59 PM
// Design Name: 
// Module Name: Asynchronous_Up_Counter
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


module Asynchronous_Up_Counter(
input clk ,reset_n ,
output [3:0]Q 
    );
    wire Q_bar;
    TFF y0(
        .T(1'b1),
        .clk(clk),
        .reset_n(reset_n),
        .q(Q[0])
    );
        TFF y1(
        .T(1'b1),
        .clk(~Q[0]),
        .reset_n(reset_n),
        .q(Q[1])
    ); 
       TFF y2(
        .T(1'b1),
        .clk(~Q[1]),
        .reset_n(reset_n),
        .q(Q[2])
    ); 
       TFF y3(
        .T(1'b1),
        .clk(~Q[2]),
        .reset_n(reset_n),
        .q(Q[3])
    );
    
endmodule

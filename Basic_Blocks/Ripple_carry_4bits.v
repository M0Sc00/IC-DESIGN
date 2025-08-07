`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2025 11:21:13 PM
// Design Name: 
// Module Name: Ripple_carry_4bits
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


module Ripple_carry_4bits(
    input [3:0]x ,y ,
    input cin,
    output [3:0] s,
    output cout     
    );
    wire [3:1]co;
    FULL_ADDER d0(
        .x(x[0]),
        .y(y[0]),
        .S(s[0]),
        .C(co[1]),
        .cin(cin)
        );
        
        FULL_ADDER d1(
        .x(x[1]),
        .y(y[1]),
        .S(s[1]),
        .C(co[2]),
        .cin(co[1])
        );
        
        FULL_ADDER d2(
       .x(x[2]),
        .y(y[2]),
        .S(s[2]),
        .C(co[3]),
        .cin(co[2])
        );
        
        FULL_ADDER d3(
       .x(x[3]),
        .y(y[3]),
        .S(s[3]),
        .C(cout),
        .cin(co[3])
        );
endmodule

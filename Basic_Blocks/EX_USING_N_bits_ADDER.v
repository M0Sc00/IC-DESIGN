`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:30:44 AM
// Design Name: 
// Module Name: EX_USING_N_bits_ADDER
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


module EX_USING_N_bits_ADDER(
        input [15:0] a,b ,
        input cin_ab,
        output [15:0]s_ab,
        output cout_ab,
        
        input [55:0] x,y ,
        input cin_xy,
        output [55:0]s_xy,
        output cout_xy
    );
    
        rippelCarry_using_parameters #(.n(16)) k0 (
            .x(a),
            .y(b),
            .cin(0),
            .s(s_ab),
            .cout(cout_ab)
        );
        
        rippelCarry_using_parameters #(.n(56)) k2 (
            .x(x),
            .y(y),
            .cin(0),
            .s(s_xy),
            .cout(cout_xy)
        );
    
endmodule

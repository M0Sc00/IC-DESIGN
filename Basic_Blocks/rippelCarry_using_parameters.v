`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:08:30 AM
// Design Name: 
// Module Name: rippelCarry_using_parameters
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

// This is a N-BITS Rippel Carry
module rippelCarry_using_parameters
    #(parameter n=4)
        (   input [n-1 :0]x,y,
            input cin,
            output [n-1:0]s,
            output cout
    );
        wire [n:0]c;
        
        assign cin =c[0];
        assign cout=c[n];
        
        generate
           genvar k;
            for(k=0 ; k<n ; k=k+1)
            begin:stage
                FULL_ADDER n0(
                    .x(x[k]),
                    .y(y[k]),
                    .cin(c[k]),
                    .S(s[k]),
                    .C(c[k+1])
                );
            end
        endgenerate
    
endmodule

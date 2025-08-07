`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 07:07:05 PM
// Design Name: 
// Module Name: Arthimatic_Operation
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


module Arthimatic_Operation
    #(parameter m=4 , n=4)
    (input [n-1:0] x,
    input [m-1:0]y,
    
    output [n-1 : 0]s,
    output cout
    );
        assign {cout , s} = x+y ;
endmodule

`timescale 1ns/ 1ps

module arthematic_Operation_tb ;

parameter n=4 ;
parameter m=4 ;

reg [n-1:0] x ;
reg [m-1:0] y ;


Arthimatic_Operation #(n,m) DUT( .x(x) , .y(y));

initial
    begin
    x=4'b0001 ; y=4'b0010; #10;
    x=4'b0100 ; y=4'b0011; #10;
    x=4'b1111 ; y=4'b1110; #10;
    end
endmodule












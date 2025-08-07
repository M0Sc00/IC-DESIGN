`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:23:19 PM
// Design Name: 
// Module Name: UP_Counter_behavior
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


module UP_Counter_behavior
#(parameter Bits = 4)(
    input clk , reset_n , 
    output [Bits-1:0] Q 
    );
    
    reg [Bits-1:0] Q_next , Q_reg ;
    
    always@(posedge clk , negedge reset_n)
    begin
        if (~reset_n)
        Q_reg<= 1'b0;
        else
        Q_reg <= Q_next ;
    end
    
    always@(*)
    begin
        Q_next = Q_reg + 1;
       // Q_next = Q_reg - 1; //DOWN COUNTER
    end
    
    assign Q = Q_next ;
endmodule

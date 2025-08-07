`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:25:18 AM
// Design Name: 
// Module Name: BCD_COUNTER
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


module BCD_COUNTER(
input clk , enable , reset_n ,done, 
output [3:0]Q );

reg [3:0] Q_next ,Q_reg ;

always@(posedge clk , negedge reset_n)
begin
    if(~reset_n)
    Q_reg <= 'b0;
    else if (enable)
    Q_reg <= Q_next ;
end

assign   done = Q_reg == 9;
always@(*)
begin
 Q_next = done? 'b0 : Q_reg +1 ;
end

assign Q = Q_next; 
endmodule

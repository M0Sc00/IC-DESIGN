`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:48:35 PM
// Design Name: 
// Module Name: TFF_tb
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


module TFF_tb( );

reg T , clk , reset_n ;
wire q;
TFF p0(T , clk ,reset_n , q);
initial 
clk =0 ;
always begin
clk = ~clk ; #25;end
integer i;
initial begin
reset_n =0 ; 
T = 1;#30;
T = 0;#30;
    
reset_n=1 ;

for(i=0 ; i<50 ; i=1+i)begin
T =$random ; #10; end
        end
endmodule;

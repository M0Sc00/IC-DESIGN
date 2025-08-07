`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:33:35 PM
// Design Name: 
// Module Name: UP_Counter_behavior_tb
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


module UP_Counter_behavior_tb( );
parameter bits = 4 ;
reg clk , reset_n ;
wire [bits-1:0]Q;


UP_Counter_behavior #(bits) t0(clk , reset_n , Q);

initial
     #1500 $stop;

initial clk =0 ;

always begin clk = ~clk ; #20; end

initial begin 
reset_n =0;
repeat(5) @(posedge clk) reset_n =0;
reset_n =1 ;

        end
endmodule

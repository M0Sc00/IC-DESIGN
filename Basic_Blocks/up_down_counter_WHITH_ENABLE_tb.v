`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 06:26:35 PM
// Design Name: 
// Module Name: up_down_counter_WHITH_ENABLE_tb
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


module up_down_counter_WHITH_ENABLE_tb();
parameter bits = 4 ;
reg clk , reset_n , enable ,load,up;
reg  [bits-1:0] D ;
wire [bits-1:0]Q;


up_down_Counter_withEnable #(bits) t0(clk , reset_n ,enable ,load,up,D, Q);

//initial
  //   #1000 $stop;

initial clk =0 ;
always begin clk = ~clk ; #20; end

initial begin 
load =0 ;
up =1 ;
reset_n =0;
enable  =0; #20;
//repeat(5) @(posedge clk) reset_n =0;enable  =0;
reset_n =1 ;
enable  =1 ;
#400;
up = 0 ;
#400;
load = 1 ;
D = 'd5 ; 
#500;  
   
        end
endmodule


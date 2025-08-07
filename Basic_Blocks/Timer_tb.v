`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 07:35:54 PM
// Design Name: 
// Module Name: Timer_tb
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


module Timer_tb();

localparam final_value =255  ;
localparam Bits = $clog2(final_value);

reg clk , reset , enable;
wire done ;

Timer #(final_value) timer0(clk , reset ,enable , done);
localparam T =10;
always begin
 clk =0;
  #(T/2);
  clk =1 ;
  #(T/2);
  end

initial begin
reset = 0 ;
#20;
reset =1;
enable=1;
#(final_value *T*3) ;
end
endmodule

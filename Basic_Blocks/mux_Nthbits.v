`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 12:09:16 AM
// Design Name: 
// Module Name: mux_Nthbits
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


module mux_Nthbits
#(parameter N=5)
    (input [N-1:0] w ,
    input [$clog2(N)-1:0] sel,
    output reg out);
    
  /*  assign out = (sel==2'b0)?w[0]  :
                 (sel==2'b1)?w[1]  :
                 (sel==2'b10)?w[2] : w[3] ; */
                 
      always@(*)
      begin
    /*    out = (sel==2'b0)?w[0]  :
                 (sel==2'b1)?w[1]  :
                 (sel==2'b10)?w[2] : w[3] ;
      */
      
    /*  case(sel)
        2'b0  : out = w[0];
        2'b1  : out = w[1];
        2'b10 : out = w[2];
        2'b11 : out = w[3];
      default : out = 'bx;
      endcase
      */
      
     if(sel==2'b00)
     out = w[0];
     else if( sel==2'b01)
     out = w[1];
     else if( sel==2'b10)
     out = w[2];
     else
     out = w[3];
      end
        endmodule

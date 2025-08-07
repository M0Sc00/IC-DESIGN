`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 08:57:25 AM
// Design Name: 
// Module Name: ShiftReg_withLoad
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


module ShiftReg_withLoad
#(parameter n=4 )(
    input [n-1:0] in ,
    input MSB , LSB, clk ,reset_n, 
    input [1:0] sel ,
    output [n-1:0] Q);
    
    reg [n-1:0] Q_next , Q_reg ;
    
    always@(posedge clk , negedge reset_n)  //Asynchronous negedge reset
        begin
            if(~reset_n)
                Q_reg <= 0 ;
            else
                Q_reg <= Q_next ;
        end     
        
    always@(*)
        begin
         //   if (load)
         //       Q_next = in ;
         //   else
                case(sel)
                    2'b00 : Q_next = Q_reg;                     // NO change.
                    2'b01 : Q_next = { MSB , Q_reg[n-1:1] };    // Shift Right.
                    2'b10 : Q_next = { Q_reg[n-2:0] , LSB };    // shift left.
                    2'b11 : Q_next = in ;
                  default : Q_next = Q_reg;  
                endcase
        end
        
        assign Q = Q_reg ;
endmodule

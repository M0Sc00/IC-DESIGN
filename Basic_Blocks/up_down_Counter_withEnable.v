`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 06:08:40 PM
// Design Name: 
// Module Name: up_down_Counter_withEnable
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


module up_down_Counter_withEnable
#(parameter bits = 5)(
    input clk , reset_n , enable ,load,up,
    input [bits-1:0] D , 
    output [bits-1:0] Q
    );
    
    reg  [bits-1:0] Q_next , Q_reg ;
    
    always@(posedge clk or negedge reset_n) //Asynchronous active LOW RESET. 
    begin
        if(~reset_n)
            Q_reg <=1'b0;
        else if (enable)                    //Synchronous active HIGH ENABLE.
            Q_reg = Q_next ;
        else
            Q_reg <= Q_reg ;
    end 
    
    always@(*)
    begin
        casex ({load,up})
                2'b01 :    Q_next = Q_reg+1 ;
                2'b00 :    Q_next = Q_reg-1 ;
                2'b1X :    Q_next = D ;
                default :  Q_next = Q_reg ;
                endcase
    end
    
    assign Q = Q_next ;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 04:10:53 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    #(parameter ADDR_width =7 ,  DATA_width =8 )
     (input clk ,we,
     input [ADDR_width -1 : 0 ] address_r , address_w ,
     input [DATA_width -1 : 0 ] data_r ,
     output  [DATA_width -1 : 0 ] data_w
    );
    reg [DATA_width -1 : 0 ] memory [0:2 ** ADDR_width-1] ;
    
    always@(posedge clk)
    begin
        //synchronous write
        if(we)
        memory[address_w] <= data_w ;
    end     
        //Asynchronous Read
    assign  data_w =  memory[address_w]  ;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 04:57:54 PM
// Design Name: 
// Module Name: swap_reg_file
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


module swap_reg_file
#(parameter ADDR_width=7 , DATA_width=8)(
    input clk , reset , we , swap ,
    input [ADDR_width -1 :0 ] address_r , address_w , address_A ,address_B ,
    input [DATA_width -1 :0 ] data_w,
    output [DATA_width -1 :0 ] data_r );
    //REG FILE
    wire [1:0] sel ;
    wire w ;
    wire [ADDR_width -1 :0 ] MUX_READ_f , MUX_WRITE_f ;
    
    reg_file #(.ADDR_width(ADDR_width), .DATA_width(DATA_width))
    REG_FILE(
    .clk(clk),
    .we( w ? 1'b1 : we),
    .address_r(MUX_READ_f),
    .address_w(MUX_WRITE_f),
    .data_r(data_r),
    .data_w(w ? data_r : data_w)
    );   
    //FSM
    Swap_FSM FSM0(
        .clk(clk),
        .swap(swap),
        .w(we),
        .sel(sel),
        .reset(reset_n)
        );
    //MUX 4x1
    mux_4x1_nbits #(.N(ADDR_width)) mux_read(            
            .w0(address_r),
            .w1(address_A),
            .w2(address_B),
            .w3(1'b0),
            .sel(sel),
            .f(MUX_READ_f)            
            );
        
     mux_4x1_nbits #(.N(ADDR_width)) mux_write(            
            .w0(address_w),
            .w1(1'b0),
            .w2(address_A),
            .w3(address_B),
            .sel(sel),
            .f(MUX_WRITE_f)            
            );       
endmodule

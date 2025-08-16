`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 05:03:34 PM
// Design Name: 
// Module Name: uart
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


module uart
#(parameter DBIT=8 , SB_TICK=16 )
    (
    input clk , reset,
    
     //recriver ports
    output [DBIT-1 :0 ] r_data ,
    input rd_uart ,
    output rx_empty,
    input rx ,
    
     //transmitter ports
    input [DBIT-1 :0 ] w_data,
    input wr_uart,
    output tx_full,
    output tx,

     //boud rate generator
    input [10:0] TIMET_FINAL_VALUE
    );

     //TIMER
wire tick;
Timer #(.Bits(11)) boud_rate_genaerator(
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .FINAL_VALUE(TIMET_FINAL_VALUE),
        .DONE(tick)
        );

     //Reciever
wire rx_done_tick;
wire [DBIT-1 :0 ] rx_dout;
UART_rx #(.DBITS(DBIT) , .SB_TICK(SB_TICK))     reciever(
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .s_tick(tick),
        .rx_dout(rx_dout),
        .rx_done_tick(rx_done_tick)
        );          
     //FIFO
fifo_generator_0 rx_fifo(
  .clk(clk),      // input wire clk
  .srst(~reset),    // input wire srst
  .din(rx_dout),      // input wire [7 : 0] din
  .wr_en(rx_done_tick ),  // input wire wr_en
  .rd_en(rd_uart),  // input wire rd_en
  .dout(r_data),    // output wire [7 : 0] dout
  .full(),    // output wire full
  .empty(rx_empty)  // output wire empty
    );
    
    
     //Transmitter
wire [DBIT-1:0] tx_din;
wire tx_fifo_empty , tx_done_tick ;
UART_tx #(.BITS(DBIT), .SB_TICK(SB_TICK)) transmitter(
        .clk(clk),
        .reset(reset),
        .tx(tx),
        .s_tick(tick),
        .tx_din(tx_din),
        .tx_done_tick(tx_done_tick),
        .tx_start(~tx_fifo_empty)       
        );

     //FIFO
fifo_generator_0 tx_fifo(
  .clk(clk),      // input wire clk
  .srst(~reset),    // input wire srst
  .din(w_data),      // input wire [7 : 0] din
  .wr_en(wr_uart),  // input wire wr_en
  .rd_en(tx_done_tick),  // input wire rd_en
  .dout(tx_din),    // output wire [7 : 0] dout
  .full(tx_full),    // output wire full
  .empty(tx_fifo_empty)  // output wire empty
    );
    

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2025 09:53:02 AM
// Design Name: 
// Module Name: fifo_tb
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
module fifo_tb;
  // Parameters
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 4;

  // Testbench signals
  reg clk;
  reg rst;
  reg write_en;
  reg read_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  // Instantiate FIFO
  fifo 
   #( .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
      );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;  // 10ns clock period

  // Test sequence
  initial begin
    $display("Starting FIFO Test...");
    rst = 1;
    write_en = 0;
    read_en = 0;
    data_in = 0;

    #15 rst = 0;

    // Write 4 values into FIFO
    repeat (4) begin
      @(posedge clk);
      write_en = 1;
      data_in = data_in + 1;
    end

    @(posedge clk);
    write_en = 0;

    // Read 4 values from FIFO
    repeat (4) begin
      @(posedge clk);
      read_en = 1;
      $display("Read Data: %d", data_out);
    end

    @(posedge clk);
    read_en = 0;

    // Final check
    @(posedge clk);
    $display("FIFO empty: %b, full: %b", empty, full);
    $finish;
  end

endmodule

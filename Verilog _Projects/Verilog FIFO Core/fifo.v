`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2025 09:49:54 AM
// Design Name: 
// Module Name: fifo
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
module fifo 
#(parameter DATA_WIDTH = 8,
  parameter DEPTH = 16)
  (
  input   clk,
  input   rst,
  input   write_en,
  input   read_en,
  input      [DATA_WIDTH-1:0] data_in,
  output reg [DATA_WIDTH-1:0] data_out,
  output   full,
  output   empty
    );

  // Internal memory
  reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

  // Read and write pointers
  reg [$clog2(DEPTH)-1:0] rd_ptr; // [3:0]
  reg [$clog2(DEPTH)-1:0] wr_ptr;

  // Counter to track number of elements
  reg [$clog2(DEPTH):0] fifo_count;

  // Status flags
  assign full  = (fifo_count == DEPTH);
  assign empty = (fifo_count == 0);

  // FIFO logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      rd_ptr <= 0;
      wr_ptr <= 0;
      fifo_count <= 0;
      data_out <= 0;
    end 
    else begin
      // Write operation
      if (write_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
        fifo_count <= fifo_count + 1;
      end

      // Read operation
      if (read_en && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
        fifo_count <= fifo_count - 1;
      end
    end
  end

endmodule
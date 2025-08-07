`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 08/01/2025 10:21:09 AM
//////////////////////////////////////////////////////////////////////////////////
module mux_reg (D,OUT,c_en,clk,rst);
parameter W = 18;
parameter REG = 1;
parameter RSTTYPE ="SYNC";
input [W-1:0] D;
input c_en,clk,rst;
output reg [W-1:0] OUT;

generate
    if (REG)
    begin
        if (RSTTYPE=="SYNC")  
    begin
always @(posedge clk  ) 
begin
    if(rst)
    OUT<=0;
    else if (c_en)
    OUT<=D;    
    end
end
    else 
    begin
always @(posedge clk or posedge rst  ) 
    begin
    if(rst)
        OUT<=0;
    else if (c_en)
        OUT<=D;    
    end
end
end
else 
    begin
    always @(*) begin
        OUT=D;
    end
end 
endgenerate
endmodule
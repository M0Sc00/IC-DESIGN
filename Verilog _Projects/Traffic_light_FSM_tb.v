`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 10:38:06 PM
// Design Name: 
// Module Name: Traffic_light_FSM_tb
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


module Traffic_light_FSM_tb();
reg clk , reset , sa , sb ;
wire Ga , Ya , Ra ;
wire Gb , Yb , Rb ;

Traffic_Light_FSM T_L0(clk , reset , sa ,sb ,Ga , Ya , Ra ,Gb , Yb , Rb);

wire [1:0] light_A , light_B ;

localparam R = 0 ;
localparam Y = 1 ;
localparam G = 2 ;
 
 assign light_A = Ra? R :
                  Ya? Y :
                  Ga? G : light_A ;

 assign light_B = Rb? R :
                  Yb? Y :
                  Gb? G : light_B ;
                  
// generating the clock                                    
localparam T = 10 ;
always
begin
    clk =1'b0;
    #(T/2);
    clk =1'b1;
    #(T/2) ;
end 

initial 
begin
reset = 1'b0 ;
#2;
reset = 1'b1 ;

//no cars at either streets
sa =1'b0 ;
sb =1'b0 ;
#80;

//no cars at A , some cars at B
sa = 1'b0 ;
sb = 1'b1 ;
#100;

// cars at both streets
sa =1'b1 ;
sb =1'b1 ;
#300;

//car appears at B , then no cars at either streets.
sa = 1'b0 ;
sb = 1'b1 ;
#20;
sb = 1'b0 ;
sa = 1'b0 ;
#300 $stop; 
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 10:04:03 PM
// Design Name: 
// Module Name: Traffic_Light_FSM
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


module Traffic_Light_FSM(
    input clk , reset ,
    input sa , sb ,
    output reg Ga , Ya , Ra ,
    output reg Gb , Yb , Rb 
    );
    reg [3:0] state_reg , state_next ;
    localparam   s0=0 , s1=1 , s2=2 , s3=3 ,s4=4 ,
                 s5=5 , s6=6 , s7=7 , s8=8 , s9=9 ,
                 s10=10 , s11=11 , s12=12 ; 
    //current state
    always@(posedge clk , negedge reset)
    begin
        if (~reset)
        state_reg <= 'b0 ;
        else
        state_reg <= state_next ;
    end 
    //next state
    always@(*)
    begin
        case(state_reg)
            s0 , s1 , s2 , s3 , s4 , s6 , s7 , s8 , s9 , s10:
                   state_next = state_reg + 1 ;
             s5 : if(~sb) state_next = s5 ;
                       else    state_next = s6 ;               
            s11 : if (~sa & sb)
                      state_next = s11 ;
                  else if (sa | ~sb)
                      state_next = s12 ;           
            s12 : state_next =  s0 ;
        default : state_next = s0 ;
        endcase 
    end       
    //output logic
    always@(*)
   begin
   Ga =0 ; Gb =0 ;
   Ya =0 ; Yb =0 ;
   Ra =0 ; Rb =0 ;
   
case(state_reg)
   s0,s1,s2,s3,s4,s5 :
           begin
           Ga = 1'b1 ;
           Rb = 1'b1 ;
           end    
   s6 :
           begin 
           Ya = 1'b1 ; 
           Rb = 1'b1 ;
           end
   s7,s8,s9,s10,s11 :
            begin
           Ra = 1'b1 ;
           Gb = 1'b1 ;
           end
    s12 : 
            begin
           Ra = 1'b1 ;
           Yb = 1'b1 ;
            end
endcase
      end   
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 05:12:17 PM
// Design Name: 
// Module Name: task_4_1
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


module task_4_1
#(parameter INPUT_PRIORITY="A" , FULL_ADDER="NO")(
    input clk,
    input rst,
    input [2:0] A,
    input [2:0] B,
    input cin,
    input serial_in,
    input red_op_A,
    input red_op_B,
    input [2:0] opcode,
    input bypass_A,
    input bypass_B,
    input direction,
    output reg [15:0] leds,
    output reg [5:0] out
    );
reg cin_reg , red_op_A_reg , red_op_B_reg , bypass_A_reg , bypass_B_reg , direction_reg , serial_in_reg ;
reg [2:0] A_reg , B_reg , opcode_reg ;

wire invalid , invalid_red_op , invalid_opcode ;

    always@(posedge clk , posedge rst)
    begin
        if(rst)begin
           cin_reg <= 'b0;
            red_op_A_reg <= 'b0;
            red_op_B_reg <= 'b0;
            bypass_A_reg <= 'b0;
            bypass_B_reg <= 'b0;
            direction_reg <= 'b0;
            serial_in_reg <= 'b0;
            A_reg <= 'b0;
            B_reg <= 'b0;
                end
                else begin
            cin_reg <= cin;
            red_op_A_reg <= red_op_A;
            red_op_B_reg <= red_op_B;
            bypass_A_reg <= bypass_A;
            bypass_B_reg <= bypass_B;
            direction_reg <= direction;
            serial_in_reg <= serial_in;
            A_reg <= A;
            B_reg <= B;
                     end
    end

    always@(posedge clk or posedge rst)
    begin
        if(rst)
        out <= 0 ;
        else
            begin
                if(invalid)
                leds <= ~leds ; // error detected.
                else
                leds <= 0 ;
            end
    end
    
     always@(posedge clk or posedge rst)
    begin
        if(rst)
        out <= 0 ;
        else
            begin
                if(bypass_A_reg && bypass_B_reg)
                out <= (INPUT_PRIORITY == "A")? A_reg : B_reg ;
                else if(bypass_A_reg )
                out <= A_reg ;
                else if(bypass_B_reg )
                out <= B_reg ;
                else if(invalid)
                out <= 0 ;
                else
                    begin
                        case(opcode)
                        000 :begin if(red_op_A_reg && red_op_B_reg)
                                out <= (INPUT_PRIORITY == "A")? &A_reg : &B_reg ;
                              else if (red_op_A_reg )
                                out <= &A_reg  ;
                              else if (red_op_B_reg )
                                out <= &B_reg  ;
                              else
                                out <= A_reg & B_reg ;
                             end
 
                        001 :begin if(red_op_A_reg && red_op_B_reg)
                                out <= (INPUT_PRIORITY == "A")? ^A_reg : ^B_reg ;
                              else if (red_op_A_reg )
                                out <= ^A_reg  ;
                              else if (red_op_B_reg )
                                out <= ^B_reg  ;
                              else
                                out <= A_reg ^ B_reg ;
                             end
 
                        010 :begin if(FULL_ADDER == "NO")
                                out <= A_reg + B_reg + cin_reg ;
                                    else
                                out <= A_reg + B_reg ;
                             end
 
                        011 :   out <= A_reg * B_reg ;
                       
                        100 :begin if(direction_reg)
                            out <= {out[4:0],serial_in_reg};
                              else
                            out <= {serial_in_reg,out[5:1]};
                            end
                        
                        101 :begin if(direction_reg)
                            out <= {out[4:0],out[5]};
                              else
                            out <= {out[0],out[5:1]};
                            end
                        endcase
                    end
            end
    end
endmodule







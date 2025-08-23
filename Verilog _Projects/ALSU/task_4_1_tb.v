`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 02:31:40 PM
// Design Name: 
// Module Name: task_4_1_tb
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


module task_4_1_tb( );
parameter INPUT_PRIORITY="A" ;
parameter FULL_ADDER="NO" ;

reg clk ,rst ,cin , red_op_A, red_op_B , bypass_A, bypass_B, direction , serial_in ;
reg [2:0] A , B , opcode ;
wire [5:0] out ;
wire [15:0] leds ;

task_4_1 #(INPUT_PRIORITY ,FULL_ADDER ) 
          gg( clk , rst , A , B , cin , serial_in ,red_op_A, red_op_B ,opcode ,
                bypass_A, bypass_B, direction ,leds , out );
initial
begin
clk =0;
forever
#5 clk =~clk ;
end

initial
begin
// Verify Asynchronous rst Functionality 
rst =1 ;
A =0;
B =0;
cin =0;
serial_in =0 ;
red_op_A =0;
red_op_B =0;
opcode =0 ;
bypass_A =0;
bypass_B =0;
direction =0;
@(negedge clk);
    if(out != 0 || leds != 0)
                 begin
                   $display("Error");
                   $stop;
                 end
// Verify Bypass Functionality 
rst =0;
bypass_A =1;
bypass_B =1;
repeat(20)begin
A = $random;
B = $random;
opcode = $urandom_range(5,0);
repeat(2) @(negedge clk);
    if(out != A || leds != 0)
                 begin
                   $display("Error");
                   $stop;
                 end
end
// Verify opcode 0 Functionality
bypass_A =0;
bypass_B =0;
opcode =0;
repeat(20) begin
A =$random;
B =$random;
red_op_A =$random;
red_op_B =$random;
repeat(2) @(negedge clk);
    case({red_op_A,red_op_B})
    00 :begin    if(out != (A&B) )
                 begin
                   $display("Error");
                   $stop;
                 end
        end
    10 :begin    if(out != &A )
                 begin
                   $display("Error");
                   $stop;
                 end
        end           
 11,01 :begin    if(out != &B )
                 begin
                   $display("Error");
                   $stop;
                 end
        end           
    endcase
            end
// Verify opcode 1 Functionality
opcode =1;
repeat(20) begin
A =$random;
B =$random;
red_op_A =$random;
red_op_B =$random;
repeat(2) @(negedge clk);
    case({red_op_A,red_op_B})
    00 :begin    if(out != (A^B) )
                 begin
                   $display("Error");
                   $stop;
                 end
        end
    10 :begin    if(out != ^A )
                 begin
                   $display("Error");
                   $stop;
                 end
        end           
 01,11 :begin    if(out != ^B )
                 begin
                   $display("Error");
                   $stop;
                 end
        end           
    endcase
            end
// Verify opcode 2 Functionality
opcode =2;
red_op_A =0;
red_op_B =0;
repeat(20) begin
A =$random;
B =$random;
cin =$random;
repeat(2) @(negedge clk);
                 if(out != A+B+cin )
                 begin
                   $display("Error");
                   $stop;
                 end
            end
// Verify opcode 3 Functionality
opcode =3;
repeat(20) begin
A =$random;
B =$random;
repeat(2) @(negedge clk);
                 if(out != A*B)
                 begin
                   $display("Error");
                   $stop;
                 end
            end
// Verify opcode 4 Functionality
opcode =4;
repeat(20) begin
A =$random;
B =$random;
direction = $random;
serial_in =$random;
repeat(2) @(negedge clk);
            end
// Verify opcode 5 Functionality
opcode =5;
repeat(20) begin
A =$random;
B =$random;
direction = $random;
serial_in =$random;
repeat(2) @(negedge clk);
            end
            $stop;
end
endmodule

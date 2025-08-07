`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2025 07:30:54 PM
// Design Name: 
// Module Name: MUX_2X1_Behavior
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


//Behavioral Rebresentation.
// USNING "always @ " or " case \ endcase"
module MUX_2X1_Behavior(
    input /*wire */ X1,
    input X2,
    input S,
    output reg F
    );
    // reg F;
    always @(X1 , X2 , S )
        begin
/*            if(S)
                begin
                F=X1;
                end
            else
                begin
                F=X2;
                end      
*/
               case(S)
                    0:F=X1;
                    1:F=X2;   
               endcase   
          end 
endmodule










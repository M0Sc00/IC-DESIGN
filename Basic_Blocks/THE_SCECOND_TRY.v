`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 03:24:04 PM
// Design Name: 
// Module Name: THE_SCECOND_TRY
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


// reppil carry adder subtractor with over flow flag.

module THE_SCECOND_TRY
    #(parameter n =4 )   //    #(.n(number))
    (input [n-1:0] x,y,
    input control ,  //was cin 
    output [n-1:0]s,
    output cout,OVERFLOW,
        wire [n:0]cwire,
        wire [n-1:0]xor_out 
    );
       
      assign   cwire[0] = control;
      assign cout    =  cwire[n];
      
        generate
            genvar k ;
            for (k=0 ; k<n ; k=k+1) 
            begin
        
                    assign xor_out[k] = y[k]^control;
        
                    FULL_ADDER mo(
                        .cin(cwire[k]),
                        .y(xor_out[k]),
                        .x(x[k]),
                        .S(s[k]),
                        .C(cwire[k+1])
            );  
            end
        endgenerate
        
      assign OVERFLOW = (x[n-1]==1 & xor_out[n-1]==1 & s==0 )|(x[n-1]==0& xor_out[n-1]==0& s==0 );
     //assign OVERFLOW = (x[n-1] & xor_out[n-1] &~ s)|(~x[n-1]& ~xor_out[n-1]& s);
    
endmodule

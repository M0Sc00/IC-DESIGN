`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2025 06:15:20 AM
// Design Name: 
// Module Name: UART_rx
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


module UART_rx
#(parameter DBITS = 8 , SB_TICK =16 )
    (
    input clk , reset ,
    input rx , s_tick ,
    output [DBITS-1 : 0] rx_dout,
    output reg rx_done_tick  
    );
    
    localparam   idle  = 0 ,
                 start = 1 ,
                 data  = 2 ,
                 stop  = 3 ;
    
    reg [ 1 :0 ] state_reg , state_next ;
    reg [3 : 0 ] s_reg , s_next ;
    reg [$clog2(DBITS) -1 : 0] n_reg , n_next ;
    reg [DBITS-1 :0 ] b_reg , b_next ;
    
    always@(posedge clk , negedge reset)
    begin
        if(~reset)
            begin
               state_reg <= 'b0 ;
               s_reg <= 'b0;
               n_reg <= 'b0;
               b_reg <= 'b0;
            end
        else
            begin
               state_reg <= state_next ;
               s_reg <= s_next;
               n_reg <= n_next;
               b_reg <= b_next; 
            end 
    end
    
    always@(*)
    begin
        state_next = state_reg;
        s_next = s_reg ;
        n_next = n_reg ;
        b_next = b_reg ;
        case(state_reg)
//CASE 1         
        idle:
            if(~rx)
                begin    
                    s_next = 'b0;
                    state_next = start ;
                end        
//            else
//                    state_next = idle ;
//CASE 2
        start:
            if(s_tick)
            begin
                if(s_reg==7)
                    begin
                            s_next = 'b0 ;
                            n_next = 'b0 ;
                            state_next = data ;
                    end
                else
                    begin
                            s_next = s_reg + 1 ;
                            state_next = start ;
                    end
            end
//            else
//                           state_next = start ;
//CASE 3
        data:
            if(s_tick)
            begin    
                if(s_reg==15)
                begin
                            s_next = 'b0 ;
                            b_next = {rx , b_reg[DBITS-1:1]} ;
                            if(n_next == DBITS -1)
                               state_next = stop ;
                            else
                                begin
                                n_next = n_reg + 1 ;
                                state_next = data ;   
                                end                
                end
             end
//                 else
//                   state_next = data ;
//CASE 4
        stop:
            if(s_tick)
            begin
                    if(s_reg==SB_TICK-1)
                        begin
                                rx_done_tick = 'b1 ;
                                state_next = idle ;
                        end
                     else
                         begin
                                    s_next = s_reg + 1 ;
                                    state_next = stop ;
                         end
            end
//            else
//                                    state_next = stop ;
        default:
                                    state_next = idle ;
        endcase
    end
        
        assign rx_dout = b_reg ; 
    
endmodule

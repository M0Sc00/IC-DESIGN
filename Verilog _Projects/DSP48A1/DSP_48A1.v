`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 08/01/2025 10:23:35 AM
//////////////////////////////////////////////////////////////////////////////////
module DSP48A1(A,B,C,D,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP,CEA ,
CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);

parameter A0REG=0;
parameter A1REG=1; 
parameter B0REG=0;
parameter B1REG=1;
parameter CREG=1;
parameter DREG=1;
parameter MREG=1;
parameter PREG=1;
parameter CARRYINREG=1;
parameter CARRYOUTREG=1;
parameter OPMODEREG=1;
parameter CARRYINSEL="OPMODE5";
parameter B_INPUT = "DIRECT";
parameter RSTTYPE= "SYNC";

input CLK,CARRYIN,RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP,CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP;
input [17:0] A,B,D,BCIN;
input [47:0] C,PCIN;
input [7:0] OPMODE;
output CARRYOUT,CARRYOUTF;
output  [47:0] P,PCOUT;
output  [17:0] BCOUT;
output  [35:0] M;   

wire [17:0] A0_OUT,B0_OUT,D_OUT,ADD_SUB1_RESULT,B1_IN,A1_OUT;
wire [47:0] C_OUT,X_OUT,Z_OUT,P_IN;
wire [17:0] B_IN;
wire [35:0] M_IN;
wire [7:0] opmode;
wire CYI_IN,CIN,CYO_IN;

mux_reg  #(.W(8),.REG(OPMODEREG),.RSTTYPE(RSTTYPE)) OPMODE_REG  (OPMODE,opmode,CEOPMODE,CLK,RSTOPMODE); 
assign B_IN =  (B_INPUT == "DIRECT") ? B:( B_INPUT == "CASCADE") ? BCIN :0; 
mux_reg  #(.W(18),.REG(A0REG),.RSTTYPE(RSTTYPE)) A0_REG  (A,A0_OUT,CEA,CLK,RSTA);
mux_reg  #(.W(18),.REG(B0REG),.RSTTYPE(RSTTYPE)) B0_REG  (B_IN,B0_OUT,CEB,CLK,RSTB);
mux_reg  #(.W(18),.REG(DREG),.RSTTYPE(RSTTYPE)) D_REG  (D,D_OUT,CED,CLK,RSTD);
mux_reg  #(.W(48),.REG(CREG),.RSTTYPE(RSTTYPE)) C_REG  (C,C_OUT,CEC,CLK,RSTC);
assign ADD_SUB1_RESULT =(opmode[6]) ? (D_OUT-B0_OUT):(D_OUT+B0_OUT);
assign B1_IN = (opmode[4]) ? (ADD_SUB1_RESULT):(B0_OUT);
mux_reg  #(.W(18),.REG(A1REG),.RSTTYPE(RSTTYPE)) A1_REG  (A0_OUT,A1_OUT,CEA,CLK,RSTA);
mux_reg  #(.W(18),.REG(B1REG),.RSTTYPE(RSTTYPE)) B1_REG  (B1_IN,BCOUT,CEB,CLK,RSTB);
assign M_IN= BCOUT*A1_OUT;
mux_reg  #(.W(36),.REG(MREG),.RSTTYPE(RSTTYPE)) M_REG  (M_IN,M,CEM,CLK,RSTM);
assign CYI_IN =  (CARRYINSEL == "OPMODE5") ? opmode[5]:( CARRYINSEL == "CARRYIN") ? CARRYIN :0; 
mux_reg  #(.W(1),.REG(CARRYINREG),.RSTTYPE(RSTTYPE)) CYI_REG  (CYI_IN,CIN,CECARRYIN,CLK,RSTCARRYIN);
assign X_OUT = (opmode[1:0] == 2'b00) ? 0 :
             (opmode[1:0] == 2'b01) ? {12'h000,M} :
             (opmode[1:0] == 2'b10) ? P :
             {D[11:0],A[17:0],B[17:0]};
assign Z_OUT = (opmode[3:2] == 2'b00) ? 0 :
             (opmode[3:2] == 2'b01) ? PCIN :
             (opmode[3:2] == 2'b10) ? P :
            C_OUT;
assign {CYO_IN,P_IN}=(opmode[7]) ? (Z_OUT-(X_OUT+CIN)):(Z_OUT+X_OUT+CIN);
mux_reg  #(.W(48),.REG(PREG),.RSTTYPE(RSTTYPE)) P_REG  (P_IN,P,CEP,CLK,RSTP);
mux_reg  #(.W(1),.REG(CARRYOUTREG),.RSTTYPE(RSTTYPE)) CYO_REG (CYO_IN,CARRYOUT,CECARRYIN,CLK,RSTCARRYIN);
assign PCOUT=P;
assign CARRYOUTF=CARRYOUT;
endmodule
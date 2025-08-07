`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Create Date: 08/01/2025 10:26:19 AM
//////////////////////////////////////////////////////////////////////////////////
module DSP_TB();

reg CLK,CARRYIN,RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP,CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP;
reg [17:0] A,B,D,BCIN;
reg [47:0] C,PCIN;
reg [7:0] OPMODE;
wire  CARRYOUT,CARRYOUTF;
wire   [47:0] P,PCOUT;
wire   [17:0] BCOUT;
wire   [35:0] M; 
reg   CARRYOUT_EX,CARRYOUTF_EX;
reg    [47:0] P_EX,PCOUT_EX;
reg    [17:0] BCOUT_EX;
reg    [35:0] M_EX; 

DSP48A1 m1(A,B,C,D,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP,CEA,
CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF) ;  
initial begin 
    CLK=0; 
    forever  
        #1 CLK=~CLK; 
    end
    initial
 begin
{RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP}=8'b11111111;
CARRYIN=$random;
CEA=$random;
CEB=$random;
CEC=$random;
CECARRYIN=$random;
CED=$random;
CEM=$random;
CEOPMODE=$random;
CEP=$random;
A=$random;
B=$random;
D=$random;
BCIN=$random;
C=$random;
PCIN=$random;
OPMODE=$random;
  {CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX}=0;
 @(negedge CLK);
      if({CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}!={CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX}) 
begin
  $display("Error - reset failed"); 
        $stop; 
end

{RSTA,RSTB,RSTC,RSTCARRYIN,RSTD,RSTM,RSTOPMODE,RSTP}=0;
{CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP}=8'hff;
CARRYIN=$random;
PCIN=$random;
BCIN=$random;
A=20;
B=10;
C=350;
D=25;
OPMODE=8'b11011101;
BCOUT_EX=18'hf;
M_EX=36'h12c;  
P_EX=48'h32;
PCOUT_EX=48'h32;
CARRYOUT_EX=0;
CARRYOUTF_EX=0;
repeat(4)@(negedge CLK);
if({CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}!={CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX})
begin
 $display("Error - out path 1 is incorrect"); 
        $stop; 
end

CARRYIN=$random;
PCIN=$random;
BCIN=$random;
A=20;
B=10;
C=350;
D=25;
OPMODE=8'b00010000;
BCOUT_EX =18'h23;
M_EX=36'h2bc;  
P_EX=0;
PCOUT_EX =0;
CARRYOUT_EX = 0;
CARRYOUTF_EX = 0;
repeat(3)@(negedge CLK);
if({CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}!={CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX})
begin
 $display("Error - out path 2 is incorrect"); 
        $stop; 
 end

CARRYIN=$random;
PCIN=$random;
BCIN=$random;
A=20;
B=10;
C=350;
D=25;
OPMODE=8'b00001010;
BCOUT_EX =18'ha;
M_EX=36'hc8;  
P_EX=0;
PCOUT_EX =0;
CARRYOUT_EX = 0;
CARRYOUTF_EX = 0;
repeat(3)@(negedge CLK);
if({CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}!={CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX})
begin
 $display("Error - out path 3 is incorrect"); 
        $stop; 
 end
 CARRYIN=$random;
PCIN=3000;
BCIN=$random;
A=5;
B=6;
C=350;
D=25;
OPMODE=8'b10100111;
BCOUT_EX =18'h6;
M_EX=36'h1e;  
P_EX=48'hfe6fffec0bb1;
PCOUT_EX =48'hfe6fffec0bb1;
CARRYOUT_EX = 1;
CARRYOUTF_EX = 1;
repeat(3)@(negedge CLK);
if({CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}!={CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX})
begin
 $display("Error - out path 4 is incorrect"); 
        $stop; 
end
$stop;
 end

initial begin 
$monitor(" A: %b,B: %b,C: %b,D: %b,CARRYIN: %b, PCIN: %b,BCIN:%b ,OPMODE: %b,{CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M}=%b,{CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX}=%b",A,B,C,D,CARRYIN,PCIN,BCIN,OPMODE,{CARRYOUT,CARRYOUTF,P,PCOUT,BCOUT,M},{CARRYOUT_EX,CARRYOUTF_EX,P_EX,PCOUT_EX,BCOUT_EX,M_EX}); 
end 
endmodule
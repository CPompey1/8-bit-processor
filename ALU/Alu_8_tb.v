`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 07:29:05 PM
// Design Name: 
// Module Name: Alu_8_tb
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
// Code your testbench here
// or browse Examples
module alu_8_tb;
  reg [7:0] a;
  reg [7:0] b;
  reg aluOp;
  wire [7:0] out;
  wire _;
  reg i;
  
  Alu_8 alu(.a(a),
        .b(b),
        .out(out),
        .cout(_),
        .aluOp(aluOp));
  
  initial begin 
    a = 0;
    b = 0;
    aluOp = 0;
    $monitor ("a=%d b=%d aluOp=%d out=%d",a,b,aluOp,out);
    
  end
   
  //Testing  Alu add
  initial begin
    aluOp =0;
    for (i = 0; i < 10; i = i+1) begin
      #10 a =$urandom%100;
      	  b = $urandom%100;
    end
  end
    
  //Testing Alu sll
  initial begin
    aluOp = 1;
    for (i = 0; i < 10; i = i+1) begin
      #10 a =$urandom%50;
      	  b = $urandom%5;
    end
  end
  
  
    
    initial begin
      $dumpvars;
      $dumpfile("dump.vcd");
    end
     
endmodule

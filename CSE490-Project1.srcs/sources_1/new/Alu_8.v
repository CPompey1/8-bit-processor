`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 07:27:49 PM
// Design Name: 
// Module Name: Alu_8
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


module Alu_8(   input[7:0] a,
                input[7:0] b,
                output reg [7:0]  out,
                output reg cout,	
                input aluOp
    );
    
      
 //Always
  always @ (a or b or aluOp) begin
    
    //if op[1] & 1
    if (aluOp == 1'b1) begin
      
      //sll(a,b,c)
      {cout,out} = a << b;
      
    //else if op[0] & 1
    end else begin
  
      //out = a + b
      {cout,out} = a + b;
    end
    
   
  end
//add(a,b,c)
endmodule


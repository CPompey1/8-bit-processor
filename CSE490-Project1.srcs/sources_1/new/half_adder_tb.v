`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2023 06:08:36 PM
// Design Name: 
// Module Name: half_adder_tb
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


`include "half_adder.v"
 
module half_adder_tb;
 
  reg r_BIT1 = 0;
  reg r_BIT2 = 0;
  wire w_SUM;
  wire w_CARRY;
   
  half_adder half_adder_inst
    (
     .i_bit1(r_BIT1),
     .i_bit2(r_BIT2),
     .o_sum(w_SUM),
     .o_carry(w_CARRY)
     );
 
  initial
    begin
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b0;
      #10;
      $display("out: %d",o_sum);
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b1;
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b0;
      $display("out: %d",o_sum);
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b1;
      $display("out: %d",o_sum);
      #10;
    end 
 
endmodule // half_adder_tb
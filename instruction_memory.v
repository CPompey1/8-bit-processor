`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Caroline Hart
// 
// Create Date: 03/13/2023 04:44:49 PM
// Design Name: instruction memory
// Module Name: instruction_memory
// Project Name: CSE 490 Project 1
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


module instruction_memory(read_address, writedata, instruction);
  input wire[7:0] read_address; // declare read_address as an 8-bit input
  output reg[7:0] instruction;	// declare instruction as an 8-bit output
    
  /* */
  reg [7:0] test_mem_addr [24:0];	// declare an array of size 25 where each entry has 8-bits each
  reg [7:0] test_mem_instr [24:0];	// declare an array of size 25 where each entry has 8-bits each

  /* Initialize memory addresses & corresponding instructions from .txt files */
  initial $readmemb("instruction_mem_addr.txt", test_mem_addr);
  initial $readmemb("instruction_mem_instr.txt", test_mem_instr);
  
  
  /* Iterate through memory addresses, when the corresponding mem address is found
   * 	set the instruction (output) equal to the instruction at that index */
  integer i;
  initial for (i=0; i<25; i=i+1)
    begin
      if (read_address == test_mem_addr[i]) begin
        assign instruction = test_mem_instr[i];
      end
    end
    
endmodule

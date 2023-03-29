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


module instruction_memory(read_address, instruction);
  input wire[7:0] read_address; // declare read_address as an 8-bit input
  output reg[7:0] instruction;	// declare instruction as an 8-bit output
  
    /* Initialize variable for instruction memory. Max memory size is 256 bytes, so array has size of 8-bits per entry times 256 possible memory addresses*/
  reg [7:0] instr_mem [255:0];

  /* Initialize memory addresses & corresponding instructions from .txt files */
  initial $readmemb("instruction_memory.txt", instr_mem);
  
  
  /* The always statement runs whenever the inputs are updated */ 
  always @(read_address)
    begin
      /* Set instruction(output) equal to the contents of instruction memory at index read_address(input)*/
      assign instruction = instr_mem[read_address];
    end
  
endmodule
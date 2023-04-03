`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 02:46:41 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input [7:0] instructionAddress,
    output reg [7:0] currentInstructionAddress
    );
    
  
  always @(instructionAddress)
    begin
      currentInstructionAddress = instructionAddress;
    end
endmodule

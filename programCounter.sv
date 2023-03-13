// Code your design here
module programCounter(instructionAddress,outputInstructionAddress);
  
  input [7:0] instructionAddress;
  output [7:0] outputInstructionAddress;
  
  assign outputInstructionAddress = instructionAddress;
  
endmodule
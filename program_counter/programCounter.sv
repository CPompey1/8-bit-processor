// Code your design here
module programCounter(instructionAddress,currentInstructionAddress,nextInputInstructionAddress);
  
  input [7:0] instructionAddress;
  output [7:0] currentInstructionAddress,nextInputInstructionAddress;
  reg currentInstructionAddress,nextInputInstructionAddress;
  
  always @(instructionAddress)
    begin
      	assign currentInstructionAddress = instructionAddress;
  		assign nextInputInstructionAddress = instructionAddress + 1;
    end
endmodule
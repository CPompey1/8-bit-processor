// Code your design here
module programCounter(instructionAddress,currentInstructionAddress);
  
  input [7:0] instructionAddress;
  output [7:0] currentInstructionAddress;
  reg currentInstructionAddress;
  
  always @(instructionAddress)
    begin
      	assign currentInstructionAddress = instructionAddress;
    end
endmodule
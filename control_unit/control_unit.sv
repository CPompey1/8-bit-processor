/* ***************************************************************\
| Name of program: control_unit
| Author: U Shin
| Date Created: 3/21/2023
| Date last updated: 3/27/2023
| Function: The control unit is responsible for setting all the control 
| signals so that each instruction is executed properly 
| Additional Comments: None
\****************************************************************/

`timescale 10ns/100ps

module control_unit(InputBits, RegWrite, ALUop, ALUsrc, MemRead, MemWrite, MemToReg);
 
 input [2:0] InputBits; // There are total of 8 bits but we only care about 3 bits which is [7:5]
  
  output reg RegWrite, ALUop, ALUsrc, MemRead, MemWrite, MemToReg; // control signals that is used 
  																   // for each instruction 
  
  always @ (InputBits) // repeatedly check the input bits for all the conditions below
    begin
      if (InputBits[2:0] == 3'b000) // for add, opcode = 000, R-type
        begin
          RegWrite <= 1; // in add, writes to register  
          ALUop <= 0;	 // not use
          ALUsrc <= 0; 	 // not use
          MemRead <= 0;  // not use
          MemWrite <= 0; // not use
          MemToReg <= 0; // not use
        end
      
      else if (InputBits[2:0] == 3'b100) // for addi, opcode = 100, I-type
        begin
          RegWrite <= 1; // addi writes to register
          ALUop <= 0;    // not use
          ALUsrc <= 1;	 // addi goes into the ALU source
          MemRead <= 0;  // not use
          MemWrite <= 0; // not use
          MemToReg <= 0; // not use
        end 
      
      else if (InputBits[2:0] == 3'b101)	// for sw, opcode = 101, I-type
        begin
          RegWrite <= 0; // not use	
          ALUop <= 0;    // not use
          ALUsrc <= 1;	 // sw goes into the ALU source 
          MemRead <= 0;  // not use
          MemWrite <= 1; // sw writes to memory
          MemToReg <= 1; // in sw, memory to register is applied
        end 
      	
      else if (InputBits[2:0] == 3'b110)	// for lw, opcode = 110, I-type
        begin
          RegWrite <= 0; // not use
          ALUop <= 0;    // not use
          ALUsrc <= 1;	 // lw goes into the ALU source
          MemRead <= 1;	 // lw have to read from memory 
          MemWrite <= 0; // not use
          MemToReg <= 1; // in lw, memory to register is applied
        end 
      
      else if (InputBits[2:0] == 3'b111)	// for sll, opcode = 111, R-type
        begin
          RegWrite <= 1; // sll write to register
          ALUop <= 0;	 // not use
          ALUsrc <= 1;	 // in sll, it goes into the ALU source
          MemRead <= 0;  // not use
          MemWrite <= 0; // not use
          MemToReg <= 0; // not use
        end 
  	end
        
endmodule

`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 01:21:23 PM
// Design Name: 
// Module Name: mips_cpu_8
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

// Code your design here
module mips_cpu_8;
  
  wire [7:0] adder_to_pc, pc_to_instr_mem, 	instruction, readData1, readData2, aluResult, writeRegData, writeMemData,signExtend_out,alu_src_mux_out,mem_data_out;
  
  wire [2:0] controlOp, signExtend_in;
  
  wire regWrite, memWrite, aluOp, aluSrc, memToReg,rd,rs,_;
  
  
  supply0 gnd;
  supply1 vcc;
  
  
  //Instatiating modules
  program_counter pc (.instructionAddress(adder_to_pc),      
                        .currentInstructionAddress(pc_to_instr_mem));
  
  Alu_8 adder (.a(pc_to_instr_mem),
               .b(8'b1),
               .out(adder_to_pc),
               .cout(_),	
               .aluOp(gnd)
    			);
  
  instruction_memory instru_mem (.read_address(pc_to_instr_mem),
                                 .instruction(instruction));
  
  register_file_8 register_file (.rd(instruction[4]),
                                 .rs(instruction[3]),
                                 .regWrite(regWrite),
                                 .writeData(writeRegData),
                               .outData0(readData2),
                               .outData1(readData1));
  
  control_unit control (.InputBits(instruction[7:5]),
                             .RegWrite(regWrite), 
                             .ALUop(aluOp), 
                             .ALUsrc(aluSrc), 
                             .MemWrite(memWrite), 
                             .MemToReg(memToReg));
	
  sign_extension sign_extension(.extended_bits(signExtend_out), 
                                .input_bits(signExtend_in));
  
  multiplexor aluSrcMux (.input1(readData2),
                         .input2(signExtend_out),
                         .selector(aluSrc), 
                         .output1(alu_src_mux_out));
  
  multiplexor memToRegMux (.input1(aluResult),
                         .input2(mem_data_out),
                         .selector(memToReg), 
                         .output1(writeRegData));
  
  
  
  Alu_8 alu (.a(readData1),
             .b(alu_src_mux_out),
             .out(aluResult),
             .cout(_),	
             .aluOp(aluOp));
  
  data_memory dataMemory(.address(alu_src_mux_out), 
              .write_data(readData2), 
              .memwrite(memWrite),
              .data_out(mem_data_out));
 endmodule
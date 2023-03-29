`timescale 1ns / 1ps

// Code your testbench here
// or browse Examples

module instruction_memory_tb;
  reg [7:0] read_address;
  wire [7:0] instruction;
  
  instruction_memory dut(.read_address(read_address), .instruction(instruction));
  
  initial begin
    $monitor("address=%b \t instruction=%b", read_address, instruction);
    
    $display("Test 1");
    // should return 10010001
    assign read_address = 8'b00001011;
    #20 // wait 20ns before running next test
    
    
    $display("\nTest 2");
    // should return 11101101
    assign read_address = 8'b00010100;
    #20 // wait 20ns before running next test
    
    $display("\nTest 3");
    // should return 10000001
    assign read_address = 8'b00001000;
  end
endmodule
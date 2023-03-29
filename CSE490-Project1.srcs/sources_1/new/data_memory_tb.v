`timescale 1ns / 1ps
/* ***************************************************************\
| Name of program: CSE 490 Project 1
| Author: Caroline Hart
| Date Created: 03/21/2023
| Date last updated: 03/23/2023
| Function: Data Memory Testbench
| Method: ( brief description how the program works )
| Additional Comments: ( Note anything you think important )
\****************************************************************/


module data_memory_tb;
  reg [7:0] address;
  reg [7:0] write_data;
  reg memwrite;
  wire [7:0] data_out;
  reg[7:0] data_memory[255:0];
  
  data_memory dut(.address(address), .write_data(write_data), .memwrite(memwrite), .data_out(data_out));
  
  initial begin
    $monitor("address=%b \t write_data=%b \t memwrite=%b \t data_out=%b", address, write_data, memwrite, data_out);
    
    $display("Test 1");
    /* read from memory at address b00000000
     * should return data_out=b00000000 */
    assign address = 8'b00000000;
    assign write_data = 8'b00000000; // dont care
    assign memwrite = 1'b0;
    #20 // wait 20 ns before running next test
    
    $display("\nTest 2");
    /* read from memory at address b00011100
     * should return data_out=b011111111 */
    assign address = 8'b00011100;
    assign write_data = 8'b00000000; // dont care
    assign memwrite = 1'b0;
    #20 // wait 20ns before running next test
    
    $display("\nTest 3");
    /* read from memory at address b11111111
     * should return data_out=b01010101 */
    assign address = 8'b11111111;
    assign write_data = 8'b00000000; // dont care
    assign memwrite = 1'b0;
    #100 // wait 100ns before running next test
    
    $display("\nTest 4");
    /* write to memory at address b00100100
     * check line 37 in file data_memory.txt; should contain b11100110 */
    assign address = 8'b00100100;
    assign write_data = 8'b11100110;
    assign memwrite = 1'b1;
    //$readmemb("data_memory.txt", data_memory);
    //$displayb(data_memory[36]);
    #100 // wait 100ns before running next test
    
    $display("\nTest 5");
    /* write to memory at address b00110101
     * check line 54 in file data_memory.txt; should contain b01010101 */
    assign address = 8'b00110101;
    assign write_data = 8'b01010101;
    assign memwrite = 1'b1;
   	//$readmemb("data_memory.txt", data_memory);
    //$displayb(data_memory[53]);
    #100 // wait 100ns before running next test
    
    
    $display("\nTest 6");
    /* write to memory at address b11111110
     * check line 255 in file data_memory.txt; should contain b00001111 */
    assign address = 8'b11111110;
    assign write_data = 8'b00001111;
    assign memwrite = 1'b1;
    //$readmemb("data_memory.txt", data_memory);
    //$displayb(data_memory[254]);
    
  end
endmodule
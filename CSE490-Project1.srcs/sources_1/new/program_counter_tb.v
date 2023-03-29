`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 02:51:32 PM
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb(

    );
    
    reg [7:0]instructionAddress;
   wire [7:0]currentInstructionAddress,nextInputInstructionAddress;
  
  program_counter instName(.instructionAddress(instructionAddress),.currentInstructionAddress(currentInstructionAddress));
  
  initial
    begin
      instructionAddress = 00000000;
    end
  
  always 
    begin
      
      #5 instructionAddress = 1;
      #5 instructionAddress = 2;
      #5 instructionAddress = 3;
      #5 instructionAddress = 4;
      #5 instructionAddress = 5;
      #5 instructionAddress = 6;
      #5 instructionAddress = 7;

    end
  
   initial
    begin
      //create file
      $dumpfile("program_counter.vcd");
      //associate dumping the variables
      $dumpvars;
    end
  
  initial
    begin
      $display("InputAddress\tCurrentAddress");
      $monitor("%b\t%b",instructionAddress,currentInstructionAddress);
    end  
  
      //make sure it ends
initial #200 $finish; 
  //begin is a special keyword 
  //initial is too! 
  // #100 is a time description 
  //how long to observe the signals
  //$finish this is a directive 
  //what this does: after 100 time units stop
  //in the future there is only one thing to change
  //the time value


//close module
endmodule

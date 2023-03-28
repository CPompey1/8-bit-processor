`timescale 1ns/100ps
module t_programCounter;
  
  reg [7:0]instructionAddress;
  wire [7:0]currentInstructionAddress,nextInputInstructionAddress;
  
  programCounter instName(.instructionAddress(instructionAddress),.currentInstructionAddress(currentInstructionAddress),.nextInputInstructionAddress(nextInputInstructionAddress));
  
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
      $dumpfile("programCounter.vcd");
      //associate dumping the variables
      $dumpvars;
    end
  
  initial
    begin
      $display("InputAddress\tCurrentAddress\tNextAddress");
      $monitor("%b\t%b\t%b",instructionAddress,currentInstructionAddress,nextInputInstructionAddress);
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


endmodule
//close module

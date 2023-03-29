`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 03:43:24 PM
// Design Name: 
// Module Name: multiplexor_8_tb
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


module multiplexor_8_tb(

    );
    
  reg [7:0]input1,input2;
  reg selector;
  wire [7:0]output1;
  
  multiplexor instName(.input1(input1),.input2(input2),.selector(selector),.output1(output1));
  
  initial
    begin
      input1 = 00000000;
      input2 = 00000000;
      selector = 0;
    end
  
  always 
    begin
      
      #5 input1 = 0; input2 = 0; selector = 0;
      #5 input1 = 20; input2 = 10; selector = 1;
      #5 input1 = 10; input2 = 20; selector = 0;
      #5 input1 = 908; input2 = 541; selector = 1;

    end
  
   initial
    begin
      //create file
      $dumpfile("multiplexor.vcd");
      //associate dumping the variables
      $dumpvars;
    end
  
  initial
    begin
      $display("Input1\t\tInput2\t\tSelector\tOutput\t");
      $monitor("%b\t%b\t%b\t%b\t",input1,input2,selector,output1);
    end  
  
      //make sure it ends
initial #30 $finish; 
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

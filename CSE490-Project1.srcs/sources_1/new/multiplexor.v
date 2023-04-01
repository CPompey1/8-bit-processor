`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 02:46:41 PM
// Design Name: 
// Module Name: multiplexor
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


module multiplexor(
    input [7:0] input1,
    input [7:0] input2,
    input selector,
    output reg [7:0] output1
    );

  always @(input1||input2||selector)
  begin
    if (selector == 0)
      begin
      	 output1 = input1;
      end
    else     	
      begin								
      	 output1 = input2;
      end
  end


endmodule

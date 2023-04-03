`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 01:18:13 PM
// Design Name: 
// Module Name: register_file_8
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
//Register_File(rd,rs,regWrite, writeData, outData0,outData1
module register_file_8(input rd,
                       input rs,
                       input regWrite,
                       input [7:0] writeData,
                       output reg [7:0] outData0,
                       output reg [7:0] outData1
                      );
  reg [7:0] registerList [1:0]; 	 
  
	//initial
  	initial begin
      	//reg r0 [7:0] = 0
      registerList[0] = 0;
      	//Reg r1 [7:0] = 0
      registerList[1] = 0;
    end	
		
	
	//Always
  always @ (rd or rs or regWrite or writeData) begin
		
    //if its a register  write operation
    if (regWrite) begin 
      registerList[rd] = writeData;
      outData1 = registerList[rd];
      outData0 = registerList[rs];

     //Else its a register read operation 
    end else begin 
      outData1 = registerList[rd];
      outData0 = registerList[rs];
    end
  end
//outData1 = r0
endmodule
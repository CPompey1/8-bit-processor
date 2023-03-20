`timescale 1ns/100ps
/* ***************************************************************\
| Name of program: sign_extension
| Author: U Shin
| Date Created: 3/15/2023
| Date last updated: 3/20/2023
| Function: Sign extension is applied when the input is negative 
| Extended 4 bits will be added as 1s and 0s if it's postive
| Additional Comments: None
\****************************************************************/


module sign_extension(output [7:0] extended_bits, input [2:0] input_bits);
  reg [7:0] extended_bits;
  wire [2:0] input_bits; 
  
  always @ (input_bits)
    begin
        extended_bits[7:0] <= input_bits[2:0]; //looking at the 3rd bit  
  	end
        
endmodule

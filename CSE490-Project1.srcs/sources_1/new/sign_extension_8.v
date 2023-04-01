/* ***************************************************************\
| Name of program: sign_extension
| Author: U Shin
| Date Created: 3/15/2023
| Date last updated: 3/27/2023
| Function: Sign extension is applied when the input is negative 
| Extended 4 bits will be added as 1s and 0s if it's postive
| Additional Comments: None
\****************************************************************/

`timescale 10ns/100ps

module sign_extension(output reg [7:0] extended_bits, input [2:0] input_bits);

  always @ (input_bits) // constant checking for input bits
    begin
      extended_bits[7:0] = input_bits[2:0]; // looking at the 3rd bit, checking if 1 which negative or 0 which is positive
  	end
        
endmodule
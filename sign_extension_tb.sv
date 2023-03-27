/* ***************************************************************\
| Name of program: sign_extension_tb
| Author: U Shin
| Date Created: 3/15/2023
| Date last updated: 3/27/2023
| Function: Test bench for sign_extension module
| Additional Comments: None
\****************************************************************/

`timescale 10ns/100ps

module sign_extension_tb;

    reg [2:0] input_bits_tb;	 // Inputs
    wire [7:0] extended_bits_tb; // Outputs

    sign_extension dut(
      .input_bits(input_bits_tb), 
      .extended_bits(extended_bits_tb)
    ); // Instantiate the DUT
  
    initial //waveform generation code
    begin
      $dumpfile("sign_ext.vcd");
      $dumpvars;
    end
  
  //initial block for variables;
  initial
    begin
        input_bits_tb = 0; // Initialize Inputs
    end
  
    initial 
      begin
        input_bits_tb = 101; // for negative test = 101
        					 // for postive test = 001
		#10;
        if (extended_bits_tb == 11111101) // for negative test = 11111101
          								  // for positive test = 00000001
          $display("Result: Positive"); // result for positive outcome
        else	
          $display("Result: Negative"); // result for negative outcome 
    end 

endmodule

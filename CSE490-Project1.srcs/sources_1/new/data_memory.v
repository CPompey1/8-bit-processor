`timescale 1ns / 1ps
/* ***************************************************************\
| Name of program: CSE 490 Project 1
| Author: Caroline Hart
| Date Created: 03/21/2023
| Date last updated: 03/23/2023
| Function: Data Memory
| Method: ( brief description how the program works )
| Additional Comments: ( Note anything you think important )
\****************************************************************/


module data_memory(address, write_data, memwrite, data_out);
  input wire[7:0] address;		// 8-bit address to read from/write to
  input wire[7:0] write_data;	// 8-bit data to be written to memory
  input wire memwrite;			// 1-bit control to tell us if we are writing or reading
  output reg[7:0] data_out;		// 8-bit data that was read from memory
  
  /* Initialize variable for data memory. Max memory size is 256 bytes, so array has size of 8-bits per entry times 256 possible memory addresses*/
  reg[7:0] data_memory[255:0];
  
  /* Initialize variable for file */
  integer file, i;
  
  
  /* The always statement runs whenever the inputs are updated */ 
  always @(address[7:0])
    begin
      /* initialize data_memory from text file */
      $readmemb("data_memory.txt", data_memory); // This needs to be continuously updated, which is why I put it within the always statement
      
      // moved fopen out of the if statement for debug/testing purposes

      
      /* if memwrite control bit is 1, we are writing to the data memory */
      if (memwrite == 1'b1) begin
        /* Write the contents of write_data to memory at address.
         * Data_out need not be updated since we are not reading from memory */ 
         
        file = $fopen("data_memory.txt","w");	// open the file in write mode
        /* according to https://www.chipverify.com/verilog/verilog-file-io-operations,
         * opening a file in write mode (assuming the file exists) will:
         * 		truncate the file to zero length and overwrite it. 
         * Since the file contents will effectively be deleted, we must rewrite the 
         * entire contents of the file each time a write operation occurs */


        data_memory[address] = write_data;
        for(i=0; i<256; i=i+1)begin
          $fdisplayb(file, data_memory[i]);
        end
  
        
        // the only difference between fwrite and fdisplay is that fdisplay adds the newline char to the end of the string
		// moved fclose out of if statement for debug/testing purposes
      	$fclose(file);	// close the file
      end


      /* if memwrite control bit is 0, we are reading from the data memory */
      else begin
        assign data_out = data_memory[address];
        /* Read the contents of memory at address and update data_out to reflect 
         * memory that was read. Ignore input write_data since we are reading from memory. */
      end
      

    end
endmodule
// Code your design here

module multiplexor(input1,input2,selector,output1);
	
  input [7:0] input1,input2;
  input selector;
  output [7:0] output1;
  reg [7:0] output1;
initial
  begin
    if (selector == 0)
      begin
      	assign output1 = input1;
      end
    else     	
      begin								
      	assign output1 = input2;
      end
  end


endmodule
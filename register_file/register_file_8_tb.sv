// Code your testbench here
// or browse Examples
module register_file_8_tb;
  
  reg rd,rs;
  reg [7:0] dummyDataIn;
  wire [7:0] dummyDataOut0,dummyDataOut1;
  reg readWrite;
  register_file_8 tb (.rd(rd),
                      .rs(rs),
                      .regWrite(readWrite),
                      .writeData(dummyDataIn),
                      .outData0(dummyDataOut0),
                      .outData1(dummyDataOut1));


  //Set vars
  initial begin
    assign rd = 0;
    assign rs = 0;
    assign readWrite = 0;
    $monitor("rd: %d, rs: %d regWrite: %d writeData: %d outData0: %d outData1: %d",rd,rs,readWrite,dummyDataIn,dummyDataOut0,dummyDataOut1);

  end
  //Testing initial read
  initial begin
    $display("Testing inital read");
    assign rs = 1;
    assign rd = 0;
    assign readWrite = 0;
  end

  //Testing writing dummmy data
  initial begin
    $display("Testing inital write" );
    assign dummyDataIn = $urandom%255;
    assign rd = $urandom%2;
    assign readWrite = 1;
  end
  //Testing reading dummy data
  initial begin
    $display("Testing write after");
    assign readWrite = 0;
    assign rs = $urandom%2;
    assign rd = $urandom%2;
  end
endmodule

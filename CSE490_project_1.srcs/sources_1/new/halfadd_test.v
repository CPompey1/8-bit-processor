`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2023 08:22:40 PM
// Design Name: 
// Module Name: halfadd_test
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


module halfadd_test;
    reg X,Y,C,S;
    
    initial begin
        $monitor("X=%b,Y=%b,C=%b,S=%b",X,Y,C,S);
        X=0;
        C=0;
        
        #5 X = 1;
        #10 X = 0;
        #10 Y = 0;
        #10 Y = 1;
        #10 $finish;
    end
    
    test_half_adder(.X(X),.Y(Y),.C(C),.S(S));
endmodule

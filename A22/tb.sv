/*Assignment agenda:

Check the design intent: "y must equal the sum of a and b". Insert your assert check inside the RTL code on the Instruction tab.

Check the design intent for 4-bit AND gate 

*/


`timescale 1ns / 1ps
module tb;
  
  reg [3:0] a, b;
  wire [3:0] y;
  
  and2 dut (a, b, y);
  
  initial begin
    for(int i = 0; i < 10; i++) begin
      a = $urandom;
      b = $urandom;
      #10;
    end   
  end
  
  
   initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #110;
    $finish();
  end
  
  
endmodule

/*Assignment agenda:

Check the behavior of D flipflop : "dout must be zero if rst is active high, otherwise dout should follow din " . Insert your assert check in the RTL code given in the instructions tab.

Student's note, failure at the start at 5s due to DUT still processing the data.

*/


`timescale 1ns / 1ps
module tb;
  
  logic din,clk,rst,dout;
  
  dff dut (din, clk, rst, dout);
  
  initial begin
    clk = 0;
  end
  
  always #5 clk = ~clk;
  

  always begin
    @(posedge clk)
    din = $urandom();
    rst = $urandom();
    
  end
  
   initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #110;
    $finish();
  end
  
  
endmodule

/*Assignment agenda:

if a becomes true in current clock tick then b must also become true in the next clock tick. Evaluate the property on positive edge of the clock. Only Implication Operators and Boolean Operators are allowed.

*/


`timescale 1ns / 1ps
module tb;
  reg a = 0, b = 1;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 1;
    #7;
    a = 0;
    #30;
    a = 1; 
    #30;
    a = 1;
  end
  
    initial begin
    b = 1;
    #7;
    b = 0;
    #10;
    b = 1; 
    #30;
    b = 1;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
 
///Add your code here
  
  always begin
    assert property(@(posedge clk) a |=> b) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());
  end
                              
endmodule

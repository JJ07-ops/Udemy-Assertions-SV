/*Assignment agenda:

When b becomes high, b should remain stable for two consecutive ticks and then deassert. a should remain low throughout the sequence.

*/

module tb;
  reg a = 0, b = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 0;
    #40;
    a = 1;
  end
  
  initial begin
    b = 0;
    #14;
    b = 1;
    #20;
    b = 0;
  end
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #120;
    $finish();
  end
 
  
//// add your code  here for property 1 and property 2


  
  P1: assert property(@(posedge clk) $rose(b) |-> !a throughout (b[*2] ##1 !b) ) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

      
endmodule

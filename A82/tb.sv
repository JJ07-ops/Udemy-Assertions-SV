/*Assignment agenda:

If a assert then a must remain true until en remains true.

*/

module tb;
  reg a = 0, b = 0,en = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
 
  
  initial begin
    en = 1;
    a = 1;
    #20;
    a = 0;
    b = 1;
    #30;
    b = 0;
    en = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
//// add your code  here for property 1 and property 2


  
  P1: assert property(@(posedge clk) $rose(a) |-> strong(a[*0:$] ##1 en) ) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

      
endmodule

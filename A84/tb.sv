/*Assignment agenda:

if start assert then there should be single request from a between two b requests.
Student's note: only waveform was given in the question so code was written from scratch.

*/

module tb;
  reg a = 0, b = 0, start = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    start = 0;
    #5;
    start = 1;
    #10;
    start = 0;
    b = 1;
    #10;
    b = 0;
    a = 1;
    #10;
    a = 0;
    b = 1;
    #10;
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


  
  P1: assert property(@(posedge clk) $rose(start) |-> (b[->1] and !a)##1 (a[->1] and !b) ##1 (b[->1] and !a)) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

      
endmodule

/*Assignment agenda:

if signal a assert then it should deassert in next clock tick.

Check the behavior of signal a.

*/


module tb;
  reg a = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
 
  //always #10 a = ~a;
  //always #10 b = ~b;
 
initial begin
  #10;
  a = 1;
  #20;
  a = 0;
  #30;
  a = 1;
  #10;
  a = 0;
end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
///add your code here
  always begin
    assert property(@(posedge clk) $rose(a) |=> $fell(a)) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());
  end
  
endmodule

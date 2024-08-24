/*Assignment agenda:

Assume we are generating random data for a block shop (RAM) and the read latency of BRAM is two clock cycles. Verify that the rd remains high for two clock ticks after user deassert rst.

Check rd remains high for two clock ticks.

*/


module tb;
  reg rd = 0;
  reg rst = 1;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  initial begin
    #40;
    rst = 0;
    rd = 1;
    #20;
    rd = 0;
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
    assert property(@(posedge clk) $fell(rst) |=> $stable(rd)) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());
  end
  
endmodule

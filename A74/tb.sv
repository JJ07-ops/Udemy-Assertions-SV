/*Assignment agenda:

1) If rst deassert and CE assert then read must stay high for two clock ticks when user recieve rd request. 

2) If rd assert then addr must remain stable for two consecutive clock ticks. 

3) Evaluate the property on positive edge of the clock.

*/


module tb;
  
  reg clk = 0, rd = 0, rst = 0, ce = 0;
  always #5 clk = ~clk;
  
  reg [7:0] addr;
  integer i = 0;
  
    
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
initial begin
  rst = 1;
  #10;
  ce = 1;
  rst = 0;
  #30;
  rd =1;
  #20;
  rd = 0;
end
  
  initial begin
    for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
      @(posedge clk);
    end
    
      for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
    end
    
  end
  
//// add your code  here for property 1 and property 2
  
always begin
  
  P1: assert property(@(posedge clk) ($rose(ce) && $fell(rst)) |-> strong(##[0:$] rd[*2]) ) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

    
    P2: assert property(@(posedge clk) $rose(rd) |=> $stable(addr)) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

      end 
      
endmodule

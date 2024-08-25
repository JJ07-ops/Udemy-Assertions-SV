/*Assignment agenda:

if signal a asserts, then signal c should assert within 1 to 5 clock cycles, followed by signal b becoming high. signal ce should remain high for entire duration of this sequence.

*/

module tb;
  reg a = 0, b = 0, c = 0,ce = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    #20;
    a = 1; 
    #10;
    a = 0;
   end
  
  initial begin
    #49;
    b = 1;
    #10;
    b = 0;
  end
  
    initial begin 
    #40;
    c = 1;
    #10;
    c = 0;
  end
  
  initial begin
    #15;
    ce = 1;
    #60;
    ce = 0;
    
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
//// add your code  here for property 1 and property 2
  sequence first; //not used
   a[*2];
  endsequence


  sequence second;
    ##[1:5] $rose(c) ##1 $rose(b);
  endsequence

  
  P1: assert property(@(posedge clk) $rose(a) |-> ce throughout second ) $info("Success at time : %0t", $time());else $error("Failure at time : %0t", $time());

      
endmodule

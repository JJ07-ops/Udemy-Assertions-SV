//design code given in the question (modified by the student)

module and2
 
(
 
input [3:0] a,b,
 
output [3:0] y
 
);
 
assign y = a & b;
 
 
 
///////////Add your code here
  
  always@(*) begin
    assert (y == (a & b)) $info("Success at time : %0t",$time()); else $error("Failure at time : %0t",$time());
  
  end
 
/////////End your code here
 
 
 
endmodule

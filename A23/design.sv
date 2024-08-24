//design code given in the question (modified by the student)

module dff
(
input din, clk, rst,
output reg dout  
);
  
  always@(posedge clk)
    begin
      if(rst)
        dout <= 1'b0;
      
      else
        dout <= din;
    end
 
///////////Add your code here
  
  always@(*) begin
    assert final(dout == (din & (!rst))) $info("Success at time : %0t",$time()); else $error("Failure at time : %0t",$time());
    
  
  end
 
/////////End your code here
 
 
 
endmodule

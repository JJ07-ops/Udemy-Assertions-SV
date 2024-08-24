//design code given in the question

module adder(
  input      [3:0] a,b,
  output reg [4:0] s
);
  
  
  always@(*)
    begin
      s = a + b;
    end
 
  
endmodule
  

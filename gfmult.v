module gfmult(
 input [3:0]A,B,
 output wire [3:0]out);

 reg [3:0]a,b,acc;

 always@(*) begin
 a = A;
 b = B;
 acc = 4'b000;

  for(integer i = 0; i < 4; i = i + 1) begin
     if(b[0]) acc = acc ^ a;
     
     if(a[3]) a = (a << 1)^ 4'b0011; // primitive polynomial to replace x^4 with x + 1;
     else a = a << 1;

     b = b >> 1;
  end 
 end 
 assign out = acc;
endmodule 


module tb();
 reg [7:0]A;
 wire [7:0]out;
  s_box dut(A,out);
initial begin
A = 8'hA2;
#2 A = 8'hF1;
#2 A = 8'hF2;
#2 A = 8'hF3;
#2 A = 8'hF4;
#2 A = 8'hF5;
end 
initial begin
$dumpfile("s_box.vcd");
$dumpvars(0,tb);
#20$finish;
end 
endmodule 


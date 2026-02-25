module block_cipher_tb();
 reg clk,rst;
 wire [7:0]data_out;

block_cipher_top dut(.clk(clk),
                 .rst(rst),
                 .encrypted_data(data_out));
 initial begin
  clk = 1'b0;
  rst = 1'b0;
#10 rst = 1'b1;
 end 
 always #5 clk = ~clk;

 initial begin
  $dumpfile("block_cipher.vcd");
  $dumpvars(0,block_cipher_tb);
  #500 $finish;
 end 
endmodule 

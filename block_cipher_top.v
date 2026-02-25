module block_cipher_top(
  input clk,rst,
  output reg [7:0]encrypted_data);

 wire [7:0]lfsr_out;
 wire [7:0]sbox_out_wire,pbox_out_wire,audio_data_reg_w;
 reg  [7:0]sbox_out_reg,lfsr_xord_data_reg;


 always@(posedge clk, negedge rst) begin
   if(!rst) begin
     sbox_out_reg <= 8'h00;
     encrypted_data <= 8'h00;
     lfsr_xord_data_reg <= 8'h00;
   end else begin
    lfsr_xord_data_reg <= lfsr_out ^ audio_data_reg_w;
    sbox_out_reg <= sbox_out_wire;
    encrypted_data <= pbox_out_wire;
  end 
 end
 
 file_reading f0(.clk(clk),
              .audio_data(audio_data_reg_w));


 
 lfsr f2(.clk(clk),
	  .rst(rst),
          .state(lfsr_out));


 
 s_box f3(.plain_data(lfsr_xord_data_reg),
          .swapped_data(sbox_out_wire));       
        
 
 p_box f4(.a(sbox_out_reg),
          .e(pbox_out_wire));


endmodule 

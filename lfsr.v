// polynomial x^7 + x^4 + x^3 + x^2 + 1
// premitive polynomial which produces maximum length sequence
// it repeates the sequnce after 82 clock cycles
// the 5 bits have to be tapped in this lfsr 

module lfsr#(parameter DATA_WIDTH = 8,
		       TP1 = 0, TP2 = 2, TP3 = 3, TP4 = 4, TP5 = 7)(
  input wire clk,rst,
  output reg[DATA_WIDTH-1:0]state);
    wire feedback;
  always@(posedge clk, negedge rst) begin
 if(!rst) begin
   state <= 8'h01;
 end else begin
   state <= {state[DATA_WIDTH-2:0],feedback};
 end 
end 

assign feedback = state [TP5]^state[TP4]^state[TP3]^state[TP2]^state[TP1];
endmodule

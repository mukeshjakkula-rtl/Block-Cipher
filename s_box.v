module s_box(
  input wire [7:0]plain_data,
  output wire [7:0]swapped_data
);
 wire [3:0]a,b;
 wire [3:0]A,B;
 wire [3:0]mux1in1,mux2in1;
 wire mux1sel,mux2sel;

  mux f1(mux1in1,a,mux1sel1,B);
  ord f2(b,mux1sel1); 
  mux f3(mux2in1,b,mux2sel, A);
  ord f4(B,mux2sel);
  gfmult f5(a,b,mux1in1);  //GF multiplication
  gfmult f6(b,B,mux2in1); // GF multiplication     
 

 assign a = plain_data[7:4];
 assign b = plain_data[3:0];          
 assign swapped_data = {A,B}^ 8'b01 ;

endmodule 

// 2:1 mux 4 bit 
module mux(
 input wire [3:0]in1,in0,
 input wire s,
 output wire [3:0]y);

assign y = s ? in1 : in0;
endmodule 

// an or operation fo the given 4 bit input 
module ord(
 input wire [3:0]in,
 output wire y);
wire x,z;

assign x = in[0] | in[1];
assign z = in[2] | in[3];
assign y = x | z;
endmodule 

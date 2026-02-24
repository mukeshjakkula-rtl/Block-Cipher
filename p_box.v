module p_box(
 input wire [7:0]a,
 output wire [7:0]e
);

 assign e[7] = a[5];
 assign e[6] = a[4];
 assign e[5] = a[1];
 assign e[4] = a[0];
 assign e[3] = a[2];
 assign e[2] = a[3];
 assign e[1] = a[6];
 assign e[0] = a[7];
endmodule

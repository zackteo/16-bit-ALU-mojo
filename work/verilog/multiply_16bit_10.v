/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiply_16bit_10 (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    s[0+15-:16] = a[0+15-:16] * b[0+15-:16];
  end
endmodule

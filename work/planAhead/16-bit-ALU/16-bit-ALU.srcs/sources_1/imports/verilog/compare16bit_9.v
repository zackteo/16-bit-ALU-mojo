/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare16bit_9 (
    input [5:0] alufn,
    input z,
    input v,
    input n,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    s[1+14-:15] = 1'h0;
    if (alufn[0+3-:4] == 7'h65) begin
      s[0+0-:1] = n ^ v;
    end
    if (alufn[0+3-:4] == 4'hb) begin
      s[0+0-:1] = z;
    end
    if (alufn[0+3-:4] == 7'h6f) begin
      s[0+0-:1] = (n ^ v) | z;
    end
  end
endmodule
/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [15:0] b,
    input [5:0] alufn
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_s;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .s(M_alu_s)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_3 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_edge_dt_out;
  reg [1-1:0] M_edge_dt_in;
  edge_detector_4 edge_dt (
    .clk(clk),
    .in(M_edge_dt_in),
    .out(M_edge_dt_out)
  );
  localparam IDLE_state = 5'd0;
  localparam ADD_state = 5'd1;
  localparam SUB_state = 5'd2;
  localparam MUL_state = 5'd3;
  localparam CMPEQ_state = 5'd4;
  localparam CMPLT_state = 5'd5;
  localparam CMPLE_state = 5'd6;
  localparam OR_state = 5'd7;
  localparam NOR_state = 5'd8;
  localparam XOR_state = 5'd9;
  localparam A_state = 5'd10;
  localparam B_state = 5'd11;
  localparam AND_state = 5'd12;
  localparam NAND_state = 5'd13;
  localparam SHL_state = 5'd14;
  localparam SHLA_state = 5'd15;
  localparam SHR_state = 5'd16;
  localparam SHRA_state = 5'd17;
  localparam FAIL_state = 5'd18;
  localparam PASS_state = 5'd19;
  
  reg [4:0] M_state_d, M_state_q = IDLE_state;
  reg [27:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    M_alu_a[0+7-:8] = io_dip[0+0+7-:8];
    M_alu_a[8+7-:8] = io_dip[8+0+7-:8];
    M_alu_b[0+15-:16] = b[0+15-:16];
    M_alu_alufn[0+5-:6] = alufn[0+5-:6];
    M_btn_cond_in = io_button[4+0-:1];
    M_edge_dt_in = M_btn_cond_out;
    io_led[0+0+7-:8] = M_alu_s[0+7-:8];
    io_led[8+0+7-:8] = M_alu_s[8+7-:8];
    M_counter_d = M_counter_q + 1'h1;
    if (M_counter_q[0+25-:26] == 1'h0) begin
      
      case (M_state_q)
        IDLE_state: begin
          if (io_button[4+0-:1] == 1'h1) begin
            M_state_d = ADD_state;
          end
        end
        ADD_state: begin
          M_alu_alufn[0+5-:6] = 6'h00;
          M_alu_a[0+15-:16] = 16'h2aab;
          M_alu_b[0+15-:16] = 16'h0008;
          if (M_alu_s == 16'h2ab3) begin
            M_state_d = SUB_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        SUB_state: begin
          M_alu_alufn[0+5-:6] = 6'h01;
          M_alu_a[0+15-:16] = 16'h2aab;
          M_alu_b[0+15-:16] = 16'h0008;
          if (M_alu_s == 16'h2aa3) begin
            M_state_d = MUL_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        MUL_state: begin
          M_alu_alufn[0+5-:6] = 6'h02;
          M_alu_a[0+15-:16] = 16'h0003;
          M_alu_b[0+15-:16] = 16'h0001;
          if (M_alu_s == 16'h0003) begin
            M_state_d = CMPEQ_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        CMPEQ_state: begin
          M_alu_alufn[0+5-:6] = 6'h33;
          M_alu_a[0+15-:16] = 16'h0003;
          M_alu_b[0+15-:16] = 16'h0003;
          if (M_alu_s == 16'h0001) begin
            M_state_d = CMPLT_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        CMPLT_state: begin
          M_alu_alufn[0+5-:6] = 6'h35;
          M_alu_a[0+15-:16] = 16'h0003;
          M_alu_b[0+15-:16] = 16'h0007;
          if (M_alu_s[0+15-:16] == 16'h0001) begin
            M_state_d = CMPLE_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        CMPLE_state: begin
          M_alu_alufn[0+5-:6] = 6'h37;
          M_alu_a = 16'h0003;
          M_alu_b = 16'h002b;
          if (M_alu_s == 16'h0001) begin
            M_state_d = OR_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        OR_state: begin
          M_alu_alufn[0+5-:6] = 6'h1e;
          M_alu_a[0+15-:16] = 16'h00ff;
          M_alu_b[0+15-:16] = 16'h0f0f;
          if (M_alu_s[0+15-:16] == 16'h0fff) begin
            M_state_d = NOR_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        NOR_state: begin
          M_alu_alufn[0+5-:6] = 6'h11;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'hf000) begin
            M_state_d = XOR_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        XOR_state: begin
          M_alu_alufn[0+5-:6] = 6'h16;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'h0ff0) begin
            M_state_d = A_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        A_state: begin
          M_alu_alufn[0+5-:6] = 6'h1a;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'h00ff) begin
            M_state_d = B_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        B_state: begin
          M_alu_alufn[0+5-:6] = 6'h15;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'h0f0f) begin
            M_state_d = AND_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        AND_state: begin
          M_alu_alufn[0+5-:6] = 6'h18;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'h000f) begin
            M_state_d = NAND_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        NAND_state: begin
          M_alu_alufn[0+5-:6] = 6'h17;
          M_alu_a = 16'h00ff;
          M_alu_b = 16'h0f0f;
          if (M_alu_s == 16'hfff0) begin
            M_state_d = SHL_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        SHL_state: begin
          M_alu_alufn[0+5-:6] = 6'h20;
          M_alu_a = 16'h0001;
          M_alu_b = 16'h0001;
          if (M_alu_s == 16'h0002) begin
            M_state_d = SHLA_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        SHLA_state: begin
          M_alu_alufn[0+5-:6] = 6'h22;
          M_alu_a = 16'h0001;
          M_alu_b = 16'h0001;
          if (M_alu_s == 16'h0002) begin
            M_state_d = SHR_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        SHR_state: begin
          M_alu_alufn[0+5-:6] = 6'h21;
          M_alu_a = 16'h8002;
          M_alu_b = 16'h0001;
          if (M_alu_s == 16'h4001) begin
            M_state_d = SHRA_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
        SHRA_state: begin
          M_alu_alufn[0+5-:6] = 6'h23;
          M_alu_a = 16'h8002;
          M_alu_b = 16'h0001;
          if (M_alu_s == 16'hc001) begin
            M_state_d = PASS_state;
          end else begin
            M_state_d = FAIL_state;
          end
        end
      endcase
    end
    
    case (M_state_q)
      IDLE_state: begin
        io_led[16+6+1-:2] = 4'hb;
      end
      ADD_state: begin
        io_led[0+0+0-:1] = 1'h1;
      end
      SUB_state: begin
        io_led[0+1+0-:1] = 1'h1;
      end
      MUL_state: begin
        io_led[0+2+0-:1] = 1'h1;
      end
      CMPEQ_state: begin
        io_led[0+3+0-:1] = 1'h1;
      end
      CMPLT_state: begin
        io_led[0+4+0-:1] = 1'h1;
      end
      CMPLE_state: begin
        io_led[0+5+0-:1] = 1'h1;
      end
      OR_state: begin
        io_led[0+6+0-:1] = 1'h1;
      end
      NOR_state: begin
        io_led[0+7+0-:1] = 1'h1;
      end
      XOR_state: begin
        io_led[8+0+0-:1] = 1'h1;
      end
      A_state: begin
        io_led[8+1+0-:1] = 1'h1;
      end
      B_state: begin
        io_led[8+2+0-:1] = 1'h1;
      end
      AND_state: begin
        io_led[8+3+0-:1] = 1'h1;
      end
      NAND_state: begin
        io_led[8+4+0-:1] = 1'h1;
      end
      SHL_state: begin
        io_led[8+5+0-:1] = 1'h1;
      end
      SHLA_state: begin
        io_led[8+6+0-:1] = 1'h1;
      end
      SHR_state: begin
        io_led[8+7+0-:1] = 1'h1;
      end
      SHRA_state: begin
        io_led[16+0+0-:1] = 1'h1;
      end
      FAIL_state: begin
        io_led[16+4+3-:4] = 4'hf;
      end
      PASS_state: begin
        io_led[16+0+3-:4] = 4'hf;
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_counter_q <= M_counter_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule

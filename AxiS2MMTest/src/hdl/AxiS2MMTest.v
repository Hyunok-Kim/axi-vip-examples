module AxiCtrlS2MM(
  input         clock,
  input         reset,
  input  [31:0] s_axi_araddr,
  input         s_axi_arvalid,
  output        s_axi_arready,
  output [31:0] s_axi_rdata,
  output        s_axi_rvalid,
  input         s_axi_rready,
  input  [31:0] s_axi_awaddr,
  input         s_axi_awvalid,
  output        s_axi_awready,
  input  [31:0] s_axi_wdata,
  input         s_axi_wvalid,
  output        s_axi_wready,
  output        s_axi_bvalid,
  input         s_axi_bready,
  output        start,
  input         done,
  output [31:0] write_addr,
  output [31:0] write_length
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] int_write_addr; // @[AxiCtrlS2MM.scala 14:31]
  reg [31:0] int_write_length; // @[AxiCtrlS2MM.scala 15:33]
  reg [31:0] rdata; // @[AxiCtrlS2MM.scala 19:22]
  reg  rvalid; // @[AxiCtrlS2MM.scala 21:23]
  reg  bvalid; // @[AxiCtrlS2MM.scala 23:23]
  reg  rd_req; // @[AxiCtrlS2MM.scala 30:23]
  reg  wr_req_0; // @[AxiCtrlS2MM.scala 31:23]
  reg  wr_req_1; // @[AxiCtrlS2MM.scala 31:23]
  reg [11:0] rd_addr; // @[AxiCtrlS2MM.scala 32:24]
  reg [11:0] wr_addr; // @[AxiCtrlS2MM.scala 33:24]
  reg [31:0] wr_data; // @[AxiCtrlS2MM.scala 34:24]
  wire [31:0] _GEN_0 = s_axi_awready & s_axi_awvalid ? s_axi_awaddr : {{20'd0}, wr_addr}; // @[AxiCtrlS2MM.scala 37:41 38:13 33:24]
  wire  _GEN_1 = s_axi_awready & s_axi_awvalid | wr_req_0; // @[AxiCtrlS2MM.scala 37:41 39:15 31:23]
  wire  _GEN_3 = s_axi_wready & s_axi_wvalid | wr_req_1; // @[AxiCtrlS2MM.scala 42:39 44:15 31:23]
  wire  _T_3 = ~bvalid; // @[AxiCtrlS2MM.scala 49:16]
  wire [31:0] _GEN_4 = wr_addr == 12'h0 ? wr_data : 32'h0; // @[AxiCtrlS2MM.scala 51:33 52:13 12:9]
  wire [31:0] _GEN_7 = ~bvalid & wr_req_0 & wr_req_1 ? _GEN_4 : 32'h0; // @[AxiCtrlS2MM.scala 49:51 12:9]
  wire  _GEN_11 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiCtrlS2MM.scala 49:51 62:12 23:23]
  wire [31:0] _GEN_15 = bvalid & s_axi_bready ? 32'h0 : _GEN_7; // @[AxiCtrlS2MM.scala 47:33 12:9]
  wire [31:0] _GEN_21 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr}; // @[AxiCtrlS2MM.scala 69:41 70:13 32:24]
  wire  _GEN_22 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiCtrlS2MM.scala 69:41 71:12 30:23]
  wire  _T_11 = ~rvalid; // @[AxiCtrlS2MM.scala 76:16]
  wire [15:0] _GEN_23 = rd_addr == 12'h4 ? {{15'd0}, done} : 16'hdead; // @[AxiCtrlS2MM.scala 77:11 79:33 80:13]
  wire  _GEN_26 = ~rvalid & rd_req | rvalid; // @[AxiCtrlS2MM.scala 76:35 84:12 21:23]
  wire [31:0] _GEN_32 = reset ? 32'h0 : _GEN_21; // @[AxiCtrlS2MM.scala 32:{24,24}]
  wire [31:0] _GEN_33 = reset ? 32'h0 : _GEN_0; // @[AxiCtrlS2MM.scala 33:{24,24}]
  assign s_axi_arready = ~rd_req & _T_11; // @[AxiCtrlS2MM.scala 87:28]
  assign s_axi_rdata = rdata; // @[AxiCtrlS2MM.scala 24:15]
  assign s_axi_rvalid = rvalid; // @[AxiCtrlS2MM.scala 26:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiCtrlS2MM.scala 65:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiCtrlS2MM.scala 66:30]
  assign s_axi_bvalid = bvalid; // @[AxiCtrlS2MM.scala 28:16]
  assign start = _GEN_15[0];
  assign write_addr = int_write_addr; // @[AxiCtrlS2MM.scala 16:14]
  assign write_length = int_write_length; // @[AxiCtrlS2MM.scala 17:16]
  always @(posedge clock) begin
    if (reset) begin // @[AxiCtrlS2MM.scala 14:31]
      int_write_addr <= 32'h0; // @[AxiCtrlS2MM.scala 14:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiCtrlS2MM.scala 47:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlS2MM.scala 49:51]
        if (wr_addr == 12'h10) begin // @[AxiCtrlS2MM.scala 54:33]
          int_write_addr <= wr_data; // @[AxiCtrlS2MM.scala 55:22]
        end
      end
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 15:33]
      int_write_length <= 32'h0; // @[AxiCtrlS2MM.scala 15:33]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiCtrlS2MM.scala 47:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlS2MM.scala 49:51]
        if (wr_addr == 12'h14) begin // @[AxiCtrlS2MM.scala 57:33]
          int_write_length <= wr_data; // @[AxiCtrlS2MM.scala 58:24]
        end
      end
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 19:22]
      rdata <= 32'h0; // @[AxiCtrlS2MM.scala 19:22]
    end else if (!(rvalid & s_axi_rready)) begin // @[AxiCtrlS2MM.scala 74:33]
      if (~rvalid & rd_req) begin // @[AxiCtrlS2MM.scala 76:35]
        rdata <= {{16'd0}, _GEN_23};
      end
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 21:23]
      rvalid <= 1'h0; // @[AxiCtrlS2MM.scala 21:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiCtrlS2MM.scala 74:33]
      rvalid <= 1'h0; // @[AxiCtrlS2MM.scala 75:12]
    end else begin
      rvalid <= _GEN_26;
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 23:23]
      bvalid <= 1'h0; // @[AxiCtrlS2MM.scala 23:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlS2MM.scala 47:33]
      bvalid <= 1'h0; // @[AxiCtrlS2MM.scala 48:12]
    end else begin
      bvalid <= _GEN_11;
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 30:23]
      rd_req <= 1'h0; // @[AxiCtrlS2MM.scala 30:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiCtrlS2MM.scala 74:33]
      rd_req <= _GEN_22;
    end else if (~rvalid & rd_req) begin // @[AxiCtrlS2MM.scala 76:35]
      rd_req <= 1'h0; // @[AxiCtrlS2MM.scala 85:12]
    end else begin
      rd_req <= _GEN_22;
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 31:23]
      wr_req_0 <= 1'h0; // @[AxiCtrlS2MM.scala 31:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlS2MM.scala 47:33]
      wr_req_0 <= _GEN_1;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlS2MM.scala 49:51]
      wr_req_0 <= 1'h0; // @[AxiCtrlS2MM.scala 63:12]
    end else begin
      wr_req_0 <= _GEN_1;
    end
    if (reset) begin // @[AxiCtrlS2MM.scala 31:23]
      wr_req_1 <= 1'h0; // @[AxiCtrlS2MM.scala 31:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlS2MM.scala 47:33]
      wr_req_1 <= _GEN_3;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlS2MM.scala 49:51]
      wr_req_1 <= 1'h0; // @[AxiCtrlS2MM.scala 63:12]
    end else begin
      wr_req_1 <= _GEN_3;
    end
    rd_addr <= _GEN_32[11:0]; // @[AxiCtrlS2MM.scala 32:{24,24}]
    wr_addr <= _GEN_33[11:0]; // @[AxiCtrlS2MM.scala 33:{24,24}]
    if (reset) begin // @[AxiCtrlS2MM.scala 34:24]
      wr_data <= 32'h0; // @[AxiCtrlS2MM.scala 34:24]
    end else if (s_axi_wready & s_axi_wvalid) begin // @[AxiCtrlS2MM.scala 42:39]
      wr_data <= s_axi_wdata; // @[AxiCtrlS2MM.scala 43:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  int_write_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  int_write_length = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rdata = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rvalid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bvalid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rd_req = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wr_req_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wr_req_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rd_addr = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  wr_addr = _RAND_9[11:0];
  _RAND_10 = {1{`RANDOM}};
  wr_data = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpDownLoadCounter(
  input        clock,
  input        reset,
  input        load,
  input        decr,
  input  [7:0] load_value,
  output       is_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] count_r; // @[UpDownLoadCounter.scala 20:24]
  reg  is_zero_r; // @[UpDownLoadCounter.scala 21:26]
  wire [7:0] _count_r_T_3 = count_r - 8'h1; // @[UpDownLoadCounter.scala 30:51]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 34:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 8'hff; // @[UpDownLoadCounter.scala 20:24]
    end else if (load) begin // @[UpDownLoadCounter.scala 26:17]
      count_r <= load_value; // @[UpDownLoadCounter.scala 27:15]
    end else if (decr) begin // @[UpDownLoadCounter.scala 30:30]
      count_r <= _count_r_T_3; // @[UpDownLoadCounter.scala 30:40]
    end
    if (reset) begin // @[UpDownLoadCounter.scala 21:26]
      is_zero_r <= 1'h0; // @[UpDownLoadCounter.scala 21:26]
    end else if (load) begin // @[UpDownLoadCounter.scala 37:17]
      is_zero_r <= load_value == 8'h0; // @[UpDownLoadCounter.scala 37:29]
    end else if (decr) begin // @[UpDownLoadCounter.scala 39:23]
      is_zero_r <= decr & count_r == 8'h1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count_r = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  is_zero_r = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpDownLoadCounter_1(
  input         clock,
  input         reset,
  input         load,
  input         decr,
  input  [23:0] load_value,
  output [23:0] count,
  output        is_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] count_r; // @[UpDownLoadCounter.scala 20:24]
  reg  is_zero_r; // @[UpDownLoadCounter.scala 21:26]
  wire [23:0] _count_r_T_3 = count_r - 24'h1; // @[UpDownLoadCounter.scala 30:51]
  wire  _is_zero_r_T_8 = decr ? decr & count_r == 24'h1 : is_zero_r; // @[UpDownLoadCounter.scala 39:23]
  wire  _GEN_4 = load ? load_value == 24'h0 : _is_zero_r_T_8; // @[UpDownLoadCounter.scala 37:{17,29} 39:17]
  assign count = count_r; // @[UpDownLoadCounter.scala 23:9]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 34:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 24'h0; // @[UpDownLoadCounter.scala 20:24]
    end else if (load) begin // @[UpDownLoadCounter.scala 26:17]
      count_r <= load_value; // @[UpDownLoadCounter.scala 27:15]
    end else if (decr) begin // @[UpDownLoadCounter.scala 30:30]
      count_r <= _count_r_T_3; // @[UpDownLoadCounter.scala 30:40]
    end
    is_zero_r <= reset | _GEN_4; // @[UpDownLoadCounter.scala 21:{26,26}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count_r = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  is_zero_r = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpDownLoadCounter_2(
  input   clock,
  input   reset,
  input   incr,
  input   decr,
  output  is_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] count_r; // @[UpDownLoadCounter.scala 20:24]
  reg  is_zero_r; // @[UpDownLoadCounter.scala 21:26]
  wire [7:0] _count_r_T_1 = count_r + 8'h1; // @[UpDownLoadCounter.scala 29:51]
  wire [7:0] _count_r_T_3 = count_r - 8'h1; // @[UpDownLoadCounter.scala 30:51]
  wire  _is_zero_r_T_8 = incr ^ decr ? decr & count_r == 8'h1 | incr & count_r == 8'hff : is_zero_r; // @[UpDownLoadCounter.scala 39:23]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 34:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 8'h0; // @[UpDownLoadCounter.scala 20:24]
    end else if (incr & ~decr) begin // @[UpDownLoadCounter.scala 29:30]
      count_r <= _count_r_T_1; // @[UpDownLoadCounter.scala 29:40]
    end else if (~incr & decr) begin // @[UpDownLoadCounter.scala 30:30]
      count_r <= _count_r_T_3; // @[UpDownLoadCounter.scala 30:40]
    end
    is_zero_r <= reset | _is_zero_r_T_8; // @[UpDownLoadCounter.scala 21:{26,26}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count_r = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  is_zero_r = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AxiWriteMaster(
  input         clock,
  input         reset,
  input         ctrl_start,
  output        ctrl_done,
  input  [31:0] ctrl_offset,
  input  [31:0] ctrl_length,
  output [31:0] m_axi_awaddr,
  output        m_axi_awvalid,
  input         m_axi_awready,
  output [31:0] m_axi_wdata,
  output        m_axi_wvalid,
  input         m_axi_wready,
  input         m_axi_bvalid,
  output        m_axi_bready,
  output [7:0]  m_axi_awlen,
  output [3:0]  m_axi_wstrb,
  output        m_axi_wlast,
  input  [31:0] s_tdata,
  input  [3:0]  s_tkeep,
  input         s_tvalid,
  output        s_tready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  burst_cntr_clock; // @[AxiWriteMaster.scala 54:26]
  wire  burst_cntr_reset; // @[AxiWriteMaster.scala 54:26]
  wire  burst_cntr_load; // @[AxiWriteMaster.scala 54:26]
  wire  burst_cntr_decr; // @[AxiWriteMaster.scala 54:26]
  wire [7:0] burst_cntr_load_value; // @[AxiWriteMaster.scala 54:26]
  wire  burst_cntr_is_zero; // @[AxiWriteMaster.scala 54:26]
  wire  w_transaction_cntr_clock; // @[AxiWriteMaster.scala 63:34]
  wire  w_transaction_cntr_reset; // @[AxiWriteMaster.scala 63:34]
  wire  w_transaction_cntr_load; // @[AxiWriteMaster.scala 63:34]
  wire  w_transaction_cntr_decr; // @[AxiWriteMaster.scala 63:34]
  wire [23:0] w_transaction_cntr_load_value; // @[AxiWriteMaster.scala 63:34]
  wire [23:0] w_transaction_cntr_count; // @[AxiWriteMaster.scala 63:34]
  wire  w_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 63:34]
  wire  w_to_aw_cntr_clock; // @[AxiWriteMaster.scala 90:28]
  wire  w_to_aw_cntr_reset; // @[AxiWriteMaster.scala 90:28]
  wire  w_to_aw_cntr_incr; // @[AxiWriteMaster.scala 90:28]
  wire  w_to_aw_cntr_decr; // @[AxiWriteMaster.scala 90:28]
  wire  w_to_aw_cntr_is_zero; // @[AxiWriteMaster.scala 90:28]
  wire  aw_transaction_cntr_clock; // @[AxiWriteMaster.scala 101:35]
  wire  aw_transaction_cntr_reset; // @[AxiWriteMaster.scala 101:35]
  wire  aw_transaction_cntr_load; // @[AxiWriteMaster.scala 101:35]
  wire  aw_transaction_cntr_decr; // @[AxiWriteMaster.scala 101:35]
  wire [23:0] aw_transaction_cntr_load_value; // @[AxiWriteMaster.scala 101:35]
  wire [23:0] aw_transaction_cntr_count; // @[AxiWriteMaster.scala 101:35]
  wire  aw_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 101:35]
  wire  b_transaction_cntr_clock; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_reset; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_load; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_decr; // @[AxiWriteMaster.scala 114:34]
  wire [23:0] b_transaction_cntr_load_value; // @[AxiWriteMaster.scala 114:34]
  wire [23:0] b_transaction_cntr_count; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 114:34]
  reg  wfirst; // @[AxiWriteMaster.scala 16:23]
  reg  wfirst_pulse; // @[AxiWriteMaster.scala 17:29]
  reg  w_almost_final_transaction; // @[AxiWriteMaster.scala 18:43]
  reg  awvalid_r; // @[AxiWriteMaster.scala 21:26]
  reg [31:0] addr; // @[AxiWriteMaster.scala 22:21]
  wire [23:0] num_full_bursts = ctrl_length[31:8]; // @[AxiWriteMaster.scala 29:36]
  wire  num_partial_bursts = ctrl_length[7:0] != 8'h0; // @[AxiWriteMaster.scala 30:47]
  reg  start; // @[AxiWriteMaster.scala 32:22]
  wire [23:0] _num_transactions_T_2 = num_full_bursts - 24'h1; // @[AxiWriteMaster.scala 33:75]
  reg [23:0] num_transactions; // @[AxiWriteMaster.scala 33:33]
  reg [7:0] final_burst_len; // @[AxiWriteMaster.scala 35:32]
  wire  bxfer = m_axi_bready & m_axi_bvalid; // @[AxiWriteMaster.scala 112:25]
  wire  b_final_transaction = b_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 120:23 15:33]
  wire  single_transaction = num_transactions == 24'h0; // @[AxiWriteMaster.scala 38:46]
  wire  wxfer = s_tvalid & m_axi_wready; // @[AxiWriteMaster.scala 47:24]
  wire  _wfirst_T = wxfer ? m_axi_wlast : wfirst; // @[AxiWriteMaster.scala 49:16]
  wire  _load_burst_cntr_T_2 = start & single_transaction; // @[AxiWriteMaster.scala 52:86]
  wire  load_burst_cntr = wxfer & m_axi_wlast & w_almost_final_transaction | start & single_transaction & ctrl_length
     != 32'h1; // @[AxiWriteMaster.scala 52:76]
  wire [7:0] _burst_cntr_load_value_T_4 = final_burst_len - 8'h1; // @[AxiWriteMaster.scala 59:101]
  wire [23:0] w_transactions_to_go = w_transaction_cntr_count; // @[AxiWriteMaster.scala 19:34 69:24]
  wire  awxfer = awvalid_r & m_axi_awready; // @[AxiWriteMaster.scala 80:26]
  wire  idle_aw = w_to_aw_cntr_is_zero; // @[AxiWriteMaster.scala 23:21 96:11]
  wire  _awvalid_r_T_3 = m_axi_awready ? 1'h0 : awvalid_r; // @[AxiWriteMaster.scala 82:54]
  wire [31:0] _addr_T_1 = addr + 32'h400; // @[AxiWriteMaster.scala 86:57]
  wire  aw_final_transaction = aw_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 107:24 24:34]
  wire  _wfirst_dl_T = s_tvalid & wfirst; // @[AxiWriteMaster.scala 98:36]
  reg  wfirst_dl; // @[AxiWriteMaster.scala 98:26]
  UpDownLoadCounter burst_cntr ( // @[AxiWriteMaster.scala 54:26]
    .clock(burst_cntr_clock),
    .reset(burst_cntr_reset),
    .load(burst_cntr_load),
    .decr(burst_cntr_decr),
    .load_value(burst_cntr_load_value),
    .is_zero(burst_cntr_is_zero)
  );
  UpDownLoadCounter_1 w_transaction_cntr ( // @[AxiWriteMaster.scala 63:34]
    .clock(w_transaction_cntr_clock),
    .reset(w_transaction_cntr_reset),
    .load(w_transaction_cntr_load),
    .decr(w_transaction_cntr_decr),
    .load_value(w_transaction_cntr_load_value),
    .count(w_transaction_cntr_count),
    .is_zero(w_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_2 w_to_aw_cntr ( // @[AxiWriteMaster.scala 90:28]
    .clock(w_to_aw_cntr_clock),
    .reset(w_to_aw_cntr_reset),
    .incr(w_to_aw_cntr_incr),
    .decr(w_to_aw_cntr_decr),
    .is_zero(w_to_aw_cntr_is_zero)
  );
  UpDownLoadCounter_1 aw_transaction_cntr ( // @[AxiWriteMaster.scala 101:35]
    .clock(aw_transaction_cntr_clock),
    .reset(aw_transaction_cntr_reset),
    .load(aw_transaction_cntr_load),
    .decr(aw_transaction_cntr_decr),
    .load_value(aw_transaction_cntr_load_value),
    .count(aw_transaction_cntr_count),
    .is_zero(aw_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_1 b_transaction_cntr ( // @[AxiWriteMaster.scala 114:34]
    .clock(b_transaction_cntr_clock),
    .reset(b_transaction_cntr_reset),
    .load(b_transaction_cntr_load),
    .decr(b_transaction_cntr_decr),
    .load_value(b_transaction_cntr_load_value),
    .count(b_transaction_cntr_count),
    .is_zero(b_transaction_cntr_is_zero)
  );
  assign ctrl_done = bxfer & b_final_transaction; // @[AxiWriteMaster.scala 37:22]
  assign m_axi_awaddr = addr; // @[AxiWriteMaster.scala 84:16]
  assign m_axi_awvalid = awvalid_r; // @[AxiWriteMaster.scala 79:17]
  assign m_axi_wdata = s_tdata; // @[AxiWriteMaster.scala 43:15]
  assign m_axi_wvalid = s_tvalid; // @[AxiWriteMaster.scala 42:16]
  assign m_axi_bready = 1'h1; // @[AxiWriteMaster.scala 111:16]
  assign m_axi_awlen = aw_final_transaction | _load_burst_cntr_T_2 ? final_burst_len : 8'hff; // @[AxiWriteMaster.scala 88:21]
  assign m_axi_wstrb = s_tkeep; // @[AxiWriteMaster.scala 44:15]
  assign m_axi_wlast = ctrl_length == 32'h1 ? wxfer : burst_cntr_is_zero; // @[AxiWriteMaster.scala 60:18]
  assign s_tready = m_axi_wready; // @[AxiWriteMaster.scala 45:12]
  assign burst_cntr_clock = clock;
  assign burst_cntr_reset = reset;
  assign burst_cntr_load = wxfer & m_axi_wlast & w_almost_final_transaction | start & single_transaction & ctrl_length
     != 32'h1; // @[AxiWriteMaster.scala 52:76]
  assign burst_cntr_decr = s_tvalid & m_axi_wready; // @[AxiWriteMaster.scala 47:24]
  assign burst_cntr_load_value = _load_burst_cntr_T_2 & load_burst_cntr & wxfer ? _burst_cntr_load_value_T_4 :
    final_burst_len; // @[AxiWriteMaster.scala 59:31]
  assign w_transaction_cntr_clock = clock;
  assign w_transaction_cntr_reset = reset;
  assign w_transaction_cntr_load = start; // @[AxiWriteMaster.scala 65:27]
  assign w_transaction_cntr_decr = wxfer & m_axi_wlast; // @[AxiWriteMaster.scala 67:36]
  assign w_transaction_cntr_load_value = num_transactions; // @[AxiWriteMaster.scala 68:33]
  assign w_to_aw_cntr_clock = clock;
  assign w_to_aw_cntr_reset = reset;
  assign w_to_aw_cntr_incr = wfirst_pulse; // @[AxiWriteMaster.scala 93:21]
  assign w_to_aw_cntr_decr = awvalid_r & m_axi_awready; // @[AxiWriteMaster.scala 80:26]
  assign aw_transaction_cntr_clock = clock;
  assign aw_transaction_cntr_reset = reset;
  assign aw_transaction_cntr_load = start; // @[AxiWriteMaster.scala 103:28]
  assign aw_transaction_cntr_decr = awvalid_r & m_axi_awready; // @[AxiWriteMaster.scala 80:26]
  assign aw_transaction_cntr_load_value = num_transactions; // @[AxiWriteMaster.scala 106:34]
  assign b_transaction_cntr_clock = clock;
  assign b_transaction_cntr_reset = reset;
  assign b_transaction_cntr_load = start; // @[AxiWriteMaster.scala 116:27]
  assign b_transaction_cntr_decr = m_axi_bready & m_axi_bvalid; // @[AxiWriteMaster.scala 112:25]
  assign b_transaction_cntr_load_value = num_transactions; // @[AxiWriteMaster.scala 119:33]
  always @(posedge clock) begin
    wfirst <= reset | _wfirst_T; // @[AxiWriteMaster.scala 16:{23,23} 49:10]
    if (reset) begin // @[AxiWriteMaster.scala 17:29]
      wfirst_pulse <= 1'h0; // @[AxiWriteMaster.scala 17:29]
    end else begin
      wfirst_pulse <= _wfirst_dl_T & ~wfirst_dl; // @[AxiWriteMaster.scala 99:16]
    end
    if (reset) begin // @[AxiWriteMaster.scala 18:43]
      w_almost_final_transaction <= 1'h0; // @[AxiWriteMaster.scala 18:43]
    end else begin
      w_almost_final_transaction <= w_transactions_to_go == 24'h1; // @[AxiWriteMaster.scala 72:30]
    end
    if (reset) begin // @[AxiWriteMaster.scala 21:26]
      awvalid_r <= 1'h0; // @[AxiWriteMaster.scala 21:26]
    end else begin
      awvalid_r <= ~idle_aw & ~awvalid_r | _awvalid_r_T_3; // @[AxiWriteMaster.scala 82:13]
    end
    if (reset) begin // @[AxiWriteMaster.scala 22:21]
      addr <= 32'h0; // @[AxiWriteMaster.scala 22:21]
    end else if (ctrl_start) begin // @[AxiWriteMaster.scala 86:14]
      addr <= ctrl_offset;
    end else if (awxfer) begin // @[AxiWriteMaster.scala 86:43]
      addr <= _addr_T_1;
    end
    if (reset) begin // @[AxiWriteMaster.scala 32:22]
      start <= 1'h0; // @[AxiWriteMaster.scala 32:22]
    end else begin
      start <= ctrl_start; // @[AxiWriteMaster.scala 32:22]
    end
    if (~num_partial_bursts) begin // @[AxiWriteMaster.scala 33:37]
      num_transactions <= _num_transactions_T_2;
    end else begin
      num_transactions <= num_full_bursts;
    end
    final_burst_len <= ctrl_length[7:0] - 8'h1; // @[AxiWriteMaster.scala 35:51]
    wfirst_dl <= s_tvalid & wfirst; // @[AxiWriteMaster.scala 98:36]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wfirst = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  wfirst_pulse = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  w_almost_final_transaction = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  awvalid_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  start = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  num_transactions = _RAND_6[23:0];
  _RAND_7 = {1{`RANDOM}};
  final_burst_len = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  wfirst_dl = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DmaInfo(
  input  [31:0] addr,
  input  [31:0] blength,
  output [31:0] offset,
  output [31:0] wlength
);
  wire [29:0] waddr = addr[31:2]; // @[DmaInfo.scala 13:20]
  wire [31:0] addr_n = addr + blength; // @[DmaInfo.scala 15:21]
  wire [31:0] _wlength_T_1 = addr_n + 32'h3; // @[DmaInfo.scala 16:23]
  wire [29:0] _wlength_T_4 = _wlength_T_1[31:2] - waddr; // @[DmaInfo.scala 16:34]
  assign offset = {waddr, 2'h0}; // @[DmaInfo.scala 14:19]
  assign wlength = {{2'd0}, _wlength_T_4}; // @[DmaInfo.scala 16:11]
endmodule
module AxiS2MMTest(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE:M_AXI:S_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_LITE, CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4LITE, DATA_WIDTH 32"
     *)
  input  [31:0] s_axi_araddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *)
  input         s_axi_arvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *)
  output        s_axi_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA" *)
  output [31:0] s_axi_rdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP" *)
  output [1:0]  s_axi_rresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID" *)
  output        s_axi_rvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY" *)
  input         s_axi_rready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR" *)
  input  [31:0] s_axi_awaddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *)
  input         s_axi_awvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *)
  output        s_axi_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA" *)
  input  [31:0] s_axi_wdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID" *)
  input         s_axi_wvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY" *)
  output        s_axi_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP" *)
  output [1:0]  s_axi_bresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID" *)
  output        s_axi_bvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY" *)
  input         s_axi_bready,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4, DATA_WIDTH 32"
     *)
  output [31:0] m_axi_awaddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
  output        m_axi_awvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
  input         m_axi_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
  output [31:0] m_axi_wdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
  output        m_axi_wvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
  input         m_axi_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
  input  [1:0]  m_axi_bresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
  input         m_axi_bvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
  output        m_axi_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
  output [7:0]  m_axi_awlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output [3:0]  m_axi_wstrb,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
  output        m_axi_wlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
  input  [3:0]  s_axis_tkeep,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input         s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output        s_axis_tready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_reset; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_start; // @[AxiS2MMTest.scala 11:24]
  wire  axi_ctrl_done; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_write_addr; // @[AxiS2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_write_length; // @[AxiS2MMTest.scala 11:24]
  wire  write_master_clock; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_reset; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_ctrl_start; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_ctrl_done; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] write_master_ctrl_offset; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] write_master_ctrl_length; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] write_master_m_axi_awaddr; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_awvalid; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_awready; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] write_master_m_axi_wdata; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_wvalid; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_wready; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_bvalid; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_bready; // @[AxiS2MMTest.scala 17:28]
  wire [7:0] write_master_m_axi_awlen; // @[AxiS2MMTest.scala 17:28]
  wire [3:0] write_master_m_axi_wstrb; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_m_axi_wlast; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] write_master_s_tdata; // @[AxiS2MMTest.scala 17:28]
  wire [3:0] write_master_s_tkeep; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_s_tvalid; // @[AxiS2MMTest.scala 17:28]
  wire  write_master_s_tready; // @[AxiS2MMTest.scala 17:28]
  wire [31:0] dmaInfo_addr; // @[AxiS2MMTest.scala 22:23]
  wire [31:0] dmaInfo_blength; // @[AxiS2MMTest.scala 22:23]
  wire [31:0] dmaInfo_offset; // @[AxiS2MMTest.scala 22:23]
  wire [31:0] dmaInfo_wlength; // @[AxiS2MMTest.scala 22:23]
  reg  done; // @[AxiS2MMTest.scala 14:21]
  AxiCtrlS2MM axi_ctrl ( // @[AxiS2MMTest.scala 11:24]
    .clock(axi_ctrl_clock),
    .reset(axi_ctrl_reset),
    .s_axi_araddr(axi_ctrl_s_axi_araddr),
    .s_axi_arvalid(axi_ctrl_s_axi_arvalid),
    .s_axi_arready(axi_ctrl_s_axi_arready),
    .s_axi_rdata(axi_ctrl_s_axi_rdata),
    .s_axi_rvalid(axi_ctrl_s_axi_rvalid),
    .s_axi_rready(axi_ctrl_s_axi_rready),
    .s_axi_awaddr(axi_ctrl_s_axi_awaddr),
    .s_axi_awvalid(axi_ctrl_s_axi_awvalid),
    .s_axi_awready(axi_ctrl_s_axi_awready),
    .s_axi_wdata(axi_ctrl_s_axi_wdata),
    .s_axi_wvalid(axi_ctrl_s_axi_wvalid),
    .s_axi_wready(axi_ctrl_s_axi_wready),
    .s_axi_bvalid(axi_ctrl_s_axi_bvalid),
    .s_axi_bready(axi_ctrl_s_axi_bready),
    .start(axi_ctrl_start),
    .done(axi_ctrl_done),
    .write_addr(axi_ctrl_write_addr),
    .write_length(axi_ctrl_write_length)
  );
  AxiWriteMaster write_master ( // @[AxiS2MMTest.scala 17:28]
    .clock(write_master_clock),
    .reset(write_master_reset),
    .ctrl_start(write_master_ctrl_start),
    .ctrl_done(write_master_ctrl_done),
    .ctrl_offset(write_master_ctrl_offset),
    .ctrl_length(write_master_ctrl_length),
    .m_axi_awaddr(write_master_m_axi_awaddr),
    .m_axi_awvalid(write_master_m_axi_awvalid),
    .m_axi_awready(write_master_m_axi_awready),
    .m_axi_wdata(write_master_m_axi_wdata),
    .m_axi_wvalid(write_master_m_axi_wvalid),
    .m_axi_wready(write_master_m_axi_wready),
    .m_axi_bvalid(write_master_m_axi_bvalid),
    .m_axi_bready(write_master_m_axi_bready),
    .m_axi_awlen(write_master_m_axi_awlen),
    .m_axi_wstrb(write_master_m_axi_wstrb),
    .m_axi_wlast(write_master_m_axi_wlast),
    .s_tdata(write_master_s_tdata),
    .s_tkeep(write_master_s_tkeep),
    .s_tvalid(write_master_s_tvalid),
    .s_tready(write_master_s_tready)
  );
  DmaInfo dmaInfo ( // @[AxiS2MMTest.scala 22:23]
    .addr(dmaInfo_addr),
    .blength(dmaInfo_blength),
    .offset(dmaInfo_offset),
    .wlength(dmaInfo_wlength)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_rresp = 2'h0; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_bresp = 2'h0; // @[AxiS2MMTest.scala 12:18]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiS2MMTest.scala 12:18]
  assign m_axi_awaddr = write_master_m_axi_awaddr; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_awvalid = write_master_m_axi_awvalid; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_wdata = write_master_m_axi_wdata; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_wvalid = write_master_m_axi_wvalid; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_bready = 1'h1; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_awlen = write_master_m_axi_awlen; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_wstrb = write_master_m_axi_wstrb; // @[AxiS2MMTest.scala 18:22]
  assign m_axi_wlast = write_master_m_axi_wlast; // @[AxiS2MMTest.scala 18:22]
  assign s_axis_tready = write_master_s_tready; // @[AxiS2MMTest.scala 28:18]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiS2MMTest.scala 12:18]
  assign axi_ctrl_done = done; // @[AxiS2MMTest.scala 15:17]
  assign write_master_clock = clock;
  assign write_master_reset = reset;
  assign write_master_ctrl_start = axi_ctrl_start; // @[AxiS2MMTest.scala 19:27]
  assign write_master_ctrl_offset = dmaInfo_offset; // @[AxiS2MMTest.scala 26:28]
  assign write_master_ctrl_length = dmaInfo_wlength; // @[AxiS2MMTest.scala 27:28]
  assign write_master_m_axi_awready = m_axi_awready; // @[AxiS2MMTest.scala 18:22]
  assign write_master_m_axi_wready = m_axi_wready; // @[AxiS2MMTest.scala 18:22]
  assign write_master_m_axi_bvalid = m_axi_bvalid; // @[AxiS2MMTest.scala 18:22]
  assign write_master_s_tdata = s_axis_tdata; // @[AxiS2MMTest.scala 28:18]
  assign write_master_s_tkeep = s_axis_tkeep; // @[AxiS2MMTest.scala 28:18]
  assign write_master_s_tvalid = s_axis_tvalid; // @[AxiS2MMTest.scala 28:18]
  assign dmaInfo_addr = axi_ctrl_write_addr; // @[AxiS2MMTest.scala 23:16]
  assign dmaInfo_blength = axi_ctrl_write_length; // @[AxiS2MMTest.scala 24:19]
  always @(posedge clock) begin
    if (reset) begin // @[AxiS2MMTest.scala 14:21]
      done <= 1'h0; // @[AxiS2MMTest.scala 14:21]
    end else begin
      done <= write_master_ctrl_done | done; // @[AxiS2MMTest.scala 20:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  done = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

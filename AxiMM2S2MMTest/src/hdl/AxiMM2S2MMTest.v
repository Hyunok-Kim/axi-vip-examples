module AxiCtrlMM2S2MM(
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
  input         done_0,
  input         done_1,
  output [31:0] read_addr,
  output [31:0] write_addr,
  output [31:0] rw_length
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
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] int_read_addr; // @[AxiCtrlMM2S2MM.scala 15:30]
  reg [31:0] int_write_addr; // @[AxiCtrlMM2S2MM.scala 16:31]
  reg [31:0] int_rw_length; // @[AxiCtrlMM2S2MM.scala 17:30]
  reg [31:0] rdata; // @[AxiCtrlMM2S2MM.scala 22:22]
  reg  rvalid; // @[AxiCtrlMM2S2MM.scala 24:23]
  reg  bvalid; // @[AxiCtrlMM2S2MM.scala 26:23]
  reg  rd_req; // @[AxiCtrlMM2S2MM.scala 33:23]
  reg  wr_req_0; // @[AxiCtrlMM2S2MM.scala 34:23]
  reg  wr_req_1; // @[AxiCtrlMM2S2MM.scala 34:23]
  reg [11:0] rd_addr; // @[AxiCtrlMM2S2MM.scala 35:24]
  reg [11:0] wr_addr; // @[AxiCtrlMM2S2MM.scala 36:24]
  reg [31:0] wr_data; // @[AxiCtrlMM2S2MM.scala 37:24]
  wire [31:0] _GEN_0 = s_axi_awready & s_axi_awvalid ? s_axi_awaddr : {{20'd0}, wr_addr}; // @[AxiCtrlMM2S2MM.scala 40:41 41:13 36:24]
  wire  _GEN_1 = s_axi_awready & s_axi_awvalid | wr_req_0; // @[AxiCtrlMM2S2MM.scala 40:41 42:15 34:23]
  wire  _GEN_3 = s_axi_wready & s_axi_wvalid | wr_req_1; // @[AxiCtrlMM2S2MM.scala 45:39 47:15 34:23]
  wire  _T_3 = ~bvalid; // @[AxiCtrlMM2S2MM.scala 52:16]
  wire [31:0] _GEN_4 = wr_addr == 12'h0 ? wr_data : 32'h0; // @[AxiCtrlMM2S2MM.scala 54:33 55:13 13:9]
  wire [31:0] _GEN_8 = ~bvalid & wr_req_0 & wr_req_1 ? _GEN_4 : 32'h0; // @[AxiCtrlMM2S2MM.scala 52:51 13:9]
  wire  _GEN_13 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiCtrlMM2S2MM.scala 52:51 68:12 26:23]
  wire [31:0] _GEN_17 = bvalid & s_axi_bready ? 32'h0 : _GEN_8; // @[AxiCtrlMM2S2MM.scala 50:33 13:9]
  wire [31:0] _GEN_24 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr}; // @[AxiCtrlMM2S2MM.scala 75:41 76:13 35:24]
  wire  _GEN_25 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiCtrlMM2S2MM.scala 75:41 77:12 33:23]
  wire  _T_12 = ~rvalid; // @[AxiCtrlMM2S2MM.scala 82:16]
  wire [1:0] _rdata_T = {done_1,done_0}; // @[AxiCtrlMM2S2MM.scala 86:21]
  wire [15:0] _GEN_26 = rd_addr == 12'h4 ? {{14'd0}, _rdata_T} : 16'hdead; // @[AxiCtrlMM2S2MM.scala 83:11 85:33 86:13]
  wire  _GEN_29 = ~rvalid & rd_req | rvalid; // @[AxiCtrlMM2S2MM.scala 82:35 90:12 24:23]
  wire [31:0] _GEN_35 = reset ? 32'h0 : _GEN_24; // @[AxiCtrlMM2S2MM.scala 35:{24,24}]
  wire [31:0] _GEN_36 = reset ? 32'h0 : _GEN_0; // @[AxiCtrlMM2S2MM.scala 36:{24,24}]
  assign s_axi_arready = ~rd_req & _T_12; // @[AxiCtrlMM2S2MM.scala 93:28]
  assign s_axi_rdata = rdata; // @[AxiCtrlMM2S2MM.scala 27:15]
  assign s_axi_rvalid = rvalid; // @[AxiCtrlMM2S2MM.scala 29:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiCtrlMM2S2MM.scala 71:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiCtrlMM2S2MM.scala 72:30]
  assign s_axi_bvalid = bvalid; // @[AxiCtrlMM2S2MM.scala 31:16]
  assign start = _GEN_17[0];
  assign read_addr = int_read_addr; // @[AxiCtrlMM2S2MM.scala 18:13]
  assign write_addr = int_write_addr; // @[AxiCtrlMM2S2MM.scala 19:14]
  assign rw_length = int_rw_length; // @[AxiCtrlMM2S2MM.scala 20:13]
  always @(posedge clock) begin
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 15:30]
      int_read_addr <= 32'h0; // @[AxiCtrlMM2S2MM.scala 15:30]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlMM2S2MM.scala 52:51]
        if (wr_addr == 12'h10) begin // @[AxiCtrlMM2S2MM.scala 57:33]
          int_read_addr <= wr_data; // @[AxiCtrlMM2S2MM.scala 58:21]
        end
      end
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 16:31]
      int_write_addr <= 32'h0; // @[AxiCtrlMM2S2MM.scala 16:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlMM2S2MM.scala 52:51]
        if (wr_addr == 12'h14) begin // @[AxiCtrlMM2S2MM.scala 60:33]
          int_write_addr <= wr_data; // @[AxiCtrlMM2S2MM.scala 61:22]
        end
      end
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 17:30]
      int_rw_length <= 32'h0; // @[AxiCtrlMM2S2MM.scala 17:30]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlMM2S2MM.scala 52:51]
        if (wr_addr == 12'h18) begin // @[AxiCtrlMM2S2MM.scala 63:33]
          int_rw_length <= wr_data; // @[AxiCtrlMM2S2MM.scala 64:21]
        end
      end
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 22:22]
      rdata <= 32'h0; // @[AxiCtrlMM2S2MM.scala 22:22]
    end else if (!(rvalid & s_axi_rready)) begin // @[AxiCtrlMM2S2MM.scala 80:33]
      if (~rvalid & rd_req) begin // @[AxiCtrlMM2S2MM.scala 82:35]
        rdata <= {{16'd0}, _GEN_26};
      end
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 24:23]
      rvalid <= 1'h0; // @[AxiCtrlMM2S2MM.scala 24:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiCtrlMM2S2MM.scala 80:33]
      rvalid <= 1'h0; // @[AxiCtrlMM2S2MM.scala 81:12]
    end else begin
      rvalid <= _GEN_29;
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 26:23]
      bvalid <= 1'h0; // @[AxiCtrlMM2S2MM.scala 26:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      bvalid <= 1'h0; // @[AxiCtrlMM2S2MM.scala 51:12]
    end else begin
      bvalid <= _GEN_13;
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 33:23]
      rd_req <= 1'h0; // @[AxiCtrlMM2S2MM.scala 33:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiCtrlMM2S2MM.scala 80:33]
      rd_req <= _GEN_25;
    end else if (~rvalid & rd_req) begin // @[AxiCtrlMM2S2MM.scala 82:35]
      rd_req <= 1'h0; // @[AxiCtrlMM2S2MM.scala 91:12]
    end else begin
      rd_req <= _GEN_25;
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 34:23]
      wr_req_0 <= 1'h0; // @[AxiCtrlMM2S2MM.scala 34:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      wr_req_0 <= _GEN_1;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlMM2S2MM.scala 52:51]
      wr_req_0 <= 1'h0; // @[AxiCtrlMM2S2MM.scala 69:12]
    end else begin
      wr_req_0 <= _GEN_1;
    end
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 34:23]
      wr_req_1 <= 1'h0; // @[AxiCtrlMM2S2MM.scala 34:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiCtrlMM2S2MM.scala 50:33]
      wr_req_1 <= _GEN_3;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiCtrlMM2S2MM.scala 52:51]
      wr_req_1 <= 1'h0; // @[AxiCtrlMM2S2MM.scala 69:12]
    end else begin
      wr_req_1 <= _GEN_3;
    end
    rd_addr <= _GEN_35[11:0]; // @[AxiCtrlMM2S2MM.scala 35:{24,24}]
    wr_addr <= _GEN_36[11:0]; // @[AxiCtrlMM2S2MM.scala 36:{24,24}]
    if (reset) begin // @[AxiCtrlMM2S2MM.scala 37:24]
      wr_data <= 32'h0; // @[AxiCtrlMM2S2MM.scala 37:24]
    end else if (s_axi_wready & s_axi_wvalid) begin // @[AxiCtrlMM2S2MM.scala 45:39]
      wr_data <= s_axi_wdata; // @[AxiCtrlMM2S2MM.scala 46:13]
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
  int_read_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  int_write_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  int_rw_length = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rdata = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  rvalid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bvalid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rd_req = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wr_req_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  wr_req_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rd_addr = _RAND_9[11:0];
  _RAND_10 = {1{`RANDOM}};
  wr_addr = _RAND_10[11:0];
  _RAND_11 = {1{`RANDOM}};
  wr_data = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpDownLoadCounter(
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
module UpDownLoadCounter_1(
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
  reg [1:0] count_r; // @[UpDownLoadCounter.scala 20:24]
  reg  is_zero_r; // @[UpDownLoadCounter.scala 21:26]
  wire [1:0] _count_r_T_1 = count_r + 2'h1; // @[UpDownLoadCounter.scala 29:51]
  wire [1:0] _count_r_T_3 = count_r - 2'h1; // @[UpDownLoadCounter.scala 30:51]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 34:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 2'h3; // @[UpDownLoadCounter.scala 20:24]
    end else if (incr & ~decr) begin // @[UpDownLoadCounter.scala 29:30]
      count_r <= _count_r_T_1; // @[UpDownLoadCounter.scala 29:40]
    end else if (~incr & decr) begin // @[UpDownLoadCounter.scala 30:30]
      count_r <= _count_r_T_3; // @[UpDownLoadCounter.scala 30:40]
    end
    if (reset) begin // @[UpDownLoadCounter.scala 21:26]
      is_zero_r <= 1'h0; // @[UpDownLoadCounter.scala 21:26]
    end else if (incr ^ decr) begin // @[UpDownLoadCounter.scala 39:23]
      is_zero_r <= decr & count_r == 2'h1 | incr & count_r == 2'h3;
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
  count_r = _RAND_0[1:0];
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
module AxiReadMaster(
  input         clock,
  input         reset,
  input         ctrl_start,
  output        ctrl_done,
  input  [31:0] ctrl_offset,
  input  [31:0] ctrl_length,
  input  [3:0]  ctrl_fkeep,
  input  [3:0]  ctrl_lkeep,
  output [31:0] m_axi_araddr,
  output        m_axi_arvalid,
  input         m_axi_arready,
  input  [31:0] m_axi_rdata,
  input         m_axi_rvalid,
  output        m_axi_rready,
  output [7:0]  m_axi_arlen,
  input         m_axi_rlast,
  output [31:0] m_tdata,
  output        m_tvalid,
  output [3:0]  m_tkeep
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  ar_transaction_cntr_clock; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_reset; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_load; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_decr; // @[AxiReadMaster.scala 60:35]
  wire [23:0] ar_transaction_cntr_load_value; // @[AxiReadMaster.scala 60:35]
  wire [23:0] ar_transaction_cntr_count; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_is_zero; // @[AxiReadMaster.scala 60:35]
  wire  ar_to_r_transaction_cntr_clock; // @[AxiReadMaster.scala 72:40]
  wire  ar_to_r_transaction_cntr_reset; // @[AxiReadMaster.scala 72:40]
  wire  ar_to_r_transaction_cntr_incr; // @[AxiReadMaster.scala 72:40]
  wire  ar_to_r_transaction_cntr_decr; // @[AxiReadMaster.scala 72:40]
  wire  ar_to_r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 72:40]
  wire  r_transaction_cntr_clock; // @[AxiReadMaster.scala 97:34]
  wire  r_transaction_cntr_reset; // @[AxiReadMaster.scala 97:34]
  wire  r_transaction_cntr_load; // @[AxiReadMaster.scala 97:34]
  wire  r_transaction_cntr_decr; // @[AxiReadMaster.scala 97:34]
  wire [23:0] r_transaction_cntr_load_value; // @[AxiReadMaster.scala 97:34]
  wire [23:0] r_transaction_cntr_count; // @[AxiReadMaster.scala 97:34]
  wire  r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 97:34]
  reg  arvalid_r; // @[AxiReadMaster.scala 17:26]
  reg  ar_idle; // @[AxiReadMaster.scala 18:24]
  reg [31:0] addr; // @[AxiReadMaster.scala 19:21]
  reg [31:0] rxfer_cntr; // @[AxiReadMaster.scala 24:27]
  wire  rxfer = m_axi_rready & m_axi_rvalid; // @[AxiReadMaster.scala 92:25]
  wire  r_final_transaction = r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 103:23 25:33]
  wire [23:0] num_full_bursts = ctrl_length[31:8]; // @[AxiReadMaster.scala 32:36]
  wire  num_partial_bursts = ctrl_length[7:0] != 8'h0; // @[AxiReadMaster.scala 33:47]
  reg  start; // @[AxiReadMaster.scala 35:22]
  wire [23:0] _num_transactions_T_2 = num_full_bursts - 24'h1; // @[AxiReadMaster.scala 36:75]
  reg [23:0] num_transactions; // @[AxiReadMaster.scala 36:33]
  reg [7:0] final_burst_len; // @[AxiReadMaster.scala 38:32]
  wire  single_transaction = num_transactions == 24'h0; // @[AxiReadMaster.scala 41:46]
  wire  ar_final_transaction = ar_transaction_cntr_is_zero; // @[AxiReadMaster.scala 20:34 66:24]
  wire  arxfer = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  wire  stall_ar = ar_to_r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 21:22 78:12]
  wire  _arvalid_r_T_7 = m_axi_arready ? 1'h0 : arvalid_r; // @[AxiReadMaster.scala 51:84]
  wire  ar_done = ar_final_transaction & arxfer; // @[AxiReadMaster.scala 68:35]
  wire  _ar_idle_T_1 = start ? 1'h0 : ar_done | ar_idle; // @[AxiReadMaster.scala 54:17]
  wire [31:0] _addr_T_1 = addr + 32'h400; // @[AxiReadMaster.scala 57:57]
  wire  _m_tkeep_T = ctrl_length == 32'h1; // @[AxiReadMaster.scala 85:18]
  wire [3:0] _m_tkeep_T_1 = ctrl_fkeep & ctrl_lkeep; // @[AxiReadMaster.scala 85:42]
  wire  _m_tkeep_T_2 = rxfer_cntr == 32'h0; // @[AxiReadMaster.scala 86:17]
  wire [31:0] _m_tkeep_T_4 = ctrl_length - 32'h1; // @[AxiReadMaster.scala 87:33]
  wire  _m_tkeep_T_5 = rxfer_cntr == _m_tkeep_T_4; // @[AxiReadMaster.scala 87:17]
  wire [3:0] _m_tkeep_T_6 = _m_tkeep_T_5 ? ctrl_lkeep : 4'hf; // @[Mux.scala 101:16]
  wire [3:0] _m_tkeep_T_7 = _m_tkeep_T_2 ? ctrl_fkeep : _m_tkeep_T_6; // @[Mux.scala 101:16]
  wire [31:0] _rxfer_cntr_T_1 = rxfer_cntr + 32'h1; // @[AxiReadMaster.scala 93:55]
  UpDownLoadCounter ar_transaction_cntr ( // @[AxiReadMaster.scala 60:35]
    .clock(ar_transaction_cntr_clock),
    .reset(ar_transaction_cntr_reset),
    .load(ar_transaction_cntr_load),
    .decr(ar_transaction_cntr_decr),
    .load_value(ar_transaction_cntr_load_value),
    .count(ar_transaction_cntr_count),
    .is_zero(ar_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_1 ar_to_r_transaction_cntr ( // @[AxiReadMaster.scala 72:40]
    .clock(ar_to_r_transaction_cntr_clock),
    .reset(ar_to_r_transaction_cntr_reset),
    .incr(ar_to_r_transaction_cntr_incr),
    .decr(ar_to_r_transaction_cntr_decr),
    .is_zero(ar_to_r_transaction_cntr_is_zero)
  );
  UpDownLoadCounter r_transaction_cntr ( // @[AxiReadMaster.scala 97:34]
    .clock(r_transaction_cntr_clock),
    .reset(r_transaction_cntr_reset),
    .load(r_transaction_cntr_load),
    .decr(r_transaction_cntr_decr),
    .load_value(r_transaction_cntr_load_value),
    .count(r_transaction_cntr_count),
    .is_zero(r_transaction_cntr_is_zero)
  );
  assign ctrl_done = rxfer & m_axi_rlast & r_final_transaction; // @[AxiReadMaster.scala 29:36]
  assign m_axi_araddr = addr; // @[AxiReadMaster.scala 46:16]
  assign m_axi_arvalid = arvalid_r; // @[AxiReadMaster.scala 45:17]
  assign m_axi_rready = 1'h1; // @[AxiReadMaster.scala 91:16]
  assign m_axi_arlen = ar_final_transaction | start & single_transaction ? final_burst_len : 8'hff; // @[AxiReadMaster.scala 47:21]
  assign m_tdata = m_axi_rdata; // @[AxiReadMaster.scala 83:11]
  assign m_tvalid = m_axi_rvalid; // @[AxiReadMaster.scala 82:12]
  assign m_tkeep = _m_tkeep_T ? _m_tkeep_T_1 : _m_tkeep_T_7; // @[Mux.scala 101:16]
  assign ar_transaction_cntr_clock = clock;
  assign ar_transaction_cntr_reset = reset;
  assign ar_transaction_cntr_load = start; // @[AxiReadMaster.scala 62:28]
  assign ar_transaction_cntr_decr = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  assign ar_transaction_cntr_load_value = num_transactions; // @[AxiReadMaster.scala 65:34]
  assign ar_to_r_transaction_cntr_clock = clock;
  assign ar_to_r_transaction_cntr_reset = reset;
  assign ar_to_r_transaction_cntr_incr = rxfer & m_axi_rlast; // @[AxiReadMaster.scala 75:42]
  assign ar_to_r_transaction_cntr_decr = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  assign r_transaction_cntr_clock = clock;
  assign r_transaction_cntr_reset = reset;
  assign r_transaction_cntr_load = start; // @[AxiReadMaster.scala 99:27]
  assign r_transaction_cntr_decr = rxfer & m_axi_rlast; // @[AxiReadMaster.scala 95:39]
  assign r_transaction_cntr_load_value = num_transactions; // @[AxiReadMaster.scala 102:33]
  always @(posedge clock) begin
    if (reset) begin // @[AxiReadMaster.scala 17:26]
      arvalid_r <= 1'h0; // @[AxiReadMaster.scala 17:26]
    end else begin
      arvalid_r <= ~ar_idle & ~stall_ar & ~arvalid_r | _arvalid_r_T_7; // @[AxiReadMaster.scala 51:13]
    end
    ar_idle <= reset | _ar_idle_T_1; // @[AxiReadMaster.scala 18:{24,24} 54:11]
    if (reset) begin // @[AxiReadMaster.scala 19:21]
      addr <= 32'h0; // @[AxiReadMaster.scala 19:21]
    end else if (ctrl_start) begin // @[AxiReadMaster.scala 57:14]
      addr <= ctrl_offset;
    end else if (arxfer) begin // @[AxiReadMaster.scala 57:43]
      addr <= _addr_T_1;
    end
    if (reset) begin // @[AxiReadMaster.scala 24:27]
      rxfer_cntr <= 32'h0; // @[AxiReadMaster.scala 24:27]
    end else if (start) begin // @[AxiReadMaster.scala 93:20]
      rxfer_cntr <= 32'h0;
    end else if (rxfer) begin // @[AxiReadMaster.scala 93:36]
      rxfer_cntr <= _rxfer_cntr_T_1;
    end
    if (reset) begin // @[AxiReadMaster.scala 35:22]
      start <= 1'h0; // @[AxiReadMaster.scala 35:22]
    end else begin
      start <= ctrl_start; // @[AxiReadMaster.scala 35:22]
    end
    if (~num_partial_bursts) begin // @[AxiReadMaster.scala 36:37]
      num_transactions <= _num_transactions_T_2;
    end else begin
      num_transactions <= num_full_bursts;
    end
    final_burst_len <= ctrl_length[7:0] - 8'h1; // @[AxiReadMaster.scala 38:51]
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
  arvalid_r = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ar_idle = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  addr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rxfer_cntr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  start = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  num_transactions = _RAND_5[23:0];
  _RAND_6 = {1{`RANDOM}};
  final_burst_len = _RAND_6[7:0];
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
  output [31:0] wlength,
  output [3:0]  fkeep,
  output [3:0]  lkeep
);
  wire [29:0] waddr = addr[31:2]; // @[DmaInfo.scala 13:20]
  wire [31:0] addr_n = addr + blength; // @[DmaInfo.scala 15:21]
  wire [31:0] _wlength_T_1 = addr_n + 32'h3; // @[DmaInfo.scala 16:23]
  wire [29:0] _wlength_T_4 = _wlength_T_1[31:2] - waddr; // @[DmaInfo.scala 16:34]
  wire [6:0] _fkeep_T_1 = 7'hf << addr[1:0]; // @[DmaInfo.scala 17:22]
  wire [2:0] _GEN_0 = {{1'd0}, addr_n[1:0]}; // @[DmaInfo.scala 18:67]
  wire [2:0] _lkeep_T_4 = 3'h4 - _GEN_0; // @[DmaInfo.scala 18:67]
  wire [3:0] _lkeep_T_5 = 4'hf >> _lkeep_T_4; // @[DmaInfo.scala 18:59]
  assign offset = {waddr, 2'h0}; // @[DmaInfo.scala 14:19]
  assign wlength = {{2'd0}, _wlength_T_4}; // @[DmaInfo.scala 16:11]
  assign fkeep = _fkeep_T_1[3:0]; // @[DmaInfo.scala 17:9]
  assign lkeep = addr_n[1:0] == 2'h0 ? 4'hf : _lkeep_T_5; // @[DmaInfo.scala 18:15]
endmodule
module UpDownLoadCounter_3(
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
module UpDownLoadCounter_5(
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
  input         s_tvalid,
  output        s_tready,
  input  [3:0]  s_tkeep
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
  UpDownLoadCounter_3 burst_cntr ( // @[AxiWriteMaster.scala 54:26]
    .clock(burst_cntr_clock),
    .reset(burst_cntr_reset),
    .load(burst_cntr_load),
    .decr(burst_cntr_decr),
    .load_value(burst_cntr_load_value),
    .is_zero(burst_cntr_is_zero)
  );
  UpDownLoadCounter w_transaction_cntr ( // @[AxiWriteMaster.scala 63:34]
    .clock(w_transaction_cntr_clock),
    .reset(w_transaction_cntr_reset),
    .load(w_transaction_cntr_load),
    .decr(w_transaction_cntr_decr),
    .load_value(w_transaction_cntr_load_value),
    .count(w_transaction_cntr_count),
    .is_zero(w_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_5 w_to_aw_cntr ( // @[AxiWriteMaster.scala 90:28]
    .clock(w_to_aw_cntr_clock),
    .reset(w_to_aw_cntr_reset),
    .incr(w_to_aw_cntr_incr),
    .decr(w_to_aw_cntr_decr),
    .is_zero(w_to_aw_cntr_is_zero)
  );
  UpDownLoadCounter aw_transaction_cntr ( // @[AxiWriteMaster.scala 101:35]
    .clock(aw_transaction_cntr_clock),
    .reset(aw_transaction_cntr_reset),
    .load(aw_transaction_cntr_load),
    .decr(aw_transaction_cntr_decr),
    .load_value(aw_transaction_cntr_load_value),
    .count(aw_transaction_cntr_count),
    .is_zero(aw_transaction_cntr_is_zero)
  );
  UpDownLoadCounter b_transaction_cntr ( // @[AxiWriteMaster.scala 114:34]
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
module AxiMM2S2MMTest(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE:M_AXI:S_AXIS:M_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR" *)
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

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_LITE, CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4LITE, DATA_WIDTH 32"
     *)
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
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN clock"
     *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *)
  output [3:0]  m_axis_tkeep,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input         s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output        s_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
  input  [3:0]  s_axis_tkeep,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_LITE, CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4, DATA_WIDTH 32"
     *)
  output [31:0] m_axi_araddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
  output        m_axi_arvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
  input         m_axi_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
  input  [31:0] m_axi_rdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
  input  [1:0]  m_axi_rresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
  input         m_axi_rvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
  output        m_axi_rready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
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

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
  output [7:0]  m_axi_arlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
  input         m_axi_rlast,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
  output [7:0]  m_axi_awlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output [3:0]  m_axi_wstrb,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
  output        m_axi_wlast
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_reset; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_start; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_done_0; // @[AxiMM2S2MMTest.scala 11:24]
  wire  axi_ctrl_done_1; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_read_addr; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_write_addr; // @[AxiMM2S2MMTest.scala 11:24]
  wire [31:0] axi_ctrl_rw_length; // @[AxiMM2S2MMTest.scala 11:24]
  wire  read_master_clock; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_reset; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_ctrl_start; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_ctrl_done; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] read_master_ctrl_offset; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] read_master_ctrl_length; // @[AxiMM2S2MMTest.scala 17:27]
  wire [3:0] read_master_ctrl_fkeep; // @[AxiMM2S2MMTest.scala 17:27]
  wire [3:0] read_master_ctrl_lkeep; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] read_master_m_axi_araddr; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_axi_arvalid; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_axi_arready; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] read_master_m_axi_rdata; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_axi_rvalid; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_axi_rready; // @[AxiMM2S2MMTest.scala 17:27]
  wire [7:0] read_master_m_axi_arlen; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_axi_rlast; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] read_master_m_tdata; // @[AxiMM2S2MMTest.scala 17:27]
  wire  read_master_m_tvalid; // @[AxiMM2S2MMTest.scala 17:27]
  wire [3:0] read_master_m_tkeep; // @[AxiMM2S2MMTest.scala 17:27]
  wire [31:0] rdDmaInfo_addr; // @[AxiMM2S2MMTest.scala 21:25]
  wire [31:0] rdDmaInfo_blength; // @[AxiMM2S2MMTest.scala 21:25]
  wire [31:0] rdDmaInfo_offset; // @[AxiMM2S2MMTest.scala 21:25]
  wire [31:0] rdDmaInfo_wlength; // @[AxiMM2S2MMTest.scala 21:25]
  wire [3:0] rdDmaInfo_fkeep; // @[AxiMM2S2MMTest.scala 21:25]
  wire [3:0] rdDmaInfo_lkeep; // @[AxiMM2S2MMTest.scala 21:25]
  wire  write_master_clock; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_reset; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_ctrl_start; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_ctrl_done; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] write_master_ctrl_offset; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] write_master_ctrl_length; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] write_master_m_axi_awaddr; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_awvalid; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_awready; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] write_master_m_axi_wdata; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_wvalid; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_wready; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_bvalid; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_bready; // @[AxiMM2S2MMTest.scala 32:28]
  wire [7:0] write_master_m_axi_awlen; // @[AxiMM2S2MMTest.scala 32:28]
  wire [3:0] write_master_m_axi_wstrb; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_m_axi_wlast; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] write_master_s_tdata; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_s_tvalid; // @[AxiMM2S2MMTest.scala 32:28]
  wire  write_master_s_tready; // @[AxiMM2S2MMTest.scala 32:28]
  wire [3:0] write_master_s_tkeep; // @[AxiMM2S2MMTest.scala 32:28]
  wire [31:0] wrDmaInfo_addr; // @[AxiMM2S2MMTest.scala 36:25]
  wire [31:0] wrDmaInfo_blength; // @[AxiMM2S2MMTest.scala 36:25]
  wire [31:0] wrDmaInfo_offset; // @[AxiMM2S2MMTest.scala 36:25]
  wire [31:0] wrDmaInfo_wlength; // @[AxiMM2S2MMTest.scala 36:25]
  wire [3:0] wrDmaInfo_fkeep; // @[AxiMM2S2MMTest.scala 36:25]
  wire [3:0] wrDmaInfo_lkeep; // @[AxiMM2S2MMTest.scala 36:25]
  reg  done_0; // @[AxiMM2S2MMTest.scala 14:21]
  reg  done_1; // @[AxiMM2S2MMTest.scala 14:21]
  AxiCtrlMM2S2MM axi_ctrl ( // @[AxiMM2S2MMTest.scala 11:24]
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
    .done_0(axi_ctrl_done_0),
    .done_1(axi_ctrl_done_1),
    .read_addr(axi_ctrl_read_addr),
    .write_addr(axi_ctrl_write_addr),
    .rw_length(axi_ctrl_rw_length)
  );
  AxiReadMaster read_master ( // @[AxiMM2S2MMTest.scala 17:27]
    .clock(read_master_clock),
    .reset(read_master_reset),
    .ctrl_start(read_master_ctrl_start),
    .ctrl_done(read_master_ctrl_done),
    .ctrl_offset(read_master_ctrl_offset),
    .ctrl_length(read_master_ctrl_length),
    .ctrl_fkeep(read_master_ctrl_fkeep),
    .ctrl_lkeep(read_master_ctrl_lkeep),
    .m_axi_araddr(read_master_m_axi_araddr),
    .m_axi_arvalid(read_master_m_axi_arvalid),
    .m_axi_arready(read_master_m_axi_arready),
    .m_axi_rdata(read_master_m_axi_rdata),
    .m_axi_rvalid(read_master_m_axi_rvalid),
    .m_axi_rready(read_master_m_axi_rready),
    .m_axi_arlen(read_master_m_axi_arlen),
    .m_axi_rlast(read_master_m_axi_rlast),
    .m_tdata(read_master_m_tdata),
    .m_tvalid(read_master_m_tvalid),
    .m_tkeep(read_master_m_tkeep)
  );
  DmaInfo rdDmaInfo ( // @[AxiMM2S2MMTest.scala 21:25]
    .addr(rdDmaInfo_addr),
    .blength(rdDmaInfo_blength),
    .offset(rdDmaInfo_offset),
    .wlength(rdDmaInfo_wlength),
    .fkeep(rdDmaInfo_fkeep),
    .lkeep(rdDmaInfo_lkeep)
  );
  AxiWriteMaster write_master ( // @[AxiMM2S2MMTest.scala 32:28]
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
    .s_tvalid(write_master_s_tvalid),
    .s_tready(write_master_s_tready),
    .s_tkeep(write_master_s_tkeep)
  );
  DmaInfo wrDmaInfo ( // @[AxiMM2S2MMTest.scala 36:25]
    .addr(wrDmaInfo_addr),
    .blength(wrDmaInfo_blength),
    .offset(wrDmaInfo_offset),
    .wlength(wrDmaInfo_wlength),
    .fkeep(wrDmaInfo_fkeep),
    .lkeep(wrDmaInfo_lkeep)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_rresp = 2'h0; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_bresp = 2'h0; // @[AxiMM2S2MMTest.scala 12:18]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiMM2S2MMTest.scala 12:18]
  assign m_axis_tdata = read_master_m_tdata; // @[AxiMM2S2MMTest.scala 30:17]
  assign m_axis_tvalid = read_master_m_tvalid; // @[AxiMM2S2MMTest.scala 30:17]
  assign m_axis_tkeep = read_master_m_tkeep; // @[AxiMM2S2MMTest.scala 30:17]
  assign s_axis_tready = write_master_s_tready; // @[AxiMM2S2MMTest.scala 42:18]
  assign m_axi_araddr = read_master_m_axi_araddr; // @[AxiIO.scala 51:15]
  assign m_axi_arvalid = read_master_m_axi_arvalid; // @[AxiIO.scala 53:16]
  assign m_axi_rready = 1'h1; // @[AxiIO.scala 59:15]
  assign m_axi_awaddr = write_master_m_axi_awaddr; // @[AxiIO.scala 60:15]
  assign m_axi_awvalid = write_master_m_axi_awvalid; // @[AxiIO.scala 62:16]
  assign m_axi_wdata = write_master_m_axi_wdata; // @[AxiIO.scala 64:14]
  assign m_axi_wvalid = write_master_m_axi_wvalid; // @[AxiIO.scala 67:15]
  assign m_axi_bready = 1'h1; // @[AxiIO.scala 71:15]
  assign m_axi_arlen = read_master_m_axi_arlen; // @[AxiIO.scala 52:14]
  assign m_axi_awlen = write_master_m_axi_awlen; // @[AxiIO.scala 61:14]
  assign m_axi_wstrb = write_master_m_axi_wstrb; // @[AxiIO.scala 65:14]
  assign m_axi_wlast = write_master_m_axi_wlast; // @[AxiIO.scala 66:14]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiMM2S2MMTest.scala 12:18]
  assign axi_ctrl_done_0 = done_0; // @[AxiMM2S2MMTest.scala 15:17]
  assign axi_ctrl_done_1 = done_1; // @[AxiMM2S2MMTest.scala 15:17]
  assign read_master_clock = clock;
  assign read_master_reset = reset;
  assign read_master_ctrl_start = axi_ctrl_start; // @[AxiMM2S2MMTest.scala 18:26]
  assign read_master_ctrl_offset = rdDmaInfo_offset; // @[AxiMM2S2MMTest.scala 25:27]
  assign read_master_ctrl_length = rdDmaInfo_wlength; // @[AxiMM2S2MMTest.scala 26:27]
  assign read_master_ctrl_fkeep = rdDmaInfo_fkeep; // @[AxiMM2S2MMTest.scala 27:26]
  assign read_master_ctrl_lkeep = rdDmaInfo_lkeep; // @[AxiMM2S2MMTest.scala 28:26]
  assign read_master_m_axi_arready = m_axi_arready; // @[AxiIO.scala 54:20]
  assign read_master_m_axi_rdata = m_axi_rdata; // @[AxiIO.scala 55:18]
  assign read_master_m_axi_rvalid = m_axi_rvalid; // @[AxiIO.scala 58:19]
  assign read_master_m_axi_rlast = m_axi_rlast; // @[AxiIO.scala 56:18]
  assign rdDmaInfo_addr = axi_ctrl_read_addr; // @[AxiMM2S2MMTest.scala 22:18]
  assign rdDmaInfo_blength = axi_ctrl_rw_length; // @[AxiMM2S2MMTest.scala 23:21]
  assign write_master_clock = clock;
  assign write_master_reset = reset;
  assign write_master_ctrl_start = axi_ctrl_start; // @[AxiMM2S2MMTest.scala 33:27]
  assign write_master_ctrl_offset = wrDmaInfo_offset; // @[AxiMM2S2MMTest.scala 40:28]
  assign write_master_ctrl_length = wrDmaInfo_wlength; // @[AxiMM2S2MMTest.scala 41:28]
  assign write_master_m_axi_awready = m_axi_awready; // @[AxiIO.scala 63:21]
  assign write_master_m_axi_wready = m_axi_wready; // @[AxiIO.scala 68:20]
  assign write_master_m_axi_bvalid = m_axi_bvalid; // @[AxiIO.scala 70:20]
  assign write_master_s_tdata = s_axis_tdata; // @[AxiMM2S2MMTest.scala 42:18]
  assign write_master_s_tvalid = s_axis_tvalid; // @[AxiMM2S2MMTest.scala 42:18]
  assign write_master_s_tkeep = s_axis_tkeep; // @[AxiMM2S2MMTest.scala 42:18]
  assign wrDmaInfo_addr = axi_ctrl_write_addr; // @[AxiMM2S2MMTest.scala 37:18]
  assign wrDmaInfo_blength = axi_ctrl_rw_length; // @[AxiMM2S2MMTest.scala 38:21]
  always @(posedge clock) begin
    if (reset) begin // @[AxiMM2S2MMTest.scala 14:21]
      done_0 <= 1'h0; // @[AxiMM2S2MMTest.scala 14:21]
    end else begin
      done_0 <= read_master_ctrl_done | done_0; // @[AxiMM2S2MMTest.scala 19:11]
    end
    if (reset) begin // @[AxiMM2S2MMTest.scala 14:21]
      done_1 <= 1'h0; // @[AxiMM2S2MMTest.scala 14:21]
    end else begin
      done_1 <= write_master_ctrl_done | done_1; // @[AxiMM2S2MMTest.scala 34:11]
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
  done_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  done_1 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

module AxiLiteControl(
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
  output        wr_en,
  output        rd_en,
  output [11:0] wr_addr,
  output [11:0] rd_addr,
  output [31:0] wr_data,
  input  [31:0] rd_data
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
  reg [31:0] rdata; // @[AxiLiteControl.scala 16:22]
  reg  rvalid; // @[AxiLiteControl.scala 18:23]
  reg  bvalid; // @[AxiLiteControl.scala 20:23]
  reg  rd_req; // @[AxiLiteControl.scala 27:23]
  reg  wr_req_0; // @[AxiLiteControl.scala 28:23]
  reg  wr_req_1; // @[AxiLiteControl.scala 28:23]
  reg [11:0] rd_addr_reg; // @[AxiLiteControl.scala 29:28]
  reg [11:0] wr_addr_reg; // @[AxiLiteControl.scala 30:28]
  reg [31:0] wr_data_reg; // @[AxiLiteControl.scala 31:28]
  wire [31:0] _GEN_0 = s_axi_awready & s_axi_awvalid ? s_axi_awaddr : {{20'd0}, wr_addr_reg}; // @[AxiLiteControl.scala 37:41 38:17 30:28]
  wire  _GEN_1 = s_axi_awready & s_axi_awvalid | wr_req_0; // @[AxiLiteControl.scala 37:41 39:15 28:23]
  wire  _GEN_3 = s_axi_wready & s_axi_wvalid | wr_req_1; // @[AxiLiteControl.scala 42:39 44:15 28:23]
  wire  _T_3 = ~bvalid; // @[AxiLiteControl.scala 49:16]
  wire  _T_5 = ~bvalid & wr_req_0 & wr_req_1; // @[AxiLiteControl.scala 49:37]
  wire  _GEN_7 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiLiteControl.scala 49:51 55:12 20:23]
  wire [31:0] _GEN_16 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr_reg}; // @[AxiLiteControl.scala 62:41 63:17 29:28]
  wire  _GEN_17 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiLiteControl.scala 62:41 64:12 27:23]
  wire  _T_8 = ~rvalid; // @[AxiLiteControl.scala 69:16]
  wire  _T_9 = ~rvalid & rd_req; // @[AxiLiteControl.scala 69:24]
  wire  _GEN_21 = ~rvalid & rd_req | rvalid; // @[AxiLiteControl.scala 69:35 75:12 18:23]
  wire [31:0] _GEN_28 = reset ? 32'h0 : _GEN_16; // @[AxiLiteControl.scala 29:{28,28}]
  wire [31:0] _GEN_29 = reset ? 32'h0 : _GEN_0; // @[AxiLiteControl.scala 30:{28,28}]
  assign s_axi_arready = ~rd_req & _T_8; // @[AxiLiteControl.scala 78:28]
  assign s_axi_rdata = rdata; // @[AxiLiteControl.scala 21:15]
  assign s_axi_rvalid = rvalid; // @[AxiLiteControl.scala 23:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiLiteControl.scala 58:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiLiteControl.scala 59:30]
  assign s_axi_bvalid = bvalid; // @[AxiLiteControl.scala 25:16]
  assign wr_en = bvalid & s_axi_bready ? 1'h0 : _T_5; // @[AxiLiteControl.scala 47:33 14:9]
  assign rd_en = rvalid & s_axi_rready ? 1'h0 : _T_9; // @[AxiLiteControl.scala 67:33 13:9]
  assign wr_addr = wr_addr_reg; // @[AxiLiteControl.scala 33:11]
  assign rd_addr = rd_addr_reg; // @[AxiLiteControl.scala 32:11]
  assign wr_data = wr_data_reg; // @[AxiLiteControl.scala 34:11 47:33]
  always @(posedge clock) begin
    if (reset) begin // @[AxiLiteControl.scala 16:22]
      rdata <= 32'h0; // @[AxiLiteControl.scala 16:22]
    end else if (!(rvalid & s_axi_rready)) begin // @[AxiLiteControl.scala 67:33]
      if (~rvalid & rd_req) begin // @[AxiLiteControl.scala 69:35]
        rdata <= rd_data; // @[AxiLiteControl.scala 72:11]
      end
    end
    if (reset) begin // @[AxiLiteControl.scala 18:23]
      rvalid <= 1'h0; // @[AxiLiteControl.scala 18:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiLiteControl.scala 67:33]
      rvalid <= 1'h0; // @[AxiLiteControl.scala 68:12]
    end else begin
      rvalid <= _GEN_21;
    end
    if (reset) begin // @[AxiLiteControl.scala 20:23]
      bvalid <= 1'h0; // @[AxiLiteControl.scala 20:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteControl.scala 47:33]
      bvalid <= 1'h0; // @[AxiLiteControl.scala 48:12]
    end else begin
      bvalid <= _GEN_7;
    end
    if (reset) begin // @[AxiLiteControl.scala 27:23]
      rd_req <= 1'h0; // @[AxiLiteControl.scala 27:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiLiteControl.scala 67:33]
      rd_req <= _GEN_17;
    end else if (~rvalid & rd_req) begin // @[AxiLiteControl.scala 69:35]
      rd_req <= 1'h0; // @[AxiLiteControl.scala 76:12]
    end else begin
      rd_req <= _GEN_17;
    end
    if (reset) begin // @[AxiLiteControl.scala 28:23]
      wr_req_0 <= 1'h0; // @[AxiLiteControl.scala 28:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteControl.scala 47:33]
      wr_req_0 <= _GEN_1;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiLiteControl.scala 49:51]
      wr_req_0 <= 1'h0; // @[AxiLiteControl.scala 56:12]
    end else begin
      wr_req_0 <= _GEN_1;
    end
    if (reset) begin // @[AxiLiteControl.scala 28:23]
      wr_req_1 <= 1'h0; // @[AxiLiteControl.scala 28:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteControl.scala 47:33]
      wr_req_1 <= _GEN_3;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiLiteControl.scala 49:51]
      wr_req_1 <= 1'h0; // @[AxiLiteControl.scala 56:12]
    end else begin
      wr_req_1 <= _GEN_3;
    end
    rd_addr_reg <= _GEN_28[11:0]; // @[AxiLiteControl.scala 29:{28,28}]
    wr_addr_reg <= _GEN_29[11:0]; // @[AxiLiteControl.scala 30:{28,28}]
    if (reset) begin // @[AxiLiteControl.scala 31:28]
      wr_data_reg <= 32'h0; // @[AxiLiteControl.scala 31:28]
    end else if (s_axi_wready & s_axi_wvalid) begin // @[AxiLiteControl.scala 42:39]
      wr_data_reg <= s_axi_wdata; // @[AxiLiteControl.scala 43:17]
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
  rdata = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  rvalid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  bvalid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rd_req = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  wr_req_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wr_req_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rd_addr_reg = _RAND_6[11:0];
  _RAND_7 = {1{`RANDOM}};
  wr_addr_reg = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  wr_data_reg = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AxiCtrlMM2S(
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
  output [31:0] read_addr,
  output [31:0] read_length
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_reset; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_wr_en; // @[AxiCtrlMM2S.scala 15:24]
  wire  axi_ctrl_rd_en; // @[AxiCtrlMM2S.scala 15:24]
  wire [11:0] axi_ctrl_wr_addr; // @[AxiCtrlMM2S.scala 15:24]
  wire [11:0] axi_ctrl_rd_addr; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_wr_data; // @[AxiCtrlMM2S.scala 15:24]
  wire [31:0] axi_ctrl_rd_data; // @[AxiCtrlMM2S.scala 15:24]
  reg [31:0] int_read_addr; // @[AxiCtrlMM2S.scala 24:30]
  reg [31:0] int_read_length; // @[AxiCtrlMM2S.scala 25:32]
  wire [31:0] _GEN_0 = axi_ctrl_wr_addr == 12'h0 ? axi_ctrl_wr_data : 32'h0; // @[AxiCtrlMM2S.scala 30:33 31:13 12:9]
  wire [31:0] _GEN_3 = axi_ctrl_wr_en ? _GEN_0 : 32'h0; // @[AxiCtrlMM2S.scala 29:16 12:9]
  wire [15:0] _GEN_6 = axi_ctrl_rd_addr == 12'h4 ? {{15'd0}, done} : 16'hdead; // @[AxiCtrlMM2S.scala 41:11 43:33 44:15]
  wire [15:0] _GEN_7 = axi_ctrl_rd_en ? _GEN_6 : 16'hdead; // @[AxiCtrlMM2S.scala 41:11 42:16]
  AxiLiteControl axi_ctrl ( // @[AxiCtrlMM2S.scala 15:24]
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
    .wr_en(axi_ctrl_wr_en),
    .rd_en(axi_ctrl_rd_en),
    .wr_addr(axi_ctrl_wr_addr),
    .rd_addr(axi_ctrl_rd_addr),
    .wr_data(axi_ctrl_wr_data),
    .rd_data(axi_ctrl_rd_data)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiCtrlMM2S.scala 16:9]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiCtrlMM2S.scala 16:9]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiCtrlMM2S.scala 16:9]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiCtrlMM2S.scala 16:9]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiCtrlMM2S.scala 16:9]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiCtrlMM2S.scala 16:9]
  assign start = _GEN_3[0];
  assign read_addr = int_read_addr; // @[AxiCtrlMM2S.scala 26:13]
  assign read_length = int_read_length; // @[AxiCtrlMM2S.scala 27:15]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiCtrlMM2S.scala 16:9]
  assign axi_ctrl_rd_data = {{16'd0}, _GEN_7}; // @[AxiCtrlMM2S.scala 14:21]
  always @(posedge clock) begin
    if (reset) begin // @[AxiCtrlMM2S.scala 24:30]
      int_read_addr <= 32'h0; // @[AxiCtrlMM2S.scala 24:30]
    end else if (axi_ctrl_wr_en) begin // @[AxiCtrlMM2S.scala 29:16]
      if (axi_ctrl_wr_addr == 12'h10) begin // @[AxiCtrlMM2S.scala 33:33]
        int_read_addr <= axi_ctrl_wr_data; // @[AxiCtrlMM2S.scala 34:21]
      end
    end
    if (reset) begin // @[AxiCtrlMM2S.scala 25:32]
      int_read_length <= 32'h0; // @[AxiCtrlMM2S.scala 25:32]
    end else if (axi_ctrl_wr_en) begin // @[AxiCtrlMM2S.scala 29:16]
      if (axi_ctrl_wr_addr == 12'h14) begin // @[AxiCtrlMM2S.scala 36:33]
        int_read_length <= axi_ctrl_wr_data; // @[AxiCtrlMM2S.scala 37:23]
      end
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
  int_read_length = _RAND_1[31:0];
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
module AxiMM2STest(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE:M_AXI:M_AXIS"
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
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI,CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4, DATA_WIDTH 32"
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

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
  output [7:0]  m_axi_arlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
  input         m_axi_rlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN clock"
     *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *)
  output [3:0]  m_axis_tkeep
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_reset; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_start; // @[AxiMM2STest.scala 11:24]
  wire  axi_ctrl_done; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_read_addr; // @[AxiMM2STest.scala 11:24]
  wire [31:0] axi_ctrl_read_length; // @[AxiMM2STest.scala 11:24]
  wire  read_master_clock; // @[AxiMM2STest.scala 17:27]
  wire  read_master_reset; // @[AxiMM2STest.scala 17:27]
  wire  read_master_ctrl_start; // @[AxiMM2STest.scala 17:27]
  wire  read_master_ctrl_done; // @[AxiMM2STest.scala 17:27]
  wire [31:0] read_master_ctrl_offset; // @[AxiMM2STest.scala 17:27]
  wire [31:0] read_master_ctrl_length; // @[AxiMM2STest.scala 17:27]
  wire [3:0] read_master_ctrl_fkeep; // @[AxiMM2STest.scala 17:27]
  wire [3:0] read_master_ctrl_lkeep; // @[AxiMM2STest.scala 17:27]
  wire [31:0] read_master_m_axi_araddr; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_axi_arvalid; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_axi_arready; // @[AxiMM2STest.scala 17:27]
  wire [31:0] read_master_m_axi_rdata; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_axi_rvalid; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_axi_rready; // @[AxiMM2STest.scala 17:27]
  wire [7:0] read_master_m_axi_arlen; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_axi_rlast; // @[AxiMM2STest.scala 17:27]
  wire [31:0] read_master_m_tdata; // @[AxiMM2STest.scala 17:27]
  wire  read_master_m_tvalid; // @[AxiMM2STest.scala 17:27]
  wire [3:0] read_master_m_tkeep; // @[AxiMM2STest.scala 17:27]
  wire [31:0] dmaInfo_addr; // @[AxiMM2STest.scala 22:23]
  wire [31:0] dmaInfo_blength; // @[AxiMM2STest.scala 22:23]
  wire [31:0] dmaInfo_offset; // @[AxiMM2STest.scala 22:23]
  wire [31:0] dmaInfo_wlength; // @[AxiMM2STest.scala 22:23]
  wire [3:0] dmaInfo_fkeep; // @[AxiMM2STest.scala 22:23]
  wire [3:0] dmaInfo_lkeep; // @[AxiMM2STest.scala 22:23]
  reg  done; // @[AxiMM2STest.scala 14:21]
  AxiCtrlMM2S axi_ctrl ( // @[AxiMM2STest.scala 11:24]
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
    .read_addr(axi_ctrl_read_addr),
    .read_length(axi_ctrl_read_length)
  );
  AxiReadMaster read_master ( // @[AxiMM2STest.scala 17:27]
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
  DmaInfo dmaInfo ( // @[AxiMM2STest.scala 22:23]
    .addr(dmaInfo_addr),
    .blength(dmaInfo_blength),
    .offset(dmaInfo_offset),
    .wlength(dmaInfo_wlength),
    .fkeep(dmaInfo_fkeep),
    .lkeep(dmaInfo_lkeep)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiMM2STest.scala 12:18]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiMM2STest.scala 12:18]
  assign s_axi_rresp = 2'h0; // @[AxiMM2STest.scala 12:18]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiMM2STest.scala 12:18]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiMM2STest.scala 12:18]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiMM2STest.scala 12:18]
  assign s_axi_bresp = 2'h0; // @[AxiMM2STest.scala 12:18]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiMM2STest.scala 12:18]
  assign m_axi_araddr = read_master_m_axi_araddr; // @[AxiMM2STest.scala 18:21]
  assign m_axi_arvalid = read_master_m_axi_arvalid; // @[AxiMM2STest.scala 18:21]
  assign m_axi_rready = 1'h1; // @[AxiMM2STest.scala 18:21]
  assign m_axi_arlen = read_master_m_axi_arlen; // @[AxiMM2STest.scala 18:21]
  assign m_axis_tdata = read_master_m_tdata; // @[AxiMM2STest.scala 31:17]
  assign m_axis_tvalid = read_master_m_tvalid; // @[AxiMM2STest.scala 31:17]
  assign m_axis_tkeep = read_master_m_tkeep; // @[AxiMM2STest.scala 31:17]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiMM2STest.scala 12:18]
  assign axi_ctrl_done = done; // @[AxiMM2STest.scala 15:17]
  assign read_master_clock = clock;
  assign read_master_reset = reset;
  assign read_master_ctrl_start = axi_ctrl_start; // @[AxiMM2STest.scala 19:26]
  assign read_master_ctrl_offset = dmaInfo_offset; // @[AxiMM2STest.scala 26:27]
  assign read_master_ctrl_length = dmaInfo_wlength; // @[AxiMM2STest.scala 27:27]
  assign read_master_ctrl_fkeep = dmaInfo_fkeep; // @[AxiMM2STest.scala 28:26]
  assign read_master_ctrl_lkeep = dmaInfo_lkeep; // @[AxiMM2STest.scala 29:26]
  assign read_master_m_axi_arready = m_axi_arready; // @[AxiMM2STest.scala 18:21]
  assign read_master_m_axi_rdata = m_axi_rdata; // @[AxiMM2STest.scala 18:21]
  assign read_master_m_axi_rvalid = m_axi_rvalid; // @[AxiMM2STest.scala 18:21]
  assign read_master_m_axi_rlast = m_axi_rlast; // @[AxiMM2STest.scala 18:21]
  assign dmaInfo_addr = axi_ctrl_read_addr; // @[AxiMM2STest.scala 23:16]
  assign dmaInfo_blength = axi_ctrl_read_length; // @[AxiMM2STest.scala 24:19]
  always @(posedge clock) begin
    if (reset) begin // @[AxiMM2STest.scala 14:21]
      done <= 1'h0; // @[AxiMM2STest.scala 14:21]
    end else begin
      done <= read_master_ctrl_done | done; // @[AxiMM2STest.scala 20:8]
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

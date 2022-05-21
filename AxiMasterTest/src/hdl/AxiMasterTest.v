module AxiControlSlave(
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
  output [11:0] start,
  input         done_0,
  input         done_1,
  output [31:0] write_addr,
  output [31:0] read_addr,
  output [31:0] write_data_0,
  output [31:0] write_data_1,
  output [31:0] write_data_2,
  output [31:0] write_data_3,
  input  [31:0] read_data_0,
  input  [31:0] read_data_1,
  input  [31:0] read_data_2,
  input  [31:0] read_data_3
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
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] int_write_addr; // @[AxiControlSlave.scala 16:31]
  reg [31:0] int_read_addr; // @[AxiControlSlave.scala 17:30]
  reg [31:0] int_write_data_0; // @[AxiControlSlave.scala 18:31]
  reg [31:0] int_write_data_1; // @[AxiControlSlave.scala 18:31]
  reg [31:0] int_write_data_2; // @[AxiControlSlave.scala 18:31]
  reg [31:0] int_write_data_3; // @[AxiControlSlave.scala 18:31]
  reg [31:0] rdata; // @[AxiControlSlave.scala 23:22]
  reg  rvalid; // @[AxiControlSlave.scala 25:23]
  reg  bvalid; // @[AxiControlSlave.scala 27:23]
  reg  rd_req; // @[AxiControlSlave.scala 34:23]
  reg  wr_req_0; // @[AxiControlSlave.scala 35:23]
  reg  wr_req_1; // @[AxiControlSlave.scala 35:23]
  reg [11:0] rd_addr; // @[AxiControlSlave.scala 36:24]
  reg [11:0] wr_addr; // @[AxiControlSlave.scala 37:24]
  reg [31:0] wr_data; // @[AxiControlSlave.scala 38:24]
  wire [31:0] _GEN_0 = s_axi_awready & s_axi_awvalid ? s_axi_awaddr : {{20'd0}, wr_addr}; // @[AxiControlSlave.scala 41:41 42:13 37:24]
  wire  _GEN_1 = s_axi_awready & s_axi_awvalid | wr_req_0; // @[AxiControlSlave.scala 41:41 43:15 35:23]
  wire  _GEN_3 = s_axi_wready & s_axi_wvalid | wr_req_1; // @[AxiControlSlave.scala 46:39 48:15 35:23]
  wire  _T_3 = ~bvalid; // @[AxiControlSlave.scala 53:16]
  wire [31:0] _GEN_4 = wr_addr == 12'h0 ? wr_data : 32'h0; // @[AxiControlSlave.scala 55:33 56:13 14:9]
  wire [31:0] _GEN_11 = ~bvalid & wr_req_0 & wr_req_1 ? _GEN_4 : 32'h0; // @[AxiControlSlave.scala 53:51 14:9]
  wire  _GEN_19 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiControlSlave.scala 53:51 78:12 27:23]
  wire [31:0] _GEN_23 = bvalid & s_axi_bready ? 32'h0 : _GEN_11; // @[AxiControlSlave.scala 51:33 14:9]
  wire [31:0] _GEN_33 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr}; // @[AxiControlSlave.scala 85:41 86:13 36:24]
  wire  _GEN_34 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiControlSlave.scala 85:41 87:12 34:23]
  wire  _T_15 = ~rvalid; // @[AxiControlSlave.scala 92:16]
  wire [11:0] _rdata_T = {6'h0,3'h0,1'h0,done_1,done_0}; // @[AxiControlSlave.scala 96:21]
  wire [15:0] _GEN_35 = rd_addr == 12'h4 ? {{4'd0}, _rdata_T} : 16'hdead; // @[AxiControlSlave.scala 93:11 95:33 96:13]
  wire [31:0] _GEN_36 = rd_addr == 12'h28 ? read_data_0 : {{16'd0}, _GEN_35}; // @[AxiControlSlave.scala 98:33 99:13]
  wire [31:0] _GEN_37 = rd_addr == 12'h2c ? read_data_1 : _GEN_36; // @[AxiControlSlave.scala 101:33 102:13]
  wire [31:0] _GEN_38 = rd_addr == 12'h30 ? read_data_2 : _GEN_37; // @[AxiControlSlave.scala 104:33 105:13]
  wire  _GEN_42 = ~rvalid & rd_req | rvalid; // @[AxiControlSlave.scala 112:12 25:23 92:35]
  wire [31:0] _GEN_48 = reset ? 32'h0 : _GEN_33; // @[AxiControlSlave.scala 36:{24,24}]
  wire [31:0] _GEN_49 = reset ? 32'h0 : _GEN_0; // @[AxiControlSlave.scala 37:{24,24}]
  assign s_axi_arready = ~rd_req & _T_15; // @[AxiControlSlave.scala 115:28]
  assign s_axi_rdata = rdata; // @[AxiControlSlave.scala 28:15]
  assign s_axi_rvalid = rvalid; // @[AxiControlSlave.scala 30:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiControlSlave.scala 81:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiControlSlave.scala 82:30]
  assign s_axi_bvalid = bvalid; // @[AxiControlSlave.scala 32:16]
  assign start = _GEN_23[11:0];
  assign write_addr = int_write_addr; // @[AxiControlSlave.scala 19:14]
  assign read_addr = int_read_addr; // @[AxiControlSlave.scala 20:13]
  assign write_data_0 = int_write_data_0; // @[AxiControlSlave.scala 21:14]
  assign write_data_1 = int_write_data_1; // @[AxiControlSlave.scala 21:14]
  assign write_data_2 = int_write_data_2; // @[AxiControlSlave.scala 21:14]
  assign write_data_3 = int_write_data_3; // @[AxiControlSlave.scala 21:14]
  always @(posedge clock) begin
    if (reset) begin // @[AxiControlSlave.scala 16:31]
      int_write_addr <= 32'h0; // @[AxiControlSlave.scala 16:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h10) begin // @[AxiControlSlave.scala 58:33]
          int_write_addr <= wr_data; // @[AxiControlSlave.scala 59:22]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 17:30]
      int_read_addr <= 32'h0; // @[AxiControlSlave.scala 17:30]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h14) begin // @[AxiControlSlave.scala 61:33]
          int_read_addr <= wr_data; // @[AxiControlSlave.scala 62:21]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 18:31]
      int_write_data_0 <= 32'h0; // @[AxiControlSlave.scala 18:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h18) begin // @[AxiControlSlave.scala 64:33]
          int_write_data_0 <= wr_data; // @[AxiControlSlave.scala 65:25]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 18:31]
      int_write_data_1 <= 32'h0; // @[AxiControlSlave.scala 18:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h1c) begin // @[AxiControlSlave.scala 67:33]
          int_write_data_1 <= wr_data; // @[AxiControlSlave.scala 68:25]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 18:31]
      int_write_data_2 <= 32'h0; // @[AxiControlSlave.scala 18:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h20) begin // @[AxiControlSlave.scala 70:33]
          int_write_data_2 <= wr_data; // @[AxiControlSlave.scala 71:25]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 18:31]
      int_write_data_3 <= 32'h0; // @[AxiControlSlave.scala 18:31]
    end else if (!(bvalid & s_axi_bready)) begin // @[AxiControlSlave.scala 51:33]
      if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
        if (wr_addr == 12'h24) begin // @[AxiControlSlave.scala 73:33]
          int_write_data_3 <= wr_data; // @[AxiControlSlave.scala 74:25]
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 23:22]
      rdata <= 32'h0; // @[AxiControlSlave.scala 23:22]
    end else if (!(rvalid & s_axi_rready)) begin // @[AxiControlSlave.scala 90:33]
      if (~rvalid & rd_req) begin // @[AxiControlSlave.scala 92:35]
        if (rd_addr == 12'h34) begin // @[AxiControlSlave.scala 107:33]
          rdata <= read_data_3; // @[AxiControlSlave.scala 108:13]
        end else begin
          rdata <= _GEN_38;
        end
      end
    end
    if (reset) begin // @[AxiControlSlave.scala 25:23]
      rvalid <= 1'h0; // @[AxiControlSlave.scala 25:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiControlSlave.scala 90:33]
      rvalid <= 1'h0; // @[AxiControlSlave.scala 91:12]
    end else begin
      rvalid <= _GEN_42;
    end
    if (reset) begin // @[AxiControlSlave.scala 27:23]
      bvalid <= 1'h0; // @[AxiControlSlave.scala 27:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiControlSlave.scala 51:33]
      bvalid <= 1'h0; // @[AxiControlSlave.scala 52:12]
    end else begin
      bvalid <= _GEN_19;
    end
    if (reset) begin // @[AxiControlSlave.scala 34:23]
      rd_req <= 1'h0; // @[AxiControlSlave.scala 34:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiControlSlave.scala 90:33]
      rd_req <= _GEN_34;
    end else if (~rvalid & rd_req) begin // @[AxiControlSlave.scala 92:35]
      rd_req <= 1'h0; // @[AxiControlSlave.scala 113:12]
    end else begin
      rd_req <= _GEN_34;
    end
    if (reset) begin // @[AxiControlSlave.scala 35:23]
      wr_req_0 <= 1'h0; // @[AxiControlSlave.scala 35:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiControlSlave.scala 51:33]
      wr_req_0 <= _GEN_1;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
      wr_req_0 <= 1'h0; // @[AxiControlSlave.scala 79:12]
    end else begin
      wr_req_0 <= _GEN_1;
    end
    if (reset) begin // @[AxiControlSlave.scala 35:23]
      wr_req_1 <= 1'h0; // @[AxiControlSlave.scala 35:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiControlSlave.scala 51:33]
      wr_req_1 <= _GEN_3;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiControlSlave.scala 53:51]
      wr_req_1 <= 1'h0; // @[AxiControlSlave.scala 79:12]
    end else begin
      wr_req_1 <= _GEN_3;
    end
    rd_addr <= _GEN_48[11:0]; // @[AxiControlSlave.scala 36:{24,24}]
    wr_addr <= _GEN_49[11:0]; // @[AxiControlSlave.scala 37:{24,24}]
    if (reset) begin // @[AxiControlSlave.scala 38:24]
      wr_data <= 32'h0; // @[AxiControlSlave.scala 38:24]
    end else if (s_axi_wready & s_axi_wvalid) begin // @[AxiControlSlave.scala 46:39]
      wr_data <= s_axi_wdata; // @[AxiControlSlave.scala 47:13]
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
  int_read_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  int_write_data_0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  int_write_data_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  int_write_data_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  int_write_data_3 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  rdata = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  rvalid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bvalid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rd_req = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  wr_req_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  wr_req_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  rd_addr = _RAND_12[11:0];
  _RAND_13 = {1{`RANDOM}};
  wr_addr = _RAND_13[11:0];
  _RAND_14 = {1{`RANDOM}};
  wr_data = _RAND_14[31:0];
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
  wire [7:0] _count_r_T_7 = load_value - 8'h1; // @[UpDownLoadCounter.scala 29:39]
  wire [7:0] _count_r_T_13 = count_r - 8'h1; // @[UpDownLoadCounter.scala 33:51]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 37:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 8'hff; // @[UpDownLoadCounter.scala 20:24]
    end else if (load) begin // @[UpDownLoadCounter.scala 26:17]
      if (decr) begin // @[Mux.scala 101:16]
        count_r <= _count_r_T_7;
      end else begin
        count_r <= load_value;
      end
    end else if (decr) begin // @[UpDownLoadCounter.scala 33:30]
      count_r <= _count_r_T_13; // @[UpDownLoadCounter.scala 33:40]
    end
    if (reset) begin // @[UpDownLoadCounter.scala 21:26]
      is_zero_r <= 1'h0; // @[UpDownLoadCounter.scala 21:26]
    end else if (load) begin // @[UpDownLoadCounter.scala 40:17]
      is_zero_r <= load_value == 8'h0; // @[UpDownLoadCounter.scala 40:29]
    end else if (decr) begin // @[UpDownLoadCounter.scala 42:23]
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
  output [23:0] count,
  output        is_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] count_r; // @[UpDownLoadCounter.scala 20:24]
  reg  is_zero_r; // @[UpDownLoadCounter.scala 21:26]
  wire [23:0] _count_r_T_7 = 24'h0 - 24'h1; // @[UpDownLoadCounter.scala 29:39]
  wire [23:0] _count_r_T_13 = count_r - 24'h1; // @[UpDownLoadCounter.scala 33:51]
  wire  _is_zero_r_T_8 = decr ? decr & count_r == 24'h1 : is_zero_r; // @[UpDownLoadCounter.scala 42:23]
  wire  _GEN_4 = load | _is_zero_r_T_8; // @[UpDownLoadCounter.scala 40:{17,29} 42:17]
  assign count = count_r; // @[UpDownLoadCounter.scala 23:9]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 37:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 24'h0; // @[UpDownLoadCounter.scala 20:24]
    end else if (load) begin // @[UpDownLoadCounter.scala 26:17]
      if (decr) begin // @[Mux.scala 101:16]
        count_r <= _count_r_T_7;
      end else begin
        count_r <= 24'h0;
      end
    end else if (decr) begin // @[UpDownLoadCounter.scala 33:30]
      count_r <= _count_r_T_13; // @[UpDownLoadCounter.scala 33:40]
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
  wire  _count_r_T_1 = incr & ~decr; // @[UpDownLoadCounter.scala 28:15]
  wire  _count_r_T_5 = ~incr & decr; // @[UpDownLoadCounter.scala 29:16]
  wire [7:0] _count_r_T_11 = count_r + 8'h1; // @[UpDownLoadCounter.scala 32:51]
  wire [7:0] _count_r_T_13 = count_r - 8'h1; // @[UpDownLoadCounter.scala 33:51]
  wire  _is_zero_r_T_8 = incr ^ decr ? decr & count_r == 8'h1 | incr & count_r == 8'hff : is_zero_r; // @[UpDownLoadCounter.scala 42:23]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 37:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 8'h0; // @[UpDownLoadCounter.scala 20:24]
    end else if (_count_r_T_1) begin // @[UpDownLoadCounter.scala 32:30]
      count_r <= _count_r_T_11; // @[UpDownLoadCounter.scala 32:40]
    end else if (_count_r_T_5) begin // @[UpDownLoadCounter.scala 33:30]
      count_r <= _count_r_T_13; // @[UpDownLoadCounter.scala 33:40]
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
  output [31:0] m_axi_awaddr,
  output        m_axi_awvalid,
  input         m_axi_awready,
  output [31:0] m_axi_wdata,
  output        m_axi_wvalid,
  input         m_axi_wready,
  input         m_axi_bvalid,
  output        m_axi_bready,
  output [7:0]  m_axi_awlen,
  output        m_axi_wlast,
  input  [31:0] s_tdata,
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
  wire [23:0] aw_transaction_cntr_count; // @[AxiWriteMaster.scala 101:35]
  wire  aw_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 101:35]
  wire  b_transaction_cntr_clock; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_reset; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_load; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_decr; // @[AxiWriteMaster.scala 114:34]
  wire [23:0] b_transaction_cntr_count; // @[AxiWriteMaster.scala 114:34]
  wire  b_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 114:34]
  reg  wfirst; // @[AxiWriteMaster.scala 16:23]
  reg  wfirst_pulse; // @[AxiWriteMaster.scala 17:29]
  reg  w_almost_final_transaction; // @[AxiWriteMaster.scala 18:43]
  reg  awvalid_r; // @[AxiWriteMaster.scala 21:26]
  reg [31:0] addr; // @[AxiWriteMaster.scala 22:21]
  reg  start; // @[AxiWriteMaster.scala 32:22]
  reg [7:0] final_burst_len; // @[AxiWriteMaster.scala 35:32]
  wire  bxfer = m_axi_bready & m_axi_bvalid; // @[AxiWriteMaster.scala 112:25]
  wire  b_final_transaction = b_transaction_cntr_is_zero; // @[AxiWriteMaster.scala 120:23 15:33]
  wire  wxfer = s_tvalid & m_axi_wready; // @[AxiWriteMaster.scala 47:24]
  wire  _wfirst_T = wxfer ? m_axi_wlast : wfirst; // @[AxiWriteMaster.scala 49:16]
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
    .count(aw_transaction_cntr_count),
    .is_zero(aw_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_1 b_transaction_cntr ( // @[AxiWriteMaster.scala 114:34]
    .clock(b_transaction_cntr_clock),
    .reset(b_transaction_cntr_reset),
    .load(b_transaction_cntr_load),
    .decr(b_transaction_cntr_decr),
    .count(b_transaction_cntr_count),
    .is_zero(b_transaction_cntr_is_zero)
  );
  assign ctrl_done = bxfer & b_final_transaction; // @[AxiWriteMaster.scala 37:22]
  assign m_axi_awaddr = addr; // @[AxiWriteMaster.scala 84:16]
  assign m_axi_awvalid = awvalid_r; // @[AxiWriteMaster.scala 79:17]
  assign m_axi_wdata = s_tdata; // @[AxiWriteMaster.scala 43:15]
  assign m_axi_wvalid = s_tvalid; // @[AxiWriteMaster.scala 42:16]
  assign m_axi_bready = 1'h1; // @[AxiWriteMaster.scala 111:16]
  assign m_axi_awlen = aw_final_transaction | start ? final_burst_len : 8'hff; // @[AxiWriteMaster.scala 88:21]
  assign m_axi_wlast = burst_cntr_is_zero; // @[AxiWriteMaster.scala 60:18]
  assign s_tready = m_axi_wready; // @[AxiWriteMaster.scala 45:12]
  assign burst_cntr_clock = clock;
  assign burst_cntr_reset = reset;
  assign burst_cntr_load = wxfer & m_axi_wlast & w_almost_final_transaction | start; // @[AxiWriteMaster.scala 52:76]
  assign burst_cntr_decr = s_tvalid & m_axi_wready; // @[AxiWriteMaster.scala 47:24]
  assign burst_cntr_load_value = final_burst_len; // @[AxiWriteMaster.scala 59:25]
  assign w_transaction_cntr_clock = clock;
  assign w_transaction_cntr_reset = reset;
  assign w_transaction_cntr_load = start; // @[AxiWriteMaster.scala 65:27]
  assign w_transaction_cntr_decr = wxfer & m_axi_wlast; // @[AxiWriteMaster.scala 67:36]
  assign w_to_aw_cntr_clock = clock;
  assign w_to_aw_cntr_reset = reset;
  assign w_to_aw_cntr_incr = wfirst_pulse; // @[AxiWriteMaster.scala 93:21]
  assign w_to_aw_cntr_decr = awvalid_r & m_axi_awready; // @[AxiWriteMaster.scala 80:26]
  assign aw_transaction_cntr_clock = clock;
  assign aw_transaction_cntr_reset = reset;
  assign aw_transaction_cntr_load = start; // @[AxiWriteMaster.scala 103:28]
  assign aw_transaction_cntr_decr = awvalid_r & m_axi_awready; // @[AxiWriteMaster.scala 80:26]
  assign b_transaction_cntr_clock = clock;
  assign b_transaction_cntr_reset = reset;
  assign b_transaction_cntr_load = start; // @[AxiWriteMaster.scala 116:27]
  assign b_transaction_cntr_decr = m_axi_bready & m_axi_bvalid; // @[AxiWriteMaster.scala 112:25]
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
    final_burst_len <= 8'h4 - 8'h1; // @[AxiWriteMaster.scala 35:51]
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
  final_burst_len = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  wfirst_dl = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpDownLoadCounter_6(
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
  wire  _count_r_T_1 = incr & ~decr; // @[UpDownLoadCounter.scala 28:15]
  wire  _count_r_T_5 = ~incr & decr; // @[UpDownLoadCounter.scala 29:16]
  wire [1:0] _count_r_T_11 = count_r + 2'h1; // @[UpDownLoadCounter.scala 32:51]
  wire [1:0] _count_r_T_13 = count_r - 2'h1; // @[UpDownLoadCounter.scala 33:51]
  assign is_zero = is_zero_r; // @[UpDownLoadCounter.scala 37:11]
  always @(posedge clock) begin
    if (reset) begin // @[UpDownLoadCounter.scala 20:24]
      count_r <= 2'h3; // @[UpDownLoadCounter.scala 20:24]
    end else if (_count_r_T_1) begin // @[UpDownLoadCounter.scala 32:30]
      count_r <= _count_r_T_11; // @[UpDownLoadCounter.scala 32:40]
    end else if (_count_r_T_5) begin // @[UpDownLoadCounter.scala 33:30]
      count_r <= _count_r_T_13; // @[UpDownLoadCounter.scala 33:40]
    end
    if (reset) begin // @[UpDownLoadCounter.scala 21:26]
      is_zero_r <= 1'h0; // @[UpDownLoadCounter.scala 21:26]
    end else if (incr ^ decr) begin // @[UpDownLoadCounter.scala 42:23]
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
  output [31:0] m_axi_araddr,
  output        m_axi_arvalid,
  input         m_axi_arready,
  input  [31:0] m_axi_rdata,
  input         m_axi_rvalid,
  output        m_axi_rready,
  output [7:0]  m_axi_arlen,
  input         m_axi_rlast,
  output [31:0] m_tdata,
  output        m_tvalid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  ar_transaction_cntr_clock; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_reset; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_load; // @[AxiReadMaster.scala 60:35]
  wire  ar_transaction_cntr_decr; // @[AxiReadMaster.scala 60:35]
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
  wire [23:0] r_transaction_cntr_count; // @[AxiReadMaster.scala 97:34]
  wire  r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 97:34]
  reg  arvalid_r; // @[AxiReadMaster.scala 17:26]
  reg  ar_idle; // @[AxiReadMaster.scala 18:24]
  reg [31:0] addr; // @[AxiReadMaster.scala 19:21]
  wire  rxfer = m_axi_rready & m_axi_rvalid; // @[AxiReadMaster.scala 92:25]
  wire  r_final_transaction = r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 103:23 25:33]
  reg  start; // @[AxiReadMaster.scala 35:22]
  reg [7:0] final_burst_len; // @[AxiReadMaster.scala 38:32]
  wire  ar_final_transaction = ar_transaction_cntr_is_zero; // @[AxiReadMaster.scala 20:34 66:24]
  wire  arxfer = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  wire  stall_ar = ar_to_r_transaction_cntr_is_zero; // @[AxiReadMaster.scala 21:22 78:12]
  wire  _arvalid_r_T_7 = m_axi_arready ? 1'h0 : arvalid_r; // @[AxiReadMaster.scala 51:84]
  wire  ar_done = ar_final_transaction & arxfer; // @[AxiReadMaster.scala 68:35]
  wire  _ar_idle_T_1 = start ? 1'h0 : ar_done | ar_idle; // @[AxiReadMaster.scala 54:17]
  wire [31:0] _addr_T_1 = addr + 32'h400; // @[AxiReadMaster.scala 57:57]
  UpDownLoadCounter_1 ar_transaction_cntr ( // @[AxiReadMaster.scala 60:35]
    .clock(ar_transaction_cntr_clock),
    .reset(ar_transaction_cntr_reset),
    .load(ar_transaction_cntr_load),
    .decr(ar_transaction_cntr_decr),
    .count(ar_transaction_cntr_count),
    .is_zero(ar_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_6 ar_to_r_transaction_cntr ( // @[AxiReadMaster.scala 72:40]
    .clock(ar_to_r_transaction_cntr_clock),
    .reset(ar_to_r_transaction_cntr_reset),
    .incr(ar_to_r_transaction_cntr_incr),
    .decr(ar_to_r_transaction_cntr_decr),
    .is_zero(ar_to_r_transaction_cntr_is_zero)
  );
  UpDownLoadCounter_1 r_transaction_cntr ( // @[AxiReadMaster.scala 97:34]
    .clock(r_transaction_cntr_clock),
    .reset(r_transaction_cntr_reset),
    .load(r_transaction_cntr_load),
    .decr(r_transaction_cntr_decr),
    .count(r_transaction_cntr_count),
    .is_zero(r_transaction_cntr_is_zero)
  );
  assign ctrl_done = rxfer & m_axi_rlast & r_final_transaction; // @[AxiReadMaster.scala 29:36]
  assign m_axi_araddr = addr; // @[AxiReadMaster.scala 46:16]
  assign m_axi_arvalid = arvalid_r; // @[AxiReadMaster.scala 45:17]
  assign m_axi_rready = 1'h1; // @[AxiReadMaster.scala 91:16]
  assign m_axi_arlen = ar_final_transaction | start ? final_burst_len : 8'hff; // @[AxiReadMaster.scala 47:21]
  assign m_tdata = m_axi_rdata; // @[AxiReadMaster.scala 83:11]
  assign m_tvalid = m_axi_rvalid; // @[AxiReadMaster.scala 82:12]
  assign ar_transaction_cntr_clock = clock;
  assign ar_transaction_cntr_reset = reset;
  assign ar_transaction_cntr_load = start; // @[AxiReadMaster.scala 62:28]
  assign ar_transaction_cntr_decr = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  assign ar_to_r_transaction_cntr_clock = clock;
  assign ar_to_r_transaction_cntr_reset = reset;
  assign ar_to_r_transaction_cntr_incr = rxfer & m_axi_rlast; // @[AxiReadMaster.scala 75:42]
  assign ar_to_r_transaction_cntr_decr = arvalid_r & m_axi_arready; // @[AxiReadMaster.scala 49:26]
  assign r_transaction_cntr_clock = clock;
  assign r_transaction_cntr_reset = reset;
  assign r_transaction_cntr_load = start; // @[AxiReadMaster.scala 99:27]
  assign r_transaction_cntr_decr = rxfer & m_axi_rlast; // @[AxiReadMaster.scala 95:39]
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
    if (reset) begin // @[AxiReadMaster.scala 35:22]
      start <= 1'h0; // @[AxiReadMaster.scala 35:22]
    end else begin
      start <= ctrl_start; // @[AxiReadMaster.scala 35:22]
    end
    final_burst_len <= 8'h4 - 8'h1; // @[AxiReadMaster.scala 38:51]
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
  start = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  final_burst_len = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AxiMasterTest(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE:M_AXI"
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
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4LITE, DATA_WIDTH 32"
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
    X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock, ID_WIDTH 0, PROTOCOL AXI4, DATA_WIDTH 32"
     *)
  output [31:0] m_axi_wr_awaddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
  output        m_axi_wr_awvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
  input         m_axi_wr_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
  output [31:0] m_axi_wr_wdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
  output        m_axi_wr_wvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
  input         m_axi_wr_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
  input  [1:0]  m_axi_wr_bresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
  input         m_axi_wr_bvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
  output        m_axi_wr_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
  output [7:0]  m_axi_wr_awlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output [3:0]  m_axi_wr_wstrb,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
  output        m_axi_wr_wlast,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
  output [31:0] m_axi_rd_araddr,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
  output        m_axi_rd_arvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
  input         m_axi_rd_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
  input  [31:0] m_axi_rd_rdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
  input  [1:0]  m_axi_rd_rresp,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
  input         m_axi_rd_rvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
  output        m_axi_rd_rready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
  output [7:0]  m_axi_rd_arlen,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
  input         m_axi_rd_rlast,
  output        wr_done,
  output        rd_done
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
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_reset; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiMasterTest.scala 17:24]
  wire [11:0] axi_ctrl_start; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_done_0; // @[AxiMasterTest.scala 17:24]
  wire  axi_ctrl_done_1; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_write_addr; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_read_addr; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_write_data_0; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_write_data_1; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_write_data_2; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_write_data_3; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_read_data_0; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_read_data_1; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_read_data_2; // @[AxiMasterTest.scala 17:24]
  wire [31:0] axi_ctrl_read_data_3; // @[AxiMasterTest.scala 17:24]
  wire  write_master_clock; // @[AxiMasterTest.scala 22:28]
  wire  write_master_reset; // @[AxiMasterTest.scala 22:28]
  wire  write_master_ctrl_start; // @[AxiMasterTest.scala 22:28]
  wire  write_master_ctrl_done; // @[AxiMasterTest.scala 22:28]
  wire [31:0] write_master_ctrl_offset; // @[AxiMasterTest.scala 22:28]
  wire [31:0] write_master_m_axi_awaddr; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_awvalid; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_awready; // @[AxiMasterTest.scala 22:28]
  wire [31:0] write_master_m_axi_wdata; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_wvalid; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_wready; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_bvalid; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_bready; // @[AxiMasterTest.scala 22:28]
  wire [7:0] write_master_m_axi_awlen; // @[AxiMasterTest.scala 22:28]
  wire  write_master_m_axi_wlast; // @[AxiMasterTest.scala 22:28]
  wire [31:0] write_master_s_tdata; // @[AxiMasterTest.scala 22:28]
  wire  write_master_s_tvalid; // @[AxiMasterTest.scala 22:28]
  wire  write_master_s_tready; // @[AxiMasterTest.scala 22:28]
  wire  read_master_clock; // @[AxiMasterTest.scala 59:27]
  wire  read_master_reset; // @[AxiMasterTest.scala 59:27]
  wire  read_master_ctrl_start; // @[AxiMasterTest.scala 59:27]
  wire  read_master_ctrl_done; // @[AxiMasterTest.scala 59:27]
  wire [31:0] read_master_ctrl_offset; // @[AxiMasterTest.scala 59:27]
  wire [31:0] read_master_m_axi_araddr; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_axi_arvalid; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_axi_arready; // @[AxiMasterTest.scala 59:27]
  wire [31:0] read_master_m_axi_rdata; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_axi_rvalid; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_axi_rready; // @[AxiMasterTest.scala 59:27]
  wire [7:0] read_master_m_axi_arlen; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_axi_rlast; // @[AxiMasterTest.scala 59:27]
  wire [31:0] read_master_m_tdata; // @[AxiMasterTest.scala 59:27]
  wire  read_master_m_tvalid; // @[AxiMasterTest.scala 59:27]
  reg  done_0; // @[AxiMasterTest.scala 15:21]
  reg  done_1; // @[AxiMasterTest.scala 15:21]
  reg [31:0] read_data_0; // @[AxiMasterTest.scala 16:26]
  reg [31:0] read_data_1; // @[AxiMasterTest.scala 16:26]
  reg [31:0] read_data_2; // @[AxiMasterTest.scala 16:26]
  reg [31:0] read_data_3; // @[AxiMasterTest.scala 16:26]
  reg [1:0] wr_state; // @[AxiMasterTest.scala 26:25]
  reg [1:0] wr_cnt; // @[AxiMasterTest.scala 27:23]
  wire [1:0] _wr_cnt_T_1 = wr_cnt + 2'h1; // @[AxiMasterTest.scala 39:26]
  wire [1:0] _GEN_3 = wr_cnt == 2'h3 ? 2'h2 : wr_state; // @[AxiMasterTest.scala 26:25 40:{31,42}]
  wire  _GEN_6 = write_master_ctrl_done; // @[AxiMasterTest.scala 12:11 44:37 45:17]
  wire  _GEN_7 = write_master_ctrl_done | done_0; // @[AxiMasterTest.scala 44:37 46:17 15:21]
  wire [1:0] _GEN_8 = write_master_ctrl_done ? 2'h0 : wr_state; // @[AxiMasterTest.scala 44:37 47:18 26:25]
  wire  _GEN_14 = 2'h1 == wr_state ? 1'h0 : 2'h2 == wr_state & _GEN_6; // @[AxiMasterTest.scala 12:11 29:21]
  wire [31:0] _GEN_20 = axi_ctrl_write_data_0; // @[AxiMasterTest.scala 55:{24,24}]
  wire [31:0] _GEN_21 = 2'h1 == wr_cnt ? axi_ctrl_write_data_1 : _GEN_20; // @[AxiMasterTest.scala 55:{24,24}]
  wire [31:0] _GEN_22 = 2'h2 == wr_cnt ? axi_ctrl_write_data_2 : _GEN_21; // @[AxiMasterTest.scala 55:{24,24}]
  reg [1:0] rd_state; // @[AxiMasterTest.scala 63:25]
  reg [1:0] rd_cnt; // @[AxiMasterTest.scala 64:23]
  wire [1:0] _rd_cnt_T_1 = rd_cnt + 2'h1; // @[AxiMasterTest.scala 76:26]
  wire [31:0] _read_data_rd_cnt = read_master_m_tdata; // @[AxiMasterTest.scala 78:{25,25}]
  wire  _GEN_34 = 2'h2 == rd_state | done_1; // @[AxiMasterTest.scala 66:21 83:17 15:21]
  wire  _GEN_42 = 2'h1 == rd_state ? 1'h0 : 2'h2 == rd_state; // @[AxiMasterTest.scala 13:11 66:21]
  AxiControlSlave axi_ctrl ( // @[AxiMasterTest.scala 17:24]
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
    .write_addr(axi_ctrl_write_addr),
    .read_addr(axi_ctrl_read_addr),
    .write_data_0(axi_ctrl_write_data_0),
    .write_data_1(axi_ctrl_write_data_1),
    .write_data_2(axi_ctrl_write_data_2),
    .write_data_3(axi_ctrl_write_data_3),
    .read_data_0(axi_ctrl_read_data_0),
    .read_data_1(axi_ctrl_read_data_1),
    .read_data_2(axi_ctrl_read_data_2),
    .read_data_3(axi_ctrl_read_data_3)
  );
  AxiWriteMaster write_master ( // @[AxiMasterTest.scala 22:28]
    .clock(write_master_clock),
    .reset(write_master_reset),
    .ctrl_start(write_master_ctrl_start),
    .ctrl_done(write_master_ctrl_done),
    .ctrl_offset(write_master_ctrl_offset),
    .m_axi_awaddr(write_master_m_axi_awaddr),
    .m_axi_awvalid(write_master_m_axi_awvalid),
    .m_axi_awready(write_master_m_axi_awready),
    .m_axi_wdata(write_master_m_axi_wdata),
    .m_axi_wvalid(write_master_m_axi_wvalid),
    .m_axi_wready(write_master_m_axi_wready),
    .m_axi_bvalid(write_master_m_axi_bvalid),
    .m_axi_bready(write_master_m_axi_bready),
    .m_axi_awlen(write_master_m_axi_awlen),
    .m_axi_wlast(write_master_m_axi_wlast),
    .s_tdata(write_master_s_tdata),
    .s_tvalid(write_master_s_tvalid),
    .s_tready(write_master_s_tready)
  );
  AxiReadMaster read_master ( // @[AxiMasterTest.scala 59:27]
    .clock(read_master_clock),
    .reset(read_master_reset),
    .ctrl_start(read_master_ctrl_start),
    .ctrl_done(read_master_ctrl_done),
    .ctrl_offset(read_master_ctrl_offset),
    .m_axi_araddr(read_master_m_axi_araddr),
    .m_axi_arvalid(read_master_m_axi_arvalid),
    .m_axi_arready(read_master_m_axi_arready),
    .m_axi_rdata(read_master_m_axi_rdata),
    .m_axi_rvalid(read_master_m_axi_rvalid),
    .m_axi_rready(read_master_m_axi_rready),
    .m_axi_arlen(read_master_m_axi_arlen),
    .m_axi_rlast(read_master_m_axi_rlast),
    .m_tdata(read_master_m_tdata),
    .m_tvalid(read_master_m_tvalid)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiMasterTest.scala 18:18]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiMasterTest.scala 18:18]
  assign s_axi_rresp = 2'h0; // @[AxiMasterTest.scala 18:18]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiMasterTest.scala 18:18]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiMasterTest.scala 18:18]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiMasterTest.scala 18:18]
  assign s_axi_bresp = 2'h0; // @[AxiMasterTest.scala 18:18]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiMasterTest.scala 18:18]
  assign m_axi_wr_awaddr = write_master_m_axi_awaddr; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_awvalid = write_master_m_axi_awvalid; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_wdata = write_master_m_axi_wdata; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_wvalid = write_master_m_axi_wvalid; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_bready = 1'h1; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_awlen = write_master_m_axi_awlen; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_wstrb = 4'hf; // @[AxiMasterTest.scala 23:22]
  assign m_axi_wr_wlast = write_master_m_axi_wlast; // @[AxiMasterTest.scala 23:22]
  assign m_axi_rd_araddr = read_master_m_axi_araddr; // @[AxiMasterTest.scala 60:21]
  assign m_axi_rd_arvalid = read_master_m_axi_arvalid; // @[AxiMasterTest.scala 60:21]
  assign m_axi_rd_rready = 1'h1; // @[AxiMasterTest.scala 60:21]
  assign m_axi_rd_arlen = read_master_m_axi_arlen; // @[AxiMasterTest.scala 60:21]
  assign wr_done = 2'h0 == wr_state ? 1'h0 : _GEN_14; // @[AxiMasterTest.scala 12:11 29:21]
  assign rd_done = 2'h0 == rd_state ? 1'h0 : _GEN_42; // @[AxiMasterTest.scala 13:11 66:21]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiMasterTest.scala 18:18]
  assign axi_ctrl_done_0 = done_0; // @[AxiMasterTest.scala 19:17]
  assign axi_ctrl_done_1 = done_1; // @[AxiMasterTest.scala 19:17]
  assign axi_ctrl_read_data_0 = read_data_0; // @[AxiMasterTest.scala 20:22]
  assign axi_ctrl_read_data_1 = read_data_1; // @[AxiMasterTest.scala 20:22]
  assign axi_ctrl_read_data_2 = read_data_2; // @[AxiMasterTest.scala 20:22]
  assign axi_ctrl_read_data_3 = read_data_3; // @[AxiMasterTest.scala 20:22]
  assign write_master_clock = clock;
  assign write_master_reset = reset;
  assign write_master_ctrl_start = axi_ctrl_start[0]; // @[AxiMasterTest.scala 52:44]
  assign write_master_ctrl_offset = axi_ctrl_write_addr; // @[AxiMasterTest.scala 53:28]
  assign write_master_m_axi_awready = m_axi_wr_awready; // @[AxiMasterTest.scala 23:22]
  assign write_master_m_axi_wready = m_axi_wr_wready; // @[AxiMasterTest.scala 23:22]
  assign write_master_m_axi_bvalid = m_axi_wr_bvalid; // @[AxiMasterTest.scala 23:22]
  assign write_master_s_tdata = 2'h3 == wr_cnt ? axi_ctrl_write_data_3 : _GEN_22; // @[AxiMasterTest.scala 55:{24,24}]
  assign write_master_s_tvalid = wr_state == 2'h1; // @[AxiMasterTest.scala 57:41]
  assign read_master_clock = clock;
  assign read_master_reset = reset;
  assign read_master_ctrl_start = axi_ctrl_start[1]; // @[AxiMasterTest.scala 88:43]
  assign read_master_ctrl_offset = axi_ctrl_read_addr; // @[AxiMasterTest.scala 89:27]
  assign read_master_m_axi_arready = m_axi_rd_arready; // @[AxiMasterTest.scala 60:21]
  assign read_master_m_axi_rdata = m_axi_rd_rdata; // @[AxiMasterTest.scala 60:21]
  assign read_master_m_axi_rvalid = m_axi_rd_rvalid; // @[AxiMasterTest.scala 60:21]
  assign read_master_m_axi_rlast = m_axi_rd_rlast; // @[AxiMasterTest.scala 60:21]
  always @(posedge clock) begin
    if (reset) begin // @[AxiMasterTest.scala 15:21]
      done_0 <= 1'h0; // @[AxiMasterTest.scala 15:21]
    end else if (2'h0 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      if (axi_ctrl_start[0]) begin // @[AxiMasterTest.scala 31:32]
        done_0 <= 1'h0; // @[AxiMasterTest.scala 34:17]
      end
    end else if (!(2'h1 == wr_state)) begin // @[AxiMasterTest.scala 29:21]
      if (2'h2 == wr_state) begin // @[AxiMasterTest.scala 29:21]
        done_0 <= _GEN_7;
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 15:21]
      done_1 <= 1'h0; // @[AxiMasterTest.scala 15:21]
    end else if (2'h0 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      if (axi_ctrl_start[1]) begin // @[AxiMasterTest.scala 68:32]
        done_1 <= 1'h0; // @[AxiMasterTest.scala 71:17]
      end
    end else if (!(2'h1 == rd_state)) begin // @[AxiMasterTest.scala 66:21]
      done_1 <= _GEN_34;
    end
    if (reset) begin // @[AxiMasterTest.scala 16:26]
      read_data_0 <= 32'h0; // @[AxiMasterTest.scala 16:26]
    end else if (!(2'h0 == rd_state)) begin // @[AxiMasterTest.scala 66:21]
      if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
        if (2'h0 == rd_cnt) begin // @[AxiMasterTest.scala 78:25]
          read_data_0 <= _read_data_rd_cnt; // @[AxiMasterTest.scala 78:25]
        end
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 16:26]
      read_data_1 <= 32'h0; // @[AxiMasterTest.scala 16:26]
    end else if (!(2'h0 == rd_state)) begin // @[AxiMasterTest.scala 66:21]
      if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
        if (2'h1 == rd_cnt) begin // @[AxiMasterTest.scala 78:25]
          read_data_1 <= _read_data_rd_cnt; // @[AxiMasterTest.scala 78:25]
        end
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 16:26]
      read_data_2 <= 32'h0; // @[AxiMasterTest.scala 16:26]
    end else if (!(2'h0 == rd_state)) begin // @[AxiMasterTest.scala 66:21]
      if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
        if (2'h2 == rd_cnt) begin // @[AxiMasterTest.scala 78:25]
          read_data_2 <= _read_data_rd_cnt; // @[AxiMasterTest.scala 78:25]
        end
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 16:26]
      read_data_3 <= 32'h0; // @[AxiMasterTest.scala 16:26]
    end else if (!(2'h0 == rd_state)) begin // @[AxiMasterTest.scala 66:21]
      if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
        if (2'h3 == rd_cnt) begin // @[AxiMasterTest.scala 78:25]
          read_data_3 <= _read_data_rd_cnt; // @[AxiMasterTest.scala 78:25]
        end
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 26:25]
      wr_state <= 2'h0; // @[AxiMasterTest.scala 26:25]
    end else if (2'h0 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      if (axi_ctrl_start[0]) begin // @[AxiMasterTest.scala 31:32]
        wr_state <= 2'h1; // @[AxiMasterTest.scala 33:18]
      end
    end else if (2'h1 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      if (write_master_s_tready) begin // @[AxiMasterTest.scala 38:36]
        wr_state <= _GEN_3;
      end
    end else if (2'h2 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      wr_state <= _GEN_8;
    end
    if (reset) begin // @[AxiMasterTest.scala 27:23]
      wr_cnt <= 2'h0; // @[AxiMasterTest.scala 27:23]
    end else if (2'h0 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      if (axi_ctrl_start[0]) begin // @[AxiMasterTest.scala 31:32]
        wr_cnt <= 2'h0; // @[AxiMasterTest.scala 32:16]
      end
    end else if (2'h1 == wr_state) begin // @[AxiMasterTest.scala 29:21]
      if (write_master_s_tready) begin // @[AxiMasterTest.scala 38:36]
        wr_cnt <= _wr_cnt_T_1; // @[AxiMasterTest.scala 39:16]
      end
    end
    if (reset) begin // @[AxiMasterTest.scala 63:25]
      rd_state <= 2'h0; // @[AxiMasterTest.scala 63:25]
    end else if (2'h0 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      if (axi_ctrl_start[1]) begin // @[AxiMasterTest.scala 68:32]
        rd_state <= 2'h1; // @[AxiMasterTest.scala 70:18]
      end
    end else if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      if (read_master_ctrl_done) begin // @[AxiMasterTest.scala 79:36]
        rd_state <= 2'h2; // @[AxiMasterTest.scala 79:47]
      end
    end else if (2'h2 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      rd_state <= 2'h0; // @[AxiMasterTest.scala 84:18]
    end
    if (reset) begin // @[AxiMasterTest.scala 64:23]
      rd_cnt <= 2'h0; // @[AxiMasterTest.scala 64:23]
    end else if (2'h0 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      if (axi_ctrl_start[1]) begin // @[AxiMasterTest.scala 68:32]
        rd_cnt <= 2'h0; // @[AxiMasterTest.scala 69:16]
      end
    end else if (2'h1 == rd_state) begin // @[AxiMasterTest.scala 66:21]
      if (read_master_m_tvalid) begin // @[AxiMasterTest.scala 75:35]
        rd_cnt <= _rd_cnt_T_1; // @[AxiMasterTest.scala 76:16]
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
  done_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  done_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  read_data_0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  read_data_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  read_data_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  read_data_3 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  wr_state = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  wr_cnt = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  rd_state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  rd_cnt = _RAND_9[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

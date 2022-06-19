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
  wire  _T_2 = bvalid & s_axi_bready; // @[AxiLiteControl.scala 47:16]
  wire  _T_3 = ~bvalid; // @[AxiLiteControl.scala 49:16]
  wire  _T_5 = ~bvalid & wr_req_0 & wr_req_1; // @[AxiLiteControl.scala 49:37]
  wire  _GEN_4 = ~bvalid & wr_req_0 & wr_req_1 & (~_T_2 & _T_5); // @[AxiLiteControl.scala 49:51 51:11 14:9]
  wire  _GEN_7 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiLiteControl.scala 49:51 55:12 20:23]
  wire [31:0] _GEN_16 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr_reg}; // @[AxiLiteControl.scala 62:41 63:17 29:28]
  wire  _GEN_17 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiLiteControl.scala 62:41 64:12 27:23]
  wire  _T_7 = rvalid & s_axi_rready; // @[AxiLiteControl.scala 67:16]
  wire  _T_8 = ~rvalid; // @[AxiLiteControl.scala 69:16]
  wire  _T_9 = ~rvalid & rd_req; // @[AxiLiteControl.scala 69:24]
  wire  _GEN_18 = ~rvalid & rd_req & (~_T_7 & _T_9); // @[AxiLiteControl.scala 69:35 71:11 13:9]
  wire  _GEN_21 = ~rvalid & rd_req | rvalid; // @[AxiLiteControl.scala 69:35 75:12 18:23]
  wire [31:0] _GEN_28 = reset ? 32'h0 : _GEN_16; // @[AxiLiteControl.scala 29:{28,28}]
  wire [31:0] _GEN_29 = reset ? 32'h0 : _GEN_0; // @[AxiLiteControl.scala 30:{28,28}]
  assign s_axi_arready = ~rd_req & _T_8; // @[AxiLiteControl.scala 78:28]
  assign s_axi_rdata = rdata; // @[AxiLiteControl.scala 21:15]
  assign s_axi_rvalid = rvalid; // @[AxiLiteControl.scala 23:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiLiteControl.scala 58:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiLiteControl.scala 59:30]
  assign s_axi_bvalid = bvalid; // @[AxiLiteControl.scala 25:16]
  assign wr_en = bvalid & s_axi_bready ? 1'h0 : _GEN_4; // @[AxiLiteControl.scala 47:33 14:9]
  assign rd_en = rvalid & s_axi_rready ? 1'h0 : _GEN_18; // @[AxiLiteControl.scala 67:33 13:9]
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
module AxiLiteSlaveTest(

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE"
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
  output [7:0]  led,
  input  [7:0]  sw
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  axi_ctrl_clock; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_reset; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_wr_en; // @[AxiLiteSlaveTest.scala 15:24]
  wire  axi_ctrl_rd_en; // @[AxiLiteSlaveTest.scala 15:24]
  wire [11:0] axi_ctrl_wr_addr; // @[AxiLiteSlaveTest.scala 15:24]
  wire [11:0] axi_ctrl_rd_addr; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_wr_data; // @[AxiLiteSlaveTest.scala 15:24]
  wire [31:0] axi_ctrl_rd_data; // @[AxiLiteSlaveTest.scala 15:24]
  reg [7:0] led_r; // @[AxiLiteSlaveTest.scala 11:22]
  wire [31:0] _GEN_0 = axi_ctrl_wr_addr == 12'h0 ? axi_ctrl_wr_data : {{24'd0}, led_r}; // @[AxiLiteSlaveTest.scala 25:33 26:13 11:22]
  wire [31:0] _GEN_1 = axi_ctrl_wr_en ? _GEN_0 : {{24'd0}, led_r}; // @[AxiLiteSlaveTest.scala 24:16 11:22]
  wire [15:0] _GEN_2 = axi_ctrl_rd_addr == 12'h0 ? {{8'd0}, led_r} : 16'hdead; // @[AxiLiteSlaveTest.scala 30:11 32:33 33:15]
  wire [15:0] _GEN_3 = axi_ctrl_rd_addr == 12'h4 ? {{8'd0}, sw} : _GEN_2; // @[AxiLiteSlaveTest.scala 35:33 36:15]
  wire [15:0] _GEN_4 = axi_ctrl_rd_en ? _GEN_3 : 16'hdead; // @[AxiLiteSlaveTest.scala 30:11 31:16]
  wire [31:0] _GEN_5 = reset ? 32'h0 : _GEN_1; // @[AxiLiteSlaveTest.scala 11:{22,22}]
  AxiLiteControl axi_ctrl ( // @[AxiLiteSlaveTest.scala 15:24]
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
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_rresp = 2'h0; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_bresp = 2'h0; // @[AxiLiteSlaveTest.scala 16:9]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiLiteSlaveTest.scala 16:9]
  assign led = led_r; // @[AxiLiteSlaveTest.scala 12:7]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiLiteSlaveTest.scala 16:9]
  assign axi_ctrl_rd_data = {{16'd0}, _GEN_4}; // @[AxiLiteSlaveTest.scala 14:21]
  always @(posedge clock) begin
    led_r <= _GEN_5[7:0]; // @[AxiLiteSlaveTest.scala 11:{22,22}]
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
  led_r = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

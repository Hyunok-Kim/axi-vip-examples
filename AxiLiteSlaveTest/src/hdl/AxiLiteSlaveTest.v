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
  reg [7:0] led_r; // @[AxiLiteSlaveTest.scala 11:22]
  reg [31:0] rdata; // @[AxiLiteSlaveTest.scala 14:22]
  reg  rvalid; // @[AxiLiteSlaveTest.scala 16:23]
  reg  bvalid; // @[AxiLiteSlaveTest.scala 18:23]
  reg  rd_req; // @[AxiLiteSlaveTest.scala 25:23]
  reg  wr_req_0; // @[AxiLiteSlaveTest.scala 26:23]
  reg  wr_req_1; // @[AxiLiteSlaveTest.scala 26:23]
  reg [11:0] rd_addr; // @[AxiLiteSlaveTest.scala 27:24]
  reg [11:0] wr_addr; // @[AxiLiteSlaveTest.scala 28:24]
  reg [31:0] wr_data; // @[AxiLiteSlaveTest.scala 29:24]
  wire [31:0] _GEN_0 = s_axi_awready & s_axi_awvalid ? s_axi_awaddr : {{20'd0}, wr_addr}; // @[AxiLiteSlaveTest.scala 32:41 33:13 28:24]
  wire  _GEN_1 = s_axi_awready & s_axi_awvalid | wr_req_0; // @[AxiLiteSlaveTest.scala 32:41 34:15 26:23]
  wire  _GEN_3 = s_axi_wready & s_axi_wvalid | wr_req_1; // @[AxiLiteSlaveTest.scala 37:39 39:15 26:23]
  wire  _T_3 = ~bvalid; // @[AxiLiteSlaveTest.scala 43:16]
  wire [31:0] _GEN_4 = wr_addr == 12'h0 ? wr_data : {{24'd0}, led_r}; // @[AxiLiteSlaveTest.scala 45:33 46:13 11:22]
  wire [31:0] _GEN_5 = ~bvalid & wr_req_0 & wr_req_1 ? _GEN_4 : {{24'd0}, led_r}; // @[AxiLiteSlaveTest.scala 11:22 43:51]
  wire  _GEN_7 = ~bvalid & wr_req_0 & wr_req_1 | bvalid; // @[AxiLiteSlaveTest.scala 43:51 50:12 18:23]
  wire [31:0] _GEN_11 = bvalid & s_axi_bready ? {{24'd0}, led_r} : _GEN_5; // @[AxiLiteSlaveTest.scala 11:22 41:33]
  wire [31:0] _GEN_15 = s_axi_arready & s_axi_arvalid ? s_axi_araddr : {{20'd0}, rd_addr}; // @[AxiLiteSlaveTest.scala 57:41 58:13 27:24]
  wire  _GEN_16 = s_axi_arready & s_axi_arvalid | rd_req; // @[AxiLiteSlaveTest.scala 57:41 59:12 25:23]
  wire  _T_9 = ~rvalid; // @[AxiLiteSlaveTest.scala 64:16]
  wire [15:0] _GEN_17 = rd_addr == 12'h0 ? {{8'd0}, led_r} : 16'hdead; // @[AxiLiteSlaveTest.scala 65:11 67:33 68:13]
  wire [15:0] _GEN_18 = rd_addr == 12'h4 ? {{8'd0}, sw} : _GEN_17; // @[AxiLiteSlaveTest.scala 70:33 71:13]
  wire  _GEN_21 = ~rvalid & rd_req | rvalid; // @[AxiLiteSlaveTest.scala 64:35 75:12 16:23]
  wire [31:0] _GEN_27 = reset ? 32'h0 : _GEN_11; // @[AxiLiteSlaveTest.scala 11:{22,22}]
  wire [31:0] _GEN_28 = reset ? 32'h0 : _GEN_15; // @[AxiLiteSlaveTest.scala 27:{24,24}]
  wire [31:0] _GEN_29 = reset ? 32'h0 : _GEN_0; // @[AxiLiteSlaveTest.scala 28:{24,24}]
  assign s_axi_arready = ~rd_req & _T_9; // @[AxiLiteSlaveTest.scala 78:28]
  assign s_axi_rdata = rdata; // @[AxiLiteSlaveTest.scala 19:15]
  assign s_axi_rresp = 2'h0; // @[AxiLiteSlaveTest.scala 20:15]
  assign s_axi_rvalid = rvalid; // @[AxiLiteSlaveTest.scala 21:16]
  assign s_axi_awready = ~wr_req_0 & _T_3; // @[AxiLiteSlaveTest.scala 53:31]
  assign s_axi_wready = ~wr_req_1 & _T_3; // @[AxiLiteSlaveTest.scala 54:30]
  assign s_axi_bresp = 2'h0; // @[AxiLiteSlaveTest.scala 22:15]
  assign s_axi_bvalid = bvalid; // @[AxiLiteSlaveTest.scala 23:16]
  assign led = led_r; // @[AxiLiteSlaveTest.scala 12:7]
  always @(posedge clock) begin
    led_r <= _GEN_27[7:0]; // @[AxiLiteSlaveTest.scala 11:{22,22}]
    if (reset) begin // @[AxiLiteSlaveTest.scala 14:22]
      rdata <= 32'h0; // @[AxiLiteSlaveTest.scala 14:22]
    end else if (!(rvalid & s_axi_rready)) begin // @[AxiLiteSlaveTest.scala 62:33]
      if (~rvalid & rd_req) begin // @[AxiLiteSlaveTest.scala 64:35]
        rdata <= {{16'd0}, _GEN_18};
      end
    end
    if (reset) begin // @[AxiLiteSlaveTest.scala 16:23]
      rvalid <= 1'h0; // @[AxiLiteSlaveTest.scala 16:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiLiteSlaveTest.scala 62:33]
      rvalid <= 1'h0; // @[AxiLiteSlaveTest.scala 63:12]
    end else begin
      rvalid <= _GEN_21;
    end
    if (reset) begin // @[AxiLiteSlaveTest.scala 18:23]
      bvalid <= 1'h0; // @[AxiLiteSlaveTest.scala 18:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteSlaveTest.scala 41:33]
      bvalid <= 1'h0; // @[AxiLiteSlaveTest.scala 42:12]
    end else begin
      bvalid <= _GEN_7;
    end
    if (reset) begin // @[AxiLiteSlaveTest.scala 25:23]
      rd_req <= 1'h0; // @[AxiLiteSlaveTest.scala 25:23]
    end else if (rvalid & s_axi_rready) begin // @[AxiLiteSlaveTest.scala 62:33]
      rd_req <= _GEN_16;
    end else if (~rvalid & rd_req) begin // @[AxiLiteSlaveTest.scala 64:35]
      rd_req <= 1'h0; // @[AxiLiteSlaveTest.scala 76:12]
    end else begin
      rd_req <= _GEN_16;
    end
    if (reset) begin // @[AxiLiteSlaveTest.scala 26:23]
      wr_req_0 <= 1'h0; // @[AxiLiteSlaveTest.scala 26:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteSlaveTest.scala 41:33]
      wr_req_0 <= _GEN_1;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiLiteSlaveTest.scala 43:51]
      wr_req_0 <= 1'h0; // @[AxiLiteSlaveTest.scala 51:12]
    end else begin
      wr_req_0 <= _GEN_1;
    end
    if (reset) begin // @[AxiLiteSlaveTest.scala 26:23]
      wr_req_1 <= 1'h0; // @[AxiLiteSlaveTest.scala 26:23]
    end else if (bvalid & s_axi_bready) begin // @[AxiLiteSlaveTest.scala 41:33]
      wr_req_1 <= _GEN_3;
    end else if (~bvalid & wr_req_0 & wr_req_1) begin // @[AxiLiteSlaveTest.scala 43:51]
      wr_req_1 <= 1'h0; // @[AxiLiteSlaveTest.scala 51:12]
    end else begin
      wr_req_1 <= _GEN_3;
    end
    rd_addr <= _GEN_28[11:0]; // @[AxiLiteSlaveTest.scala 27:{24,24}]
    wr_addr <= _GEN_29[11:0]; // @[AxiLiteSlaveTest.scala 28:{24,24}]
    if (reset) begin // @[AxiLiteSlaveTest.scala 29:24]
      wr_data <= 32'h0; // @[AxiLiteSlaveTest.scala 29:24]
    end else if (s_axi_wready & s_axi_wvalid) begin // @[AxiLiteSlaveTest.scala 37:39]
      wr_data <= s_axi_wdata; // @[AxiLiteSlaveTest.scala 38:13]
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
  led_r = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  rdata = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rvalid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  bvalid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  rd_req = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wr_req_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wr_req_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  rd_addr = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  wr_addr = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  wr_data = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

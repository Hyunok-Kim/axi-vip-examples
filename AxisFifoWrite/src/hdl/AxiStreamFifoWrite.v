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
module AxiStreamFifoWrite(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_LITE:M_AXIS"
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

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready
);
  wire  axi_ctrl_clock; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_reset; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_araddr; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_arvalid; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_arready; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_rdata; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_rvalid; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_rready; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_awaddr; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_awvalid; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_awready; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_s_axi_wdata; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_wvalid; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_wready; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_bvalid; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_s_axi_bready; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_wr_en; // @[AxiStreamFifoWrite.scala 11:24]
  wire  axi_ctrl_rd_en; // @[AxiStreamFifoWrite.scala 11:24]
  wire [11:0] axi_ctrl_wr_addr; // @[AxiStreamFifoWrite.scala 11:24]
  wire [11:0] axi_ctrl_rd_addr; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_wr_data; // @[AxiStreamFifoWrite.scala 11:24]
  wire [31:0] axi_ctrl_rd_data; // @[AxiStreamFifoWrite.scala 11:24]
  wire  fifo_almost_empty; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_almost_full; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_data_valid; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_dbiterr; // @[AxiStreamFifoWrite.scala 20:20]
  wire [31:0] fifo_din; // @[AxiStreamFifoWrite.scala 20:20]
  wire [31:0] fifo_dout; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_empty; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_full; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_injectdbiterr; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_injectsbiterr; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_overflow; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_prog_empty; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_prog_full; // @[AxiStreamFifoWrite.scala 20:20]
  wire [9:0] fifo_rd_data_count; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_rd_en; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_rd_rst_busy; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_rst; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_sbiterr; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_sleep; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_underflow; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_wr_ack; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_wr_clk; // @[AxiStreamFifoWrite.scala 20:20]
  wire [9:0] fifo_wr_data_count; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_wr_en; // @[AxiStreamFifoWrite.scala 20:20]
  wire  fifo_wr_rst_busy; // @[AxiStreamFifoWrite.scala 20:20]
  wire  _T = axi_ctrl_wr_addr == 12'h8; // @[AxiStreamFifoWrite.scala 37:19]
  wire [31:0] _GEN_0 = axi_ctrl_wr_addr == 12'h8 ? axi_ctrl_wr_data : 32'h0; // @[AxiStreamFifoWrite.scala 34:12 37:33 38:16]
  wire  _rd_data_T = ~fifo_full; // @[AxiStreamFifoWrite.scala 46:18]
  wire [15:0] _GEN_4 = axi_ctrl_rd_addr == 12'h0 ? {{15'd0}, _rd_data_T} : 16'hdead; // @[AxiStreamFifoWrite.scala 43:11 45:33 46:15]
  wire [15:0] _GEN_5 = axi_ctrl_rd_addr == 12'h4 ? {{6'd0}, fifo_wr_data_count} : _GEN_4; // @[AxiStreamFifoWrite.scala 48:33 49:15]
  wire [15:0] _GEN_6 = axi_ctrl_rd_en ? _GEN_5 : 16'hdead; // @[AxiStreamFifoWrite.scala 43:11 44:16]
  AxiLiteControl axi_ctrl ( // @[AxiStreamFifoWrite.scala 11:24]
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
  xpm_fifo_sync
    #(.RD_DATA_COUNT_WIDTH(10), .READ_DATA_WIDTH(32), .WRITE_DATA_WIDTH(32), .FIFO_WRITE_DEPTH(512), .PROG_EMPTY_THRESH(5), .READ_MODE("fwft"), .WR_DATA_COUNT_WIDTH(10), .PROG_FULL_THRESH(507), .FULL_RESET_VALUE(1), .FIFO_READ_LATENCY(1))
    fifo ( // @[AxiStreamFifoWrite.scala 20:20]
    .almost_empty(fifo_almost_empty),
    .almost_full(fifo_almost_full),
    .data_valid(fifo_data_valid),
    .dbiterr(fifo_dbiterr),
    .din(fifo_din),
    .dout(fifo_dout),
    .empty(fifo_empty),
    .full(fifo_full),
    .injectdbiterr(fifo_injectdbiterr),
    .injectsbiterr(fifo_injectsbiterr),
    .overflow(fifo_overflow),
    .prog_empty(fifo_prog_empty),
    .prog_full(fifo_prog_full),
    .rd_data_count(fifo_rd_data_count),
    .rd_en(fifo_rd_en),
    .rd_rst_busy(fifo_rd_rst_busy),
    .rst(fifo_rst),
    .sbiterr(fifo_sbiterr),
    .sleep(fifo_sleep),
    .underflow(fifo_underflow),
    .wr_ack(fifo_wr_ack),
    .wr_clk(fifo_wr_clk),
    .wr_data_count(fifo_wr_data_count),
    .wr_en(fifo_wr_en),
    .wr_rst_busy(fifo_wr_rst_busy)
  );
  assign s_axi_arready = axi_ctrl_s_axi_arready; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_rdata = axi_ctrl_s_axi_rdata; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_rresp = 2'h0; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_rvalid = axi_ctrl_s_axi_rvalid; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_awready = axi_ctrl_s_axi_awready; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_wready = axi_ctrl_s_axi_wready; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_bresp = 2'h0; // @[AxiStreamFifoWrite.scala 12:9]
  assign s_axi_bvalid = axi_ctrl_s_axi_bvalid; // @[AxiStreamFifoWrite.scala 12:9]
  assign m_axis_tdata = fifo_dout; // @[AxiStreamFifoWrite.scala 29:16]
  assign m_axis_tvalid = ~fifo_empty; // @[AxiStreamFifoWrite.scala 30:20]
  assign axi_ctrl_clock = clock;
  assign axi_ctrl_reset = reset;
  assign axi_ctrl_s_axi_araddr = s_axi_araddr; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_arvalid = s_axi_arvalid; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_rready = s_axi_rready; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_awaddr = s_axi_awaddr; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_awvalid = s_axi_awvalid; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_wdata = s_axi_wdata; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_wvalid = s_axi_wvalid; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_s_axi_bready = s_axi_bready; // @[AxiStreamFifoWrite.scala 12:9]
  assign axi_ctrl_rd_data = {{16'd0}, _GEN_6}; // @[AxiStreamFifoWrite.scala 10:21]
  assign fifo_din = axi_ctrl_wr_en ? _GEN_0 : 32'h0; // @[AxiStreamFifoWrite.scala 34:12 36:16]
  assign fifo_injectdbiterr = 1'h0; // @[AxiStreamFifoWrite.scala 31:22]
  assign fifo_injectsbiterr = 1'h0; // @[AxiStreamFifoWrite.scala 32:22]
  assign fifo_rd_en = m_axis_tready; // @[AxiStreamFifoWrite.scala 28:14]
  assign fifo_rst = reset; // @[AxiStreamFifoWrite.scala 26:21]
  assign fifo_sleep = 1'h0; // @[AxiStreamFifoWrite.scala 25:14]
  assign fifo_wr_clk = clock; // @[AxiStreamFifoWrite.scala 27:15]
  assign fifo_wr_en = axi_ctrl_wr_en & _T; // @[AxiStreamFifoWrite.scala 35:14 36:16]
endmodule

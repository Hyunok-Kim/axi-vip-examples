module AxiStreamFifo(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXIS:S_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  input  [31:0] s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input         s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output        s_axis_tready
);
  wire  fifo_almost_empty; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_almost_full; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_data_valid; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_dbiterr; // @[AxiStreamFifo.scala 10:26]
  wire [31:0] fifo_din; // @[AxiStreamFifo.scala 10:26]
  wire [31:0] fifo_dout; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_empty; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_full; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_injectdbiterr; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_injectsbiterr; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_overflow; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_prog_empty; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_prog_full; // @[AxiStreamFifo.scala 10:26]
  wire [9:0] fifo_rd_data_count; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_rd_en; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_rd_rst_busy; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_rst; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_sbiterr; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_sleep; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_underflow; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_wr_ack; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_wr_clk; // @[AxiStreamFifo.scala 10:26]
  wire [9:0] fifo_wr_data_count; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_wr_en; // @[AxiStreamFifo.scala 10:26]
  wire  fifo_wr_rst_busy; // @[AxiStreamFifo.scala 10:26]
  xpm_fifo_sync
    #(.RD_DATA_COUNT_WIDTH(10), .READ_DATA_WIDTH(32), .WRITE_DATA_WIDTH(32), .FIFO_WRITE_DEPTH(512), .PROG_EMPTY_THRESH(5), .READ_MODE("fwft"), .WR_DATA_COUNT_WIDTH(10), .PROG_FULL_THRESH(507), .FULL_RESET_VALUE(1), .FIFO_READ_LATENCY(1))
    fifo ( // @[AxiStreamFifo.scala 10:26]
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
  assign m_axis_tdata = fifo_dout; // @[AxiStreamFifo.scala 23:22]
  assign m_axis_tvalid = ~fifo_empty; // @[AxiStreamFifo.scala 24:26]
  assign s_axis_tready = ~fifo_full; // @[AxiStreamFifo.scala 21:26]
  assign fifo_din = s_axis_tdata; // @[AxiStreamFifo.scala 20:18]
  assign fifo_injectdbiterr = 1'h0; // @[AxiStreamFifo.scala 25:28]
  assign fifo_injectsbiterr = 1'h0; // @[AxiStreamFifo.scala 26:28]
  assign fifo_rd_en = m_axis_tready; // @[AxiStreamFifo.scala 22:20]
  assign fifo_rst = reset; // @[AxiStreamFifo.scala 17:27]
  assign fifo_sleep = 1'h0; // @[AxiStreamFifo.scala 16:20]
  assign fifo_wr_clk = clock; // @[AxiStreamFifo.scala 18:21]
  assign fifo_wr_en = s_axis_tvalid; // @[AxiStreamFifo.scala 19:20]
endmodule

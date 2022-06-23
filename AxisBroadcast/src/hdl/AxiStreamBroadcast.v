module AxiStreamBroadcast(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS:M00_AXIS:M01_AXIS:M02_AXIS:M03_AXIS"
     *)
  input        clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input        reset,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN clock"
     *)
  input  [7:0] s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input        s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output       s_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
  input        s_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, CLK_DOMAIN clock"
     *)
  output [7:0] m00_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *)
  output       m00_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *)
  input        m00_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *)
  output       m00_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M01_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M01_AXIS, CLK_DOMAIN clock"
     *)
  output [7:0] m01_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M01_AXIS TVALID" *)
  output       m01_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M01_AXIS TREADY" *)
  input        m01_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M01_AXIS TLAST" *)
  output       m01_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M02_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M02_AXIS, CLK_DOMAIN clock"
     *)
  output [7:0] m02_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M02_AXIS TVALID" *)
  output       m02_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M02_AXIS TREADY" *)
  input        m02_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M02_AXIS TLAST" *)
  output       m02_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M03_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M03_AXIS, CLK_DOMAIN clock"
     *)
  output [7:0] m03_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M03_AXIS TVALID" *)
  output       m03_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M03_AXIS TREADY" *)
  input        m03_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M03_AXIS TLAST" *)
  output       m03_axis_tlast
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  m_ready_d_0; // @[AxiStreamBroadcast.scala 12:26]
  reg  m_ready_d_1; // @[AxiStreamBroadcast.scala 12:26]
  reg  m_ready_d_2; // @[AxiStreamBroadcast.scala 12:26]
  reg  m_ready_d_3; // @[AxiStreamBroadcast.scala 12:26]
  wire  _s_axis_tready_T = m_ready_d_0 | m00_axis_tready; // @[AxiStreamBroadcast.scala 17:20]
  wire  _s_axis_tready_T_1 = m_ready_d_1 | m01_axis_tready; // @[AxiStreamBroadcast.scala 17:20]
  wire  _s_axis_tready_T_2 = m_ready_d_2 | m02_axis_tready; // @[AxiStreamBroadcast.scala 17:20]
  wire  _s_axis_tready_T_3 = m_ready_d_3 | m03_axis_tready; // @[AxiStreamBroadcast.scala 17:20]
  wire [3:0] _s_axis_tready_T_4 = {_s_axis_tready_T_3,_s_axis_tready_T_2,_s_axis_tready_T_1,_s_axis_tready_T}; // @[AxiStreamBroadcast.scala 17:40]
  wire  _s_axis_tready_T_7 = ~reset; // @[AxiStreamBroadcast.scala 17:54]
  assign s_axis_tready = &_s_axis_tready_T_4 & ~reset; // @[AxiStreamBroadcast.scala 17:52]
  assign m00_axis_tdata = s_axis_tdata; // @[AxiStreamBroadcast.scala 22:21]
  assign m00_axis_tvalid = s_axis_tvalid & _s_axis_tready_T_7 & ~m_ready_d_0; // @[AxiStreamBroadcast.scala 19:55]
  assign m00_axis_tlast = s_axis_tlast; // @[AxiStreamBroadcast.scala 23:21]
  assign m01_axis_tdata = s_axis_tdata; // @[AxiStreamBroadcast.scala 22:21]
  assign m01_axis_tvalid = s_axis_tvalid & _s_axis_tready_T_7 & ~m_ready_d_1; // @[AxiStreamBroadcast.scala 19:55]
  assign m01_axis_tlast = s_axis_tlast; // @[AxiStreamBroadcast.scala 23:21]
  assign m02_axis_tdata = s_axis_tdata; // @[AxiStreamBroadcast.scala 22:21]
  assign m02_axis_tvalid = s_axis_tvalid & _s_axis_tready_T_7 & ~m_ready_d_2; // @[AxiStreamBroadcast.scala 19:55]
  assign m02_axis_tlast = s_axis_tlast; // @[AxiStreamBroadcast.scala 23:21]
  assign m03_axis_tdata = s_axis_tdata; // @[AxiStreamBroadcast.scala 22:21]
  assign m03_axis_tvalid = s_axis_tvalid & _s_axis_tready_T_7 & ~m_ready_d_3; // @[AxiStreamBroadcast.scala 19:55]
  assign m03_axis_tlast = s_axis_tlast; // @[AxiStreamBroadcast.scala 23:21]
  always @(posedge clock) begin
    if (reset) begin // @[AxiStreamBroadcast.scala 12:26]
      m_ready_d_0 <= 1'h0; // @[AxiStreamBroadcast.scala 12:26]
    end else if (s_axis_tready) begin // @[AxiStreamBroadcast.scala 14:24]
      m_ready_d_0 <= 1'h0;
    end else begin
      m_ready_d_0 <= m_ready_d_0 | m00_axis_tvalid & m00_axis_tready;
    end
    if (reset) begin // @[AxiStreamBroadcast.scala 12:26]
      m_ready_d_1 <= 1'h0; // @[AxiStreamBroadcast.scala 12:26]
    end else if (s_axis_tready) begin // @[AxiStreamBroadcast.scala 14:24]
      m_ready_d_1 <= 1'h0;
    end else begin
      m_ready_d_1 <= m_ready_d_1 | m01_axis_tvalid & m01_axis_tready;
    end
    if (reset) begin // @[AxiStreamBroadcast.scala 12:26]
      m_ready_d_2 <= 1'h0; // @[AxiStreamBroadcast.scala 12:26]
    end else if (s_axis_tready) begin // @[AxiStreamBroadcast.scala 14:24]
      m_ready_d_2 <= 1'h0;
    end else begin
      m_ready_d_2 <= m_ready_d_2 | m02_axis_tvalid & m02_axis_tready;
    end
    if (reset) begin // @[AxiStreamBroadcast.scala 12:26]
      m_ready_d_3 <= 1'h0; // @[AxiStreamBroadcast.scala 12:26]
    end else if (s_axis_tready) begin // @[AxiStreamBroadcast.scala 14:24]
      m_ready_d_3 <= 1'h0;
    end else begin
      m_ready_d_3 <= m_ready_d_3 | m03_axis_tvalid & m03_axis_tready;
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
  m_ready_d_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  m_ready_d_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  m_ready_d_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  m_ready_d_3 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

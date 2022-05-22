module AxisAddOne(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXIS:S_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  input  [31:0] s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
  input  [3:0]  s_axis_tkeep,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input         s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output        s_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *)
  output [3:0]  m_axis_tkeep,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready
);
  wire [7:0] data8x4_0 = s_axis_tdata[7:0] + 8'h1; // @[AxisAddOne.scala 12:48]
  wire [7:0] data8x4_1 = s_axis_tdata[15:8] + 8'h1; // @[AxisAddOne.scala 12:48]
  wire [7:0] data8x4_2 = s_axis_tdata[23:16] + 8'h1; // @[AxisAddOne.scala 12:48]
  wire [7:0] data8x4_3 = s_axis_tdata[31:24] + 8'h1; // @[AxisAddOne.scala 12:48]
  wire [15:0] m_axis_tdata_lo = {data8x4_1,data8x4_0}; // @[AxisAddOne.scala 15:27]
  wire [15:0] m_axis_tdata_hi = {data8x4_3,data8x4_2}; // @[AxisAddOne.scala 15:27]
  assign s_axis_tready = m_axis_tready; // @[AxisAddOne.scala 18:17]
  assign m_axis_tdata = {m_axis_tdata_hi,m_axis_tdata_lo}; // @[AxisAddOne.scala 15:27]
  assign m_axis_tkeep = s_axis_tkeep; // @[AxisAddOne.scala 16:16]
  assign m_axis_tvalid = s_axis_tvalid; // @[AxisAddOne.scala 17:17]
endmodule

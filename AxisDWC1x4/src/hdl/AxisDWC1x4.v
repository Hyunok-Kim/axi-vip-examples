module AxisDWC1x4(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXIS:S_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  input  [7:0]  s_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input         s_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output        s_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
  input         s_axis_tkeep,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
  input         s_axis_tlast,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "CLK_DOMAIN clock" *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *)
  output [3:0]  m_axis_tkeep,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
  output        m_axis_tlast
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
  reg [7:0] data_0; // @[AxisDWC1x4.scala 10:21]
  reg [7:0] data_1; // @[AxisDWC1x4.scala 10:21]
  reg [7:0] data_2; // @[AxisDWC1x4.scala 10:21]
  reg [7:0] data_3; // @[AxisDWC1x4.scala 10:21]
  reg  keep_0; // @[AxisDWC1x4.scala 11:21]
  reg  keep_1; // @[AxisDWC1x4.scala 11:21]
  reg  keep_2; // @[AxisDWC1x4.scala 11:21]
  reg  keep_3; // @[AxisDWC1x4.scala 11:21]
  reg [1:0] cnt; // @[AxisDWC1x4.scala 12:20]
  wire  xfer = s_axis_tready & s_axis_tvalid; // @[AxisDWC1x4.scala 20:28]
  wire [1:0] _cnt_T_1 = cnt + 2'h1; // @[AxisDWC1x4.scala 23:16]
  wire [7:0] _GEN_0 = 2'h0 == cnt ? s_axis_tdata : data_0; // @[AxisDWC1x4.scala 24:{15,15} 10:21]
  wire [7:0] _GEN_1 = 2'h1 == cnt ? s_axis_tdata : data_1; // @[AxisDWC1x4.scala 24:{15,15} 10:21]
  wire [7:0] _GEN_2 = 2'h2 == cnt ? s_axis_tdata : data_2; // @[AxisDWC1x4.scala 24:{15,15} 10:21]
  wire [7:0] _GEN_3 = 2'h3 == cnt ? s_axis_tdata : data_3; // @[AxisDWC1x4.scala 24:{15,15} 10:21]
  wire  _GEN_4 = 2'h0 == cnt ? s_axis_tkeep : keep_0; // @[AxisDWC1x4.scala 25:{15,15} 11:21]
  wire  _GEN_5 = 2'h1 == cnt ? s_axis_tkeep : keep_1; // @[AxisDWC1x4.scala 25:{15,15} 11:21]
  wire  _GEN_6 = 2'h2 == cnt ? s_axis_tkeep : keep_2; // @[AxisDWC1x4.scala 25:{15,15} 11:21]
  wire  _GEN_7 = 2'h3 == cnt ? s_axis_tkeep : keep_3; // @[AxisDWC1x4.scala 25:{15,15} 11:21]
  wire [31:0] _m_axis_tdata_T = {data_3,data_2,data_1,data_0}; // @[AxisDWC1x4.scala 29:41]
  wire [15:0] _m_axis_tdata_T_2 = {s_axis_tdata,_m_axis_tdata_T[7:0]}; // @[AxisDWC1x4.scala 29:33]
  wire [23:0] _m_axis_tdata_T_5 = {s_axis_tdata,_m_axis_tdata_T[15:0]}; // @[AxisDWC1x4.scala 29:33]
  wire [31:0] _m_axis_tdata_T_8 = {s_axis_tdata,_m_axis_tdata_T[23:0]}; // @[AxisDWC1x4.scala 29:33]
  wire [15:0] _m_axis_tdata_T_10 = 2'h1 == cnt ? _m_axis_tdata_T_2 : {{8'd0}, s_axis_tdata}; // @[Mux.scala 81:58]
  wire [23:0] _m_axis_tdata_T_12 = 2'h2 == cnt ? _m_axis_tdata_T_5 : {{8'd0}, _m_axis_tdata_T_10}; // @[Mux.scala 81:58]
  wire [31:0] _m_axis_tdata_T_14 = 2'h3 == cnt ? _m_axis_tdata_T_8 : {{8'd0}, _m_axis_tdata_T_12}; // @[Mux.scala 81:58]
  wire [3:0] _m_axis_tkeep_T = {keep_3,keep_2,keep_1,keep_0}; // @[AxisDWC1x4.scala 34:41]
  wire [1:0] _m_axis_tkeep_T_2 = {s_axis_tkeep,_m_axis_tkeep_T[0]}; // @[AxisDWC1x4.scala 34:33]
  wire [2:0] _m_axis_tkeep_T_5 = {s_axis_tkeep,_m_axis_tkeep_T[1:0]}; // @[AxisDWC1x4.scala 34:33]
  wire [3:0] _m_axis_tkeep_T_8 = {s_axis_tkeep,_m_axis_tkeep_T[2:0]}; // @[AxisDWC1x4.scala 34:33]
  wire [1:0] _m_axis_tkeep_T_10 = 2'h1 == cnt ? _m_axis_tkeep_T_2 : {{1'd0}, s_axis_tkeep}; // @[Mux.scala 81:58]
  wire [2:0] _m_axis_tkeep_T_12 = 2'h2 == cnt ? _m_axis_tkeep_T_5 : {{1'd0}, _m_axis_tkeep_T_10}; // @[Mux.scala 81:58]
  wire [3:0] _m_axis_tkeep_T_14 = 2'h3 == cnt ? _m_axis_tkeep_T_8 : {{1'd0}, _m_axis_tkeep_T_12}; // @[Mux.scala 81:58]
  wire  _T_2 = cnt == 2'h3; // @[AxisDWC1x4.scala 43:21]
  wire [31:0] _GEN_8 = cnt == 2'h3 ? _m_axis_tdata_T_8 : 32'h0; // @[AxisDWC1x4.scala 15:16 43:30 44:20]
  wire [3:0] _GEN_9 = cnt == 2'h3 ? _m_axis_tkeep_T_8 : 4'h0; // @[AxisDWC1x4.scala 16:16 43:30 45:20]
  wire [31:0] _GEN_20 = s_axis_tlast ? _m_axis_tdata_T_14 : _GEN_8; // @[AxisDWC1x4.scala 26:25 27:20]
  wire [3:0] _GEN_21 = s_axis_tlast ? _m_axis_tkeep_T_14 : _GEN_9; // @[AxisDWC1x4.scala 26:25 32:20]
  wire  _GEN_23 = s_axis_tlast | _T_2; // @[AxisDWC1x4.scala 26:25 38:21]
  assign s_axis_tready = m_axis_tready; // @[AxisDWC1x4.scala 14:17]
  assign m_axis_tdata = xfer & s_axis_tkeep ? _GEN_20 : 32'h0; // @[AxisDWC1x4.scala 15:16 22:37]
  assign m_axis_tvalid = xfer & s_axis_tkeep & _GEN_23; // @[AxisDWC1x4.scala 18:17 22:37]
  assign m_axis_tkeep = xfer & s_axis_tkeep ? _GEN_21 : 4'h0; // @[AxisDWC1x4.scala 16:16 22:37]
  assign m_axis_tlast = xfer & s_axis_tkeep & s_axis_tlast; // @[AxisDWC1x4.scala 17:16 22:37]
  always @(posedge clock) begin
    if (reset) begin // @[AxisDWC1x4.scala 10:21]
      data_0 <= 8'h0; // @[AxisDWC1x4.scala 10:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        data_0 <= 8'h0; // @[AxisDWC1x4.scala 41:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        data_0 <= 8'h0; // @[AxisDWC1x4.scala 48:12]
      end else begin
        data_0 <= _GEN_0;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 10:21]
      data_1 <= 8'h0; // @[AxisDWC1x4.scala 10:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        data_1 <= 8'h0; // @[AxisDWC1x4.scala 41:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        data_1 <= 8'h0; // @[AxisDWC1x4.scala 48:12]
      end else begin
        data_1 <= _GEN_1;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 10:21]
      data_2 <= 8'h0; // @[AxisDWC1x4.scala 10:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        data_2 <= 8'h0; // @[AxisDWC1x4.scala 41:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        data_2 <= 8'h0; // @[AxisDWC1x4.scala 48:12]
      end else begin
        data_2 <= _GEN_2;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 10:21]
      data_3 <= 8'h0; // @[AxisDWC1x4.scala 10:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        data_3 <= 8'h0; // @[AxisDWC1x4.scala 41:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        data_3 <= 8'h0; // @[AxisDWC1x4.scala 48:12]
      end else begin
        data_3 <= _GEN_3;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 11:21]
      keep_0 <= 1'h0; // @[AxisDWC1x4.scala 11:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        keep_0 <= 1'h0; // @[AxisDWC1x4.scala 42:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        keep_0 <= 1'h0; // @[AxisDWC1x4.scala 49:12]
      end else begin
        keep_0 <= _GEN_4;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 11:21]
      keep_1 <= 1'h0; // @[AxisDWC1x4.scala 11:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        keep_1 <= 1'h0; // @[AxisDWC1x4.scala 42:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        keep_1 <= 1'h0; // @[AxisDWC1x4.scala 49:12]
      end else begin
        keep_1 <= _GEN_5;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 11:21]
      keep_2 <= 1'h0; // @[AxisDWC1x4.scala 11:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        keep_2 <= 1'h0; // @[AxisDWC1x4.scala 42:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        keep_2 <= 1'h0; // @[AxisDWC1x4.scala 49:12]
      end else begin
        keep_2 <= _GEN_6;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 11:21]
      keep_3 <= 1'h0; // @[AxisDWC1x4.scala 11:21]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        keep_3 <= 1'h0; // @[AxisDWC1x4.scala 42:12]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        keep_3 <= 1'h0; // @[AxisDWC1x4.scala 49:12]
      end else begin
        keep_3 <= _GEN_7;
      end
    end
    if (reset) begin // @[AxisDWC1x4.scala 12:20]
      cnt <= 2'h0; // @[AxisDWC1x4.scala 12:20]
    end else if (xfer & s_axis_tkeep) begin // @[AxisDWC1x4.scala 22:37]
      if (s_axis_tlast) begin // @[AxisDWC1x4.scala 26:25]
        cnt <= 2'h0; // @[AxisDWC1x4.scala 40:11]
      end else if (cnt == 2'h3) begin // @[AxisDWC1x4.scala 43:30]
        cnt <= 2'h0; // @[AxisDWC1x4.scala 47:11]
      end else begin
        cnt <= _cnt_T_1; // @[AxisDWC1x4.scala 23:9]
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
  data_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  data_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  data_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  data_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  keep_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  keep_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  keep_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  keep_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cnt = _RAND_8[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

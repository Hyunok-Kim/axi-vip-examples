module PacketPriorityArbiter(
  input        clock,
  input        reset,
  input  [3:0] req,
  input  [3:0] fin,
  output [3:0] grant,
  input        ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  pending_0; // @[PacketPriorityArbiter.scala 10:24]
  reg  pending_1; // @[PacketPriorityArbiter.scala 10:24]
  reg  pending_2; // @[PacketPriorityArbiter.scala 10:24]
  reg  pending_3; // @[PacketPriorityArbiter.scala 10:24]
  reg  state; // @[PacketPriorityArbiter.scala 13:22]
  reg [3:0] granted; // @[PacketPriorityArbiter.scala 14:24]
  wire [3:0] _T_1 = {pending_3,pending_2,pending_1,pending_0}; // @[PacketPriorityArbiter.scala 22:21]
  wire [3:0] _GEN_0 = _T_1 != 4'h0 ? _T_1 : req; // @[PacketPriorityArbiter.scala 22:37 23:19 25:19]
  wire [3:0] valid_req = ~state ? _GEN_0 : 4'h0; // @[PacketPriorityArbiter.scala 17:13 20:18]
  wire [3:0] granted_tmp = valid_req & 4'h8; // @[PacketPriorityArbiter.scala 29:37]
  wire  _GEN_1 = granted_tmp != 4'h0 & granted_tmp[0]; // @[PacketPriorityArbiter.scala 19:16 30:36 31:48]
  wire  _GEN_2 = granted_tmp != 4'h0 & granted_tmp[1]; // @[PacketPriorityArbiter.scala 19:16 30:36 31:48]
  wire  _GEN_3 = granted_tmp != 4'h0 & granted_tmp[2]; // @[PacketPriorityArbiter.scala 19:16 30:36 31:48]
  wire  _GEN_4 = granted_tmp != 4'h0 & granted_tmp[3]; // @[PacketPriorityArbiter.scala 19:16 30:36 31:48]
  wire [3:0] granted_tmp_1 = valid_req & 4'h4; // @[PacketPriorityArbiter.scala 29:37]
  wire  _GEN_5 = granted_tmp_1 != 4'h0 ? granted_tmp_1[0] : _GEN_1; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_6 = granted_tmp_1 != 4'h0 ? granted_tmp_1[1] : _GEN_2; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_7 = granted_tmp_1 != 4'h0 ? granted_tmp_1[2] : _GEN_3; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_8 = granted_tmp_1 != 4'h0 ? granted_tmp_1[3] : _GEN_4; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire [3:0] granted_tmp_2 = valid_req & 4'h2; // @[PacketPriorityArbiter.scala 29:37]
  wire  _GEN_9 = granted_tmp_2 != 4'h0 ? granted_tmp_2[0] : _GEN_5; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_10 = granted_tmp_2 != 4'h0 ? granted_tmp_2[1] : _GEN_6; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_11 = granted_tmp_2 != 4'h0 ? granted_tmp_2[2] : _GEN_7; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_12 = granted_tmp_2 != 4'h0 ? granted_tmp_2[3] : _GEN_8; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire [3:0] granted_tmp_3 = valid_req & 4'h1; // @[PacketPriorityArbiter.scala 29:37]
  wire  _GEN_13 = granted_tmp_3 != 4'h0 ? granted_tmp_3[0] : _GEN_9; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_14 = granted_tmp_3 != 4'h0 ? granted_tmp_3[1] : _GEN_10; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_15 = granted_tmp_3 != 4'h0 ? granted_tmp_3[2] : _GEN_11; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  _GEN_16 = granted_tmp_3 != 4'h0 ? granted_tmp_3[3] : _GEN_12; // @[PacketPriorityArbiter.scala 30:36 31:48]
  wire  next_granted_0 = ~state & _GEN_13; // @[PacketPriorityArbiter.scala 19:16 20:18]
  wire  _grant_T = ready & next_granted_0; // @[PacketPriorityArbiter.scala 34:47]
  wire  next_granted_1 = ~state & _GEN_14; // @[PacketPriorityArbiter.scala 19:16 20:18]
  wire  _grant_T_1 = ready & next_granted_1; // @[PacketPriorityArbiter.scala 34:47]
  wire  next_granted_2 = ~state & _GEN_15; // @[PacketPriorityArbiter.scala 19:16 20:18]
  wire  _grant_T_2 = ready & next_granted_2; // @[PacketPriorityArbiter.scala 34:47]
  wire  next_granted_3 = ~state & _GEN_16; // @[PacketPriorityArbiter.scala 19:16 20:18]
  wire  _grant_T_3 = ready & next_granted_3; // @[PacketPriorityArbiter.scala 34:47]
  wire [3:0] _grant_T_4 = {_grant_T_3,_grant_T_2,_grant_T_1,_grant_T}; // @[PacketPriorityArbiter.scala 34:66]
  wire [3:0] _granted_T = {next_granted_3,next_granted_2,next_granted_1,next_granted_0}; // @[PacketPriorityArbiter.scala 35:31]
  wire [3:0] _T_9 = fin & grant; // @[PacketPriorityArbiter.scala 38:20]
  wire  _GEN_17 = _T_9 == 4'h0 | state; // @[PacketPriorityArbiter.scala 38:38 39:17 13:22]
  wire  _grant_T_6 = granted[0] & ready; // @[PacketPriorityArbiter.scala 47:52]
  wire  _grant_T_8 = granted[1] & ready; // @[PacketPriorityArbiter.scala 47:52]
  wire  _grant_T_10 = granted[2] & ready; // @[PacketPriorityArbiter.scala 47:52]
  wire  _grant_T_12 = granted[3] & ready; // @[PacketPriorityArbiter.scala 47:52]
  wire [3:0] _grant_T_13 = {_grant_T_12,_grant_T_10,_grant_T_8,_grant_T_6}; // @[PacketPriorityArbiter.scala 47:61]
  wire [3:0] _GEN_29 = state ? _grant_T_13 : 4'h0; // @[PacketPriorityArbiter.scala 20:18 47:13 18:9]
  assign grant = ~state ? _grant_T_4 : _GEN_29; // @[PacketPriorityArbiter.scala 20:18 34:13]
  always @(posedge clock) begin
    if (reset) begin // @[PacketPriorityArbiter.scala 10:24]
      pending_0 <= 1'h0; // @[PacketPriorityArbiter.scala 10:24]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_granted_T != 4'h0) begin // @[PacketPriorityArbiter.scala 37:42]
        if (_T_9 == 4'h0) begin // @[PacketPriorityArbiter.scala 38:38]
          pending_0 <= 1'h0; // @[PacketPriorityArbiter.scala 40:43]
        end else begin
          pending_0 <= valid_req[0] ^ fin[0]; // @[PacketPriorityArbiter.scala 42:43]
        end
      end
    end
    if (reset) begin // @[PacketPriorityArbiter.scala 10:24]
      pending_1 <= 1'h0; // @[PacketPriorityArbiter.scala 10:24]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_granted_T != 4'h0) begin // @[PacketPriorityArbiter.scala 37:42]
        if (_T_9 == 4'h0) begin // @[PacketPriorityArbiter.scala 38:38]
          pending_1 <= 1'h0; // @[PacketPriorityArbiter.scala 40:43]
        end else begin
          pending_1 <= valid_req[1] ^ fin[1]; // @[PacketPriorityArbiter.scala 42:43]
        end
      end
    end
    if (reset) begin // @[PacketPriorityArbiter.scala 10:24]
      pending_2 <= 1'h0; // @[PacketPriorityArbiter.scala 10:24]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_granted_T != 4'h0) begin // @[PacketPriorityArbiter.scala 37:42]
        if (_T_9 == 4'h0) begin // @[PacketPriorityArbiter.scala 38:38]
          pending_2 <= 1'h0; // @[PacketPriorityArbiter.scala 40:43]
        end else begin
          pending_2 <= valid_req[2] ^ fin[2]; // @[PacketPriorityArbiter.scala 42:43]
        end
      end
    end
    if (reset) begin // @[PacketPriorityArbiter.scala 10:24]
      pending_3 <= 1'h0; // @[PacketPriorityArbiter.scala 10:24]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_granted_T != 4'h0) begin // @[PacketPriorityArbiter.scala 37:42]
        if (_T_9 == 4'h0) begin // @[PacketPriorityArbiter.scala 38:38]
          pending_3 <= 1'h0; // @[PacketPriorityArbiter.scala 40:43]
        end else begin
          pending_3 <= valid_req[3] ^ fin[3]; // @[PacketPriorityArbiter.scala 42:43]
        end
      end
    end
    if (reset) begin // @[PacketPriorityArbiter.scala 13:22]
      state <= 1'h0; // @[PacketPriorityArbiter.scala 13:22]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_granted_T != 4'h0) begin // @[PacketPriorityArbiter.scala 37:42]
        state <= _GEN_17;
      end
    end else if (state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_T_9 != 4'h0) begin // @[PacketPriorityArbiter.scala 48:37]
        state <= 1'h0; // @[PacketPriorityArbiter.scala 50:16]
      end
    end
    if (reset) begin // @[PacketPriorityArbiter.scala 14:24]
      granted <= 4'h0; // @[PacketPriorityArbiter.scala 14:24]
    end else if (~state) begin // @[PacketPriorityArbiter.scala 20:18]
      granted <= _granted_T; // @[PacketPriorityArbiter.scala 35:15]
    end else if (state) begin // @[PacketPriorityArbiter.scala 20:18]
      if (_T_9 != 4'h0) begin // @[PacketPriorityArbiter.scala 48:37]
        granted <= 4'h0; // @[PacketPriorityArbiter.scala 49:18]
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
  pending_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pending_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pending_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pending_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  granted = _RAND_5[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AxisPriorityArbiter(

  (*
    X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK", X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S00_AXIS:S01_AXIS:S02_AXIS:S03_AXIS:M_AXIS"
     *)
  input         clock,

  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST", X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input         reset,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s00_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *)
  input         s00_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *)
  output        s00_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *)
  input         s00_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s01_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TVALID" *)
  input         s01_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TREADY" *)
  output        s01_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S01_AXIS TLAST" *)
  input         s01_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S02_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S02_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s02_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S02_AXIS TVALID" *)
  input         s02_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S02_AXIS TREADY" *)
  output        s02_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S02_AXIS TLAST" *)
  input         s02_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S03_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S03_AXIS, CLK_DOMAIN clock"
     *)
  input  [31:0] s03_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S03_AXIS TVALID" *)
  input         s03_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S03_AXIS TREADY" *)
  output        s03_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S03_AXIS TLAST" *)
  input         s03_axis_tlast,

  (*
    X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA", X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN clock"
     *)
  output [31:0] m_axis_tdata,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output        m_axis_tvalid,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input         m_axis_tready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
  output        m_axis_tlast
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  rr_arbiter_clock; // @[AxisPriorityArbiter.scala 29:26]
  wire  rr_arbiter_reset; // @[AxisPriorityArbiter.scala 29:26]
  wire [3:0] rr_arbiter_req; // @[AxisPriorityArbiter.scala 29:26]
  wire [3:0] rr_arbiter_fin; // @[AxisPriorityArbiter.scala 29:26]
  wire [3:0] rr_arbiter_grant; // @[AxisPriorityArbiter.scala 29:26]
  wire  rr_arbiter_ready; // @[AxisPriorityArbiter.scala 29:26]
  reg  processing_0; // @[AxisPriorityArbiter.scala 11:27]
  reg  processing_1; // @[AxisPriorityArbiter.scala 11:27]
  reg  processing_2; // @[AxisPriorityArbiter.scala 11:27]
  reg  processing_3; // @[AxisPriorityArbiter.scala 11:27]
  wire  arb_req_0 = s00_axis_tvalid | processing_0; // @[AxisPriorityArbiter.scala 23:36]
  wire  arb_fin_0 = s00_axis_tvalid & s00_axis_tlast & s00_axis_tready; // @[AxisPriorityArbiter.scala 24:54]
  wire  arb_req_1 = s01_axis_tvalid | processing_1; // @[AxisPriorityArbiter.scala 23:36]
  wire  arb_fin_1 = s01_axis_tvalid & s01_axis_tlast & s01_axis_tready; // @[AxisPriorityArbiter.scala 24:54]
  wire  arb_req_2 = s02_axis_tvalid | processing_2; // @[AxisPriorityArbiter.scala 23:36]
  wire  arb_fin_2 = s02_axis_tvalid & s02_axis_tlast & s02_axis_tready; // @[AxisPriorityArbiter.scala 24:54]
  wire  arb_req_3 = s03_axis_tvalid | processing_3; // @[AxisPriorityArbiter.scala 23:36]
  wire  arb_fin_3 = s03_axis_tvalid & s03_axis_tlast & s03_axis_tready; // @[AxisPriorityArbiter.scala 24:54]
  wire [1:0] rr_arbiter_req_lo = {arb_req_1,arb_req_0}; // @[AxisPriorityArbiter.scala 30:29]
  wire [1:0] rr_arbiter_req_hi = {arb_req_3,arb_req_2}; // @[AxisPriorityArbiter.scala 30:29]
  wire [1:0] rr_arbiter_fin_lo = {arb_fin_1,arb_fin_0}; // @[AxisPriorityArbiter.scala 31:29]
  wire [1:0] rr_arbiter_fin_hi = {arb_fin_3,arb_fin_2}; // @[AxisPriorityArbiter.scala 31:29]
  wire  arb_grant_0 = rr_arbiter_grant[0]; // @[AxisPriorityArbiter.scala 33:56]
  wire  arb_grant_1 = rr_arbiter_grant[1]; // @[AxisPriorityArbiter.scala 33:56]
  wire  arb_grant_2 = rr_arbiter_grant[2]; // @[AxisPriorityArbiter.scala 33:56]
  wire  arb_grant_3 = rr_arbiter_grant[3]; // @[AxisPriorityArbiter.scala 33:56]
  wire [31:0] _GEN_8 = arb_grant_3 ? s03_axis_tdata : 32'h0; // @[AxisPriorityArbiter.scala 35:16 39:25 40:20]
  wire  _GEN_9 = arb_grant_3 & s03_axis_tvalid; // @[AxisPriorityArbiter.scala 36:17 39:25 41:21]
  wire  _GEN_10 = arb_grant_3 & s03_axis_tlast; // @[AxisPriorityArbiter.scala 37:16 39:25 42:20]
  wire [31:0] _GEN_11 = arb_grant_2 ? s02_axis_tdata : _GEN_8; // @[AxisPriorityArbiter.scala 39:25 40:20]
  wire  _GEN_12 = arb_grant_2 ? s02_axis_tvalid : _GEN_9; // @[AxisPriorityArbiter.scala 39:25 41:21]
  wire  _GEN_13 = arb_grant_2 ? s02_axis_tlast : _GEN_10; // @[AxisPriorityArbiter.scala 39:25 42:20]
  wire [31:0] _GEN_14 = arb_grant_1 ? s01_axis_tdata : _GEN_11; // @[AxisPriorityArbiter.scala 39:25 40:20]
  wire  _GEN_15 = arb_grant_1 ? s01_axis_tvalid : _GEN_12; // @[AxisPriorityArbiter.scala 39:25 41:21]
  wire  _GEN_16 = arb_grant_1 ? s01_axis_tlast : _GEN_13; // @[AxisPriorityArbiter.scala 39:25 42:20]
  PacketPriorityArbiter rr_arbiter ( // @[AxisPriorityArbiter.scala 29:26]
    .clock(rr_arbiter_clock),
    .reset(rr_arbiter_reset),
    .req(rr_arbiter_req),
    .fin(rr_arbiter_fin),
    .grant(rr_arbiter_grant),
    .ready(rr_arbiter_ready)
  );
  assign s00_axis_tready = rr_arbiter_grant[0]; // @[AxisPriorityArbiter.scala 33:56]
  assign s01_axis_tready = rr_arbiter_grant[1]; // @[AxisPriorityArbiter.scala 33:56]
  assign s02_axis_tready = rr_arbiter_grant[2]; // @[AxisPriorityArbiter.scala 33:56]
  assign s03_axis_tready = rr_arbiter_grant[3]; // @[AxisPriorityArbiter.scala 33:56]
  assign m_axis_tdata = arb_grant_0 ? s00_axis_tdata : _GEN_14; // @[AxisPriorityArbiter.scala 39:25 40:20]
  assign m_axis_tvalid = arb_grant_0 ? s00_axis_tvalid : _GEN_15; // @[AxisPriorityArbiter.scala 39:25 41:21]
  assign m_axis_tlast = arb_grant_0 ? s00_axis_tlast : _GEN_16; // @[AxisPriorityArbiter.scala 39:25 42:20]
  assign rr_arbiter_clock = clock;
  assign rr_arbiter_reset = reset;
  assign rr_arbiter_req = {rr_arbiter_req_hi,rr_arbiter_req_lo}; // @[AxisPriorityArbiter.scala 30:29]
  assign rr_arbiter_fin = {rr_arbiter_fin_hi,rr_arbiter_fin_lo}; // @[AxisPriorityArbiter.scala 31:29]
  assign rr_arbiter_ready = m_axis_tready; // @[AxisPriorityArbiter.scala 15:23 27:13]
  always @(posedge clock) begin
    if (reset) begin // @[AxisPriorityArbiter.scala 11:27]
      processing_0 <= 1'h0; // @[AxisPriorityArbiter.scala 11:27]
    end else if (~processing_0 & s00_axis_tvalid) begin // @[AxisPriorityArbiter.scala 18:46]
      processing_0 <= ~(s00_axis_tlast & s00_axis_tready); // @[AxisPriorityArbiter.scala 19:21]
    end else if (processing_0 & s00_axis_tvalid & s00_axis_tlast & s00_axis_tready) begin // @[AxisPriorityArbiter.scala 20:89]
      processing_0 <= 1'h0; // @[AxisPriorityArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisPriorityArbiter.scala 11:27]
      processing_1 <= 1'h0; // @[AxisPriorityArbiter.scala 11:27]
    end else if (~processing_1 & s01_axis_tvalid) begin // @[AxisPriorityArbiter.scala 18:46]
      processing_1 <= ~(s01_axis_tlast & s01_axis_tready); // @[AxisPriorityArbiter.scala 19:21]
    end else if (processing_1 & s01_axis_tvalid & s01_axis_tlast & s01_axis_tready) begin // @[AxisPriorityArbiter.scala 20:89]
      processing_1 <= 1'h0; // @[AxisPriorityArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisPriorityArbiter.scala 11:27]
      processing_2 <= 1'h0; // @[AxisPriorityArbiter.scala 11:27]
    end else if (~processing_2 & s02_axis_tvalid) begin // @[AxisPriorityArbiter.scala 18:46]
      processing_2 <= ~(s02_axis_tlast & s02_axis_tready); // @[AxisPriorityArbiter.scala 19:21]
    end else if (processing_2 & s02_axis_tvalid & s02_axis_tlast & s02_axis_tready) begin // @[AxisPriorityArbiter.scala 20:89]
      processing_2 <= 1'h0; // @[AxisPriorityArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisPriorityArbiter.scala 11:27]
      processing_3 <= 1'h0; // @[AxisPriorityArbiter.scala 11:27]
    end else if (~processing_3 & s03_axis_tvalid) begin // @[AxisPriorityArbiter.scala 18:46]
      processing_3 <= ~(s03_axis_tlast & s03_axis_tready); // @[AxisPriorityArbiter.scala 19:21]
    end else if (processing_3 & s03_axis_tvalid & s03_axis_tlast & s03_axis_tready) begin // @[AxisPriorityArbiter.scala 20:89]
      processing_3 <= 1'h0; // @[AxisPriorityArbiter.scala 21:21]
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
  processing_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  processing_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  processing_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  processing_3 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

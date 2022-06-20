module PacketRRArbiter(
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
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] q_mem_0; // @[PacketRRArbiter.scala 35:22]
  reg [3:0] q_mem_1; // @[PacketRRArbiter.scala 35:22]
  reg [3:0] q_mem_2; // @[PacketRRArbiter.scala 35:22]
  reg [3:0] q_mem_3; // @[PacketRRArbiter.scala 35:22]
  reg [1:0] q_wptr; // @[PacketRRArbiter.scala 36:23]
  reg [1:0] q_rptr; // @[PacketRRArbiter.scala 37:23]
  reg [2:0] q_cnt; // @[PacketRRArbiter.scala 38:22]
  reg  pending_0; // @[PacketRRArbiter.scala 40:24]
  reg  pending_1; // @[PacketRRArbiter.scala 40:24]
  reg  pending_2; // @[PacketRRArbiter.scala 40:24]
  reg  pending_3; // @[PacketRRArbiter.scala 40:24]
  reg  queued_0; // @[PacketRRArbiter.scala 41:23]
  reg  queued_1; // @[PacketRRArbiter.scala 41:23]
  reg  queued_2; // @[PacketRRArbiter.scala 41:23]
  reg  queued_3; // @[PacketRRArbiter.scala 41:23]
  reg  state; // @[PacketRRArbiter.scala 44:22]
  reg [3:0] granted; // @[PacketRRArbiter.scala 45:24]
  reg [3:0] prio_0; // @[PacketRRArbiter.scala 47:21]
  reg [3:0] prio_1; // @[PacketRRArbiter.scala 47:21]
  reg [3:0] prio_2; // @[PacketRRArbiter.scala 47:21]
  reg [3:0] prio_3; // @[PacketRRArbiter.scala 47:21]
  wire  q_empty = q_cnt == 3'h0; // @[PacketRRArbiter.scala 49:23]
  wire  q_full = q_cnt == 3'h4; // @[PacketRRArbiter.scala 50:22]
  wire  _T_5 = ~queued_0; // @[PacketRRArbiter.scala 58:20]
  wire  _GEN_0 = ~queued_0 & req[0] | queued_0; // @[PacketRRArbiter.scala 58:41 59:19 41:23]
  wire  _T_13 = ~queued_1; // @[PacketRRArbiter.scala 58:20]
  wire  _GEN_2 = ~queued_1 & req[1] | queued_1; // @[PacketRRArbiter.scala 58:41 59:19 41:23]
  wire  _T_21 = ~queued_2; // @[PacketRRArbiter.scala 58:20]
  wire  _GEN_4 = ~queued_2 & req[2] | queued_2; // @[PacketRRArbiter.scala 58:41 59:19 41:23]
  wire  _T_29 = ~queued_3; // @[PacketRRArbiter.scala 58:20]
  wire  _GEN_6 = ~queued_3 & req[3] | queued_3; // @[PacketRRArbiter.scala 58:41 59:19 41:23]
  wire  _q_din_T_2 = req[0] & _T_5; // @[PacketRRArbiter.scala 67:47]
  wire  _q_din_T_5 = req[1] & _T_13; // @[PacketRRArbiter.scala 67:47]
  wire  _q_din_T_8 = req[2] & _T_21; // @[PacketRRArbiter.scala 67:47]
  wire  _q_din_T_11 = req[3] & _T_29; // @[PacketRRArbiter.scala 67:47]
  wire [3:0] q_din = {_q_din_T_11,_q_din_T_8,_q_din_T_5,_q_din_T_2}; // @[PacketRRArbiter.scala 67:61]
  wire  _q_wr_en_T_1 = ~q_empty; // @[PacketRRArbiter.scala 68:37]
  wire [3:0] _q_wr_en_T_2 = {pending_3,pending_2,pending_1,pending_0}; // @[PacketRRArbiter.scala 68:58]
  wire  _q_wr_en_T_3 = _q_wr_en_T_2 != 4'h0; // @[PacketRRArbiter.scala 68:65]
  wire  q_wr_en = q_din != 4'h0 & (~q_empty | _q_wr_en_T_2 != 4'h0); // @[PacketRRArbiter.scala 68:33]
  wire  _GEN_44 = q_empty ? 1'h0 : 1'h1; // @[PacketRRArbiter.scala 112:11 121:29 127:17]
  wire  _GEN_46 = _q_wr_en_T_3 ? 1'h0 : _GEN_44; // @[PacketRRArbiter.scala 112:11 118:37]
  wire  q_rd_en = ~state & _GEN_46; // @[PacketRRArbiter.scala 112:11 116:18]
  wire [1:0] _q_wptr_T_1 = q_wptr + 2'h1; // @[PacketRRArbiter.scala 71:22]
  wire [2:0] _q_cnt_T_1 = q_cnt + 3'h1; // @[PacketRRArbiter.scala 72:20]
  wire [3:0] _GEN_8 = 2'h0 == q_wptr ? q_din : q_mem_0; // @[PacketRRArbiter.scala 73:{19,19} 35:22]
  wire [3:0] _GEN_9 = 2'h1 == q_wptr ? q_din : q_mem_1; // @[PacketRRArbiter.scala 73:{19,19} 35:22]
  wire [3:0] _GEN_10 = 2'h2 == q_wptr ? q_din : q_mem_2; // @[PacketRRArbiter.scala 73:{19,19} 35:22]
  wire [3:0] _GEN_11 = 2'h3 == q_wptr ? q_din : q_mem_3; // @[PacketRRArbiter.scala 73:{19,19} 35:22]
  wire [1:0] _q_rptr_T_1 = q_rptr + 2'h1; // @[PacketRRArbiter.scala 75:22]
  wire [2:0] _q_cnt_T_3 = q_cnt - 3'h1; // @[PacketRRArbiter.scala 76:20]
  wire [1:0] _GEN_16 = _q_wr_en_T_1 ? _q_rptr_T_1 : q_rptr; // @[PacketRRArbiter.scala 85:21 86:14 37:23]
  wire [2:0] _GEN_17 = _q_wr_en_T_1 ? q_cnt : _q_cnt_T_1; // @[PacketRRArbiter.scala 85:21 38:22 88:13]
  wire [3:0] _GEN_40 = 2'h1 == q_rptr ? q_mem_1 : q_mem_0; // @[PacketRRArbiter.scala 128:{19,19}]
  wire [3:0] _GEN_41 = 2'h2 == q_rptr ? q_mem_2 : _GEN_40; // @[PacketRRArbiter.scala 128:{19,19}]
  wire [3:0] _GEN_42 = 2'h3 == q_rptr ? q_mem_3 : _GEN_41; // @[PacketRRArbiter.scala 128:{19,19}]
  wire [3:0] _GEN_43 = q_empty ? q_din : _GEN_42; // @[PacketRRArbiter.scala 121:29 124:19 128:19]
  wire [3:0] _GEN_45 = _q_wr_en_T_3 ? _q_wr_en_T_2 : _GEN_43; // @[PacketRRArbiter.scala 118:37 120:19]
  wire [3:0] valid_req = ~state ? _GEN_45 : 4'h0; // @[PacketRRArbiter.scala 113:13 116:18]
  wire [3:0] granted_tmp = valid_req & prio_3; // @[PacketRRArbiter.scala 132:37]
  wire  _GEN_47 = granted_tmp != 4'h0 & granted_tmp[0]; // @[PacketRRArbiter.scala 115:16 133:36 134:48]
  wire  _GEN_48 = granted_tmp != 4'h0 & granted_tmp[1]; // @[PacketRRArbiter.scala 115:16 133:36 134:48]
  wire  _GEN_49 = granted_tmp != 4'h0 & granted_tmp[2]; // @[PacketRRArbiter.scala 115:16 133:36 134:48]
  wire  _GEN_50 = granted_tmp != 4'h0 & granted_tmp[3]; // @[PacketRRArbiter.scala 115:16 133:36 134:48]
  wire [3:0] granted_tmp_1 = valid_req & prio_2; // @[PacketRRArbiter.scala 132:37]
  wire  _GEN_52 = granted_tmp_1 != 4'h0 ? granted_tmp_1[0] : _GEN_47; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_53 = granted_tmp_1 != 4'h0 ? granted_tmp_1[1] : _GEN_48; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_54 = granted_tmp_1 != 4'h0 ? granted_tmp_1[2] : _GEN_49; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_55 = granted_tmp_1 != 4'h0 ? granted_tmp_1[3] : _GEN_50; // @[PacketRRArbiter.scala 133:36 134:48]
  wire [3:0] _GEN_56 = granted_tmp_1 != 4'h0 ? prio_3 : prio_2; // @[PacketRRArbiter.scala 133:36 135:39 47:21]
  wire [3:0] _GEN_57 = granted_tmp_1 != 4'h0 ? prio_2 : prio_3; // @[PacketRRArbiter.scala 133:36 136:21]
  wire [3:0] granted_tmp_2 = valid_req & prio_1; // @[PacketRRArbiter.scala 132:37]
  wire  _GEN_58 = granted_tmp_2 != 4'h0 ? granted_tmp_2[0] : _GEN_52; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_59 = granted_tmp_2 != 4'h0 ? granted_tmp_2[1] : _GEN_53; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_60 = granted_tmp_2 != 4'h0 ? granted_tmp_2[2] : _GEN_54; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_61 = granted_tmp_2 != 4'h0 ? granted_tmp_2[3] : _GEN_55; // @[PacketRRArbiter.scala 133:36 134:48]
  wire [3:0] granted_tmp_3 = valid_req & prio_0; // @[PacketRRArbiter.scala 132:37]
  wire  _GEN_65 = granted_tmp_3 != 4'h0 ? granted_tmp_3[0] : _GEN_58; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_66 = granted_tmp_3 != 4'h0 ? granted_tmp_3[1] : _GEN_59; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_67 = granted_tmp_3 != 4'h0 ? granted_tmp_3[2] : _GEN_60; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  _GEN_68 = granted_tmp_3 != 4'h0 ? granted_tmp_3[3] : _GEN_61; // @[PacketRRArbiter.scala 133:36 134:48]
  wire  next_granted_0 = ~state & _GEN_65; // @[PacketRRArbiter.scala 115:16 116:18]
  wire  _grant_T = ready & next_granted_0; // @[PacketRRArbiter.scala 139:47]
  wire  next_granted_1 = ~state & _GEN_66; // @[PacketRRArbiter.scala 115:16 116:18]
  wire  _grant_T_1 = ready & next_granted_1; // @[PacketRRArbiter.scala 139:47]
  wire  next_granted_2 = ~state & _GEN_67; // @[PacketRRArbiter.scala 115:16 116:18]
  wire  _grant_T_2 = ready & next_granted_2; // @[PacketRRArbiter.scala 139:47]
  wire  next_granted_3 = ~state & _GEN_68; // @[PacketRRArbiter.scala 115:16 116:18]
  wire  _grant_T_3 = ready & next_granted_3; // @[PacketRRArbiter.scala 139:47]
  wire [3:0] _grant_T_4 = {_grant_T_3,_grant_T_2,_grant_T_1,_grant_T}; // @[PacketRRArbiter.scala 139:66]
  wire [3:0] _granted_T = {next_granted_3,next_granted_2,next_granted_1,next_granted_0}; // @[PacketRRArbiter.scala 140:31]
  wire [3:0] _T_51 = fin & grant; // @[PacketRRArbiter.scala 147:20]
  wire  _GEN_77 = _T_51 == 4'h0 | state; // @[PacketRRArbiter.scala 147:38 149:17 44:22]
  wire  _grant_T_6 = granted[0] & ready; // @[PacketRRArbiter.scala 156:52]
  wire  _grant_T_8 = granted[1] & ready; // @[PacketRRArbiter.scala 156:52]
  wire  _grant_T_10 = granted[2] & ready; // @[PacketRRArbiter.scala 156:52]
  wire  _grant_T_12 = granted[3] & ready; // @[PacketRRArbiter.scala 156:52]
  wire [3:0] _grant_T_13 = {_grant_T_12,_grant_T_10,_grant_T_8,_grant_T_6}; // @[PacketRRArbiter.scala 156:61]
  wire [3:0] _GEN_89 = state ? _grant_T_13 : 4'h0; // @[PacketRRArbiter.scala 116:18 156:13 114:9]
  assign grant = ~state ? _grant_T_4 : _GEN_89; // @[PacketRRArbiter.scala 116:18 139:13]
  always @(posedge clock) begin
    if (reset) begin // @[PacketRRArbiter.scala 35:22]
      q_mem_0 <= 4'h0; // @[PacketRRArbiter.scala 35:22]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_mem_0 <= _GEN_8;
    end else if (!(q_rd_en & ~q_wr_en & _q_wr_en_T_1)) begin // @[PacketRRArbiter.scala 74:47]
      if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_mem_0 <= _GEN_8;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 35:22]
      q_mem_1 <= 4'h0; // @[PacketRRArbiter.scala 35:22]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_mem_1 <= _GEN_9;
    end else if (!(q_rd_en & ~q_wr_en & _q_wr_en_T_1)) begin // @[PacketRRArbiter.scala 74:47]
      if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_mem_1 <= _GEN_9;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 35:22]
      q_mem_2 <= 4'h0; // @[PacketRRArbiter.scala 35:22]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_mem_2 <= _GEN_10;
    end else if (!(q_rd_en & ~q_wr_en & _q_wr_en_T_1)) begin // @[PacketRRArbiter.scala 74:47]
      if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_mem_2 <= _GEN_10;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 35:22]
      q_mem_3 <= 4'h0; // @[PacketRRArbiter.scala 35:22]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_mem_3 <= _GEN_11;
    end else if (!(q_rd_en & ~q_wr_en & _q_wr_en_T_1)) begin // @[PacketRRArbiter.scala 74:47]
      if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_mem_3 <= _GEN_11;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 36:23]
      q_wptr <= 2'h0; // @[PacketRRArbiter.scala 36:23]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_wptr <= _q_wptr_T_1; // @[PacketRRArbiter.scala 71:12]
    end else if (!(q_rd_en & ~q_wr_en & _q_wr_en_T_1)) begin // @[PacketRRArbiter.scala 74:47]
      if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_wptr <= _q_wptr_T_1; // @[PacketRRArbiter.scala 83:12]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 37:23]
      q_rptr <= 2'h0; // @[PacketRRArbiter.scala 37:23]
    end else if (!(q_wr_en & ~q_rd_en & ~q_full)) begin // @[PacketRRArbiter.scala 70:39]
      if (q_rd_en & ~q_wr_en & _q_wr_en_T_1) begin // @[PacketRRArbiter.scala 74:47]
        q_rptr <= _q_rptr_T_1; // @[PacketRRArbiter.scala 75:12]
      end else if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
        q_rptr <= _GEN_16;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 38:22]
      q_cnt <= 3'h0; // @[PacketRRArbiter.scala 38:22]
    end else if (q_wr_en & ~q_rd_en & ~q_full) begin // @[PacketRRArbiter.scala 70:39]
      q_cnt <= _q_cnt_T_1; // @[PacketRRArbiter.scala 72:11]
    end else if (q_rd_en & ~q_wr_en & _q_wr_en_T_1) begin // @[PacketRRArbiter.scala 74:47]
      q_cnt <= _q_cnt_T_3; // @[PacketRRArbiter.scala 76:11]
    end else if (q_wr_en & q_rd_en) begin // @[PacketRRArbiter.scala 77:35]
      q_cnt <= _GEN_17;
    end
    if (reset) begin // @[PacketRRArbiter.scala 40:24]
      pending_0 <= 1'h0; // @[PacketRRArbiter.scala 40:24]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (_granted_T != 4'h0) begin // @[PacketRRArbiter.scala 146:42]
        if (_T_51 == 4'h0) begin // @[PacketRRArbiter.scala 147:38]
          pending_0 <= valid_req[0]; // @[PacketRRArbiter.scala 148:43]
        end else begin
          pending_0 <= valid_req[0] ^ fin[0]; // @[PacketRRArbiter.scala 151:43]
        end
      end
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        pending_0 <= pending_0 ^ fin[0]; // @[PacketRRArbiter.scala 158:41]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 40:24]
      pending_1 <= 1'h0; // @[PacketRRArbiter.scala 40:24]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (_granted_T != 4'h0) begin // @[PacketRRArbiter.scala 146:42]
        if (_T_51 == 4'h0) begin // @[PacketRRArbiter.scala 147:38]
          pending_1 <= valid_req[1]; // @[PacketRRArbiter.scala 148:43]
        end else begin
          pending_1 <= valid_req[1] ^ fin[1]; // @[PacketRRArbiter.scala 151:43]
        end
      end
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        pending_1 <= pending_1 ^ fin[1]; // @[PacketRRArbiter.scala 158:41]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 40:24]
      pending_2 <= 1'h0; // @[PacketRRArbiter.scala 40:24]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (_granted_T != 4'h0) begin // @[PacketRRArbiter.scala 146:42]
        if (_T_51 == 4'h0) begin // @[PacketRRArbiter.scala 147:38]
          pending_2 <= valid_req[2]; // @[PacketRRArbiter.scala 148:43]
        end else begin
          pending_2 <= valid_req[2] ^ fin[2]; // @[PacketRRArbiter.scala 151:43]
        end
      end
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        pending_2 <= pending_2 ^ fin[2]; // @[PacketRRArbiter.scala 158:41]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 40:24]
      pending_3 <= 1'h0; // @[PacketRRArbiter.scala 40:24]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (_granted_T != 4'h0) begin // @[PacketRRArbiter.scala 146:42]
        if (_T_51 == 4'h0) begin // @[PacketRRArbiter.scala 147:38]
          pending_3 <= valid_req[3]; // @[PacketRRArbiter.scala 148:43]
        end else begin
          pending_3 <= valid_req[3] ^ fin[3]; // @[PacketRRArbiter.scala 151:43]
        end
      end
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        pending_3 <= pending_3 ^ fin[3]; // @[PacketRRArbiter.scala 158:41]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 41:23]
      queued_0 <= 1'h0; // @[PacketRRArbiter.scala 41:23]
    end else if (req[0] & grant[0] & fin[0]) begin // @[PacketRRArbiter.scala 56:39]
      queued_0 <= 1'h0; // @[PacketRRArbiter.scala 57:17]
    end else begin
      queued_0 <= _GEN_0;
    end
    if (reset) begin // @[PacketRRArbiter.scala 41:23]
      queued_1 <= 1'h0; // @[PacketRRArbiter.scala 41:23]
    end else if (req[1] & grant[1] & fin[1]) begin // @[PacketRRArbiter.scala 56:39]
      queued_1 <= 1'h0; // @[PacketRRArbiter.scala 57:17]
    end else begin
      queued_1 <= _GEN_2;
    end
    if (reset) begin // @[PacketRRArbiter.scala 41:23]
      queued_2 <= 1'h0; // @[PacketRRArbiter.scala 41:23]
    end else if (req[2] & grant[2] & fin[2]) begin // @[PacketRRArbiter.scala 56:39]
      queued_2 <= 1'h0; // @[PacketRRArbiter.scala 57:17]
    end else begin
      queued_2 <= _GEN_4;
    end
    if (reset) begin // @[PacketRRArbiter.scala 41:23]
      queued_3 <= 1'h0; // @[PacketRRArbiter.scala 41:23]
    end else if (req[3] & grant[3] & fin[3]) begin // @[PacketRRArbiter.scala 56:39]
      queued_3 <= 1'h0; // @[PacketRRArbiter.scala 57:17]
    end else begin
      queued_3 <= _GEN_6;
    end
    if (reset) begin // @[PacketRRArbiter.scala 44:22]
      state <= 1'h0; // @[PacketRRArbiter.scala 44:22]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (_granted_T != 4'h0) begin // @[PacketRRArbiter.scala 146:42]
        state <= _GEN_77;
      end
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        state <= 1'h0; // @[PacketRRArbiter.scala 160:15]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 45:24]
      granted <= 4'h0; // @[PacketRRArbiter.scala 45:24]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      granted <= _granted_T; // @[PacketRRArbiter.scala 140:15]
    end else if (state) begin // @[PacketRRArbiter.scala 116:18]
      if (_T_51 != 4'h0) begin // @[PacketRRArbiter.scala 157:36]
        granted <= 4'h0; // @[PacketRRArbiter.scala 159:17]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 47:21]
      prio_0 <= 4'h1; // @[PacketRRArbiter.scala 47:21]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (granted_tmp_3 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_0 <= prio_1; // @[PacketRRArbiter.scala 135:39]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 47:21]
      prio_1 <= 4'h2; // @[PacketRRArbiter.scala 47:21]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (granted_tmp_3 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_1 <= prio_2; // @[PacketRRArbiter.scala 135:39]
      end else if (granted_tmp_2 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_1 <= prio_2; // @[PacketRRArbiter.scala 135:39]
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 47:21]
      prio_2 <= 4'h4; // @[PacketRRArbiter.scala 47:21]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (granted_tmp_3 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_2 <= prio_3; // @[PacketRRArbiter.scala 135:39]
      end else if (granted_tmp_2 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_2 <= prio_3; // @[PacketRRArbiter.scala 135:39]
      end else begin
        prio_2 <= _GEN_56;
      end
    end
    if (reset) begin // @[PacketRRArbiter.scala 47:21]
      prio_3 <= 4'h8; // @[PacketRRArbiter.scala 47:21]
    end else if (~state) begin // @[PacketRRArbiter.scala 116:18]
      if (granted_tmp_3 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_3 <= prio_0; // @[PacketRRArbiter.scala 136:21]
      end else if (granted_tmp_2 != 4'h0) begin // @[PacketRRArbiter.scala 133:36]
        prio_3 <= prio_1; // @[PacketRRArbiter.scala 136:21]
      end else begin
        prio_3 <= _GEN_57;
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
  q_mem_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  q_mem_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  q_mem_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  q_mem_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  q_wptr = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  q_rptr = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  q_cnt = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  pending_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  pending_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  pending_2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  pending_3 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  queued_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  queued_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  queued_2 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  queued_3 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  granted = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  prio_0 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  prio_1 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  prio_2 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  prio_3 = _RAND_20[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AxisRRArbiter(

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
  wire  rr_arbiter_clock; // @[AxisRRArbiter.scala 29:26]
  wire  rr_arbiter_reset; // @[AxisRRArbiter.scala 29:26]
  wire [3:0] rr_arbiter_req; // @[AxisRRArbiter.scala 29:26]
  wire [3:0] rr_arbiter_fin; // @[AxisRRArbiter.scala 29:26]
  wire [3:0] rr_arbiter_grant; // @[AxisRRArbiter.scala 29:26]
  wire  rr_arbiter_ready; // @[AxisRRArbiter.scala 29:26]
  reg  processing_0; // @[AxisRRArbiter.scala 11:27]
  reg  processing_1; // @[AxisRRArbiter.scala 11:27]
  reg  processing_2; // @[AxisRRArbiter.scala 11:27]
  reg  processing_3; // @[AxisRRArbiter.scala 11:27]
  wire  arb_req_0 = s00_axis_tvalid | processing_0; // @[AxisRRArbiter.scala 23:36]
  wire  arb_fin_0 = s00_axis_tvalid & s00_axis_tlast & s00_axis_tready; // @[AxisRRArbiter.scala 24:54]
  wire  arb_req_1 = s01_axis_tvalid | processing_1; // @[AxisRRArbiter.scala 23:36]
  wire  arb_fin_1 = s01_axis_tvalid & s01_axis_tlast & s01_axis_tready; // @[AxisRRArbiter.scala 24:54]
  wire  arb_req_2 = s02_axis_tvalid | processing_2; // @[AxisRRArbiter.scala 23:36]
  wire  arb_fin_2 = s02_axis_tvalid & s02_axis_tlast & s02_axis_tready; // @[AxisRRArbiter.scala 24:54]
  wire  arb_req_3 = s03_axis_tvalid | processing_3; // @[AxisRRArbiter.scala 23:36]
  wire  arb_fin_3 = s03_axis_tvalid & s03_axis_tlast & s03_axis_tready; // @[AxisRRArbiter.scala 24:54]
  wire [1:0] rr_arbiter_req_lo = {arb_req_1,arb_req_0}; // @[AxisRRArbiter.scala 30:29]
  wire [1:0] rr_arbiter_req_hi = {arb_req_3,arb_req_2}; // @[AxisRRArbiter.scala 30:29]
  wire [1:0] rr_arbiter_fin_lo = {arb_fin_1,arb_fin_0}; // @[AxisRRArbiter.scala 31:29]
  wire [1:0] rr_arbiter_fin_hi = {arb_fin_3,arb_fin_2}; // @[AxisRRArbiter.scala 31:29]
  wire  arb_grant_0 = rr_arbiter_grant[0]; // @[AxisRRArbiter.scala 33:56]
  wire  arb_grant_1 = rr_arbiter_grant[1]; // @[AxisRRArbiter.scala 33:56]
  wire  arb_grant_2 = rr_arbiter_grant[2]; // @[AxisRRArbiter.scala 33:56]
  wire  arb_grant_3 = rr_arbiter_grant[3]; // @[AxisRRArbiter.scala 33:56]
  wire [31:0] _GEN_8 = arb_grant_3 ? s03_axis_tdata : 32'h0; // @[AxisRRArbiter.scala 35:16 39:25 40:20]
  wire  _GEN_9 = arb_grant_3 & s03_axis_tvalid; // @[AxisRRArbiter.scala 36:17 39:25 41:21]
  wire  _GEN_10 = arb_grant_3 & s03_axis_tlast; // @[AxisRRArbiter.scala 37:16 39:25 42:20]
  wire [31:0] _GEN_11 = arb_grant_2 ? s02_axis_tdata : _GEN_8; // @[AxisRRArbiter.scala 39:25 40:20]
  wire  _GEN_12 = arb_grant_2 ? s02_axis_tvalid : _GEN_9; // @[AxisRRArbiter.scala 39:25 41:21]
  wire  _GEN_13 = arb_grant_2 ? s02_axis_tlast : _GEN_10; // @[AxisRRArbiter.scala 39:25 42:20]
  wire [31:0] _GEN_14 = arb_grant_1 ? s01_axis_tdata : _GEN_11; // @[AxisRRArbiter.scala 39:25 40:20]
  wire  _GEN_15 = arb_grant_1 ? s01_axis_tvalid : _GEN_12; // @[AxisRRArbiter.scala 39:25 41:21]
  wire  _GEN_16 = arb_grant_1 ? s01_axis_tlast : _GEN_13; // @[AxisRRArbiter.scala 39:25 42:20]
  PacketRRArbiter rr_arbiter ( // @[AxisRRArbiter.scala 29:26]
    .clock(rr_arbiter_clock),
    .reset(rr_arbiter_reset),
    .req(rr_arbiter_req),
    .fin(rr_arbiter_fin),
    .grant(rr_arbiter_grant),
    .ready(rr_arbiter_ready)
  );
  assign s00_axis_tready = rr_arbiter_grant[0]; // @[AxisRRArbiter.scala 33:56]
  assign s01_axis_tready = rr_arbiter_grant[1]; // @[AxisRRArbiter.scala 33:56]
  assign s02_axis_tready = rr_arbiter_grant[2]; // @[AxisRRArbiter.scala 33:56]
  assign s03_axis_tready = rr_arbiter_grant[3]; // @[AxisRRArbiter.scala 33:56]
  assign m_axis_tdata = arb_grant_0 ? s00_axis_tdata : _GEN_14; // @[AxisRRArbiter.scala 39:25 40:20]
  assign m_axis_tvalid = arb_grant_0 ? s00_axis_tvalid : _GEN_15; // @[AxisRRArbiter.scala 39:25 41:21]
  assign m_axis_tlast = arb_grant_0 ? s00_axis_tlast : _GEN_16; // @[AxisRRArbiter.scala 39:25 42:20]
  assign rr_arbiter_clock = clock;
  assign rr_arbiter_reset = reset;
  assign rr_arbiter_req = {rr_arbiter_req_hi,rr_arbiter_req_lo}; // @[AxisRRArbiter.scala 30:29]
  assign rr_arbiter_fin = {rr_arbiter_fin_hi,rr_arbiter_fin_lo}; // @[AxisRRArbiter.scala 31:29]
  assign rr_arbiter_ready = m_axis_tready; // @[AxisRRArbiter.scala 15:23 27:13]
  always @(posedge clock) begin
    if (reset) begin // @[AxisRRArbiter.scala 11:27]
      processing_0 <= 1'h0; // @[AxisRRArbiter.scala 11:27]
    end else if (~processing_0 & s00_axis_tvalid) begin // @[AxisRRArbiter.scala 18:46]
      processing_0 <= ~(s00_axis_tlast & s00_axis_tready); // @[AxisRRArbiter.scala 19:21]
    end else if (processing_0 & s00_axis_tvalid & s00_axis_tlast & s00_axis_tready) begin // @[AxisRRArbiter.scala 20:89]
      processing_0 <= 1'h0; // @[AxisRRArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisRRArbiter.scala 11:27]
      processing_1 <= 1'h0; // @[AxisRRArbiter.scala 11:27]
    end else if (~processing_1 & s01_axis_tvalid) begin // @[AxisRRArbiter.scala 18:46]
      processing_1 <= ~(s01_axis_tlast & s01_axis_tready); // @[AxisRRArbiter.scala 19:21]
    end else if (processing_1 & s01_axis_tvalid & s01_axis_tlast & s01_axis_tready) begin // @[AxisRRArbiter.scala 20:89]
      processing_1 <= 1'h0; // @[AxisRRArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisRRArbiter.scala 11:27]
      processing_2 <= 1'h0; // @[AxisRRArbiter.scala 11:27]
    end else if (~processing_2 & s02_axis_tvalid) begin // @[AxisRRArbiter.scala 18:46]
      processing_2 <= ~(s02_axis_tlast & s02_axis_tready); // @[AxisRRArbiter.scala 19:21]
    end else if (processing_2 & s02_axis_tvalid & s02_axis_tlast & s02_axis_tready) begin // @[AxisRRArbiter.scala 20:89]
      processing_2 <= 1'h0; // @[AxisRRArbiter.scala 21:21]
    end
    if (reset) begin // @[AxisRRArbiter.scala 11:27]
      processing_3 <= 1'h0; // @[AxisRRArbiter.scala 11:27]
    end else if (~processing_3 & s03_axis_tvalid) begin // @[AxisRRArbiter.scala 18:46]
      processing_3 <= ~(s03_axis_tlast & s03_axis_tready); // @[AxisRRArbiter.scala 19:21]
    end else if (processing_3 & s03_axis_tvalid & s03_axis_tlast & s03_axis_tready) begin // @[AxisRRArbiter.scala 20:89]
      processing_3 <= 1'h0; // @[AxisRRArbiter.scala 21:21]
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

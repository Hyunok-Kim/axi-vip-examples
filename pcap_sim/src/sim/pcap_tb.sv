`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2022 12:37:47 PM
// Design Name: 
// Module Name: pcap_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pcap_tb();
bit aclk=0;
bit aresetn = 0;
always #5ns aclk = ~aclk;

design_1_wrapper DUT(.*);

test t1(.*);
endmodule

`include "../pcap_dpi/pcap_dpi.sv"
import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;
import design_1_axi4stream_vip_1_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn);
mailbox mbox;
initial begin
    mbox = new();
    fork
        master();
        slave();
    join
end
task master();
    design_1_axi4stream_vip_0_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    int phandle, pkt_len;
    bit [7:0]    pkt [2000];
    bit [63:0]   sm_time;

    master_agent = new("master vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0); 
    master_agent.start_master();
    pv_register();
    pv_open(phandle, "sample-capture.pcap", 1);
    
    wait (aresetn == 1);
    
    pv_get_pkt(phandle, pkt_len, pkt, sm_time);
    while (pkt_len != 0)
    begin
        mbox.put(pkt_len);
        for (int i=0; i < pkt_len; i++) begin
            wr_transaction.set_data_beat(pkt[i]);
            wr_transaction.set_keep_beat(1);
            if (i == pkt_len - 1) wr_transaction.set_last(1);
            else wr_transaction.set_last(0);
            master_agent.driver.send(wr_transaction);
        end
        
        pv_get_pkt(phandle, pkt_len, pkt, sm_time);
    end
    mbox.put(0);
endtask

task slave();
    bit last;
    design_1_axi4stream_vip_1_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    int phandle, pkt_len;
    bit [7:0]  pkt [];
    
    slave_agent = new("slave vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    slave_agent.start_slave();
        
    repeat(5) @(negedge aclk);
    aresetn = 1;
    
    slave_agent.driver.send_tready(ready_gen);
    
    pv_open (phandle, "sample-dump.pcap", 0);
    
    forever begin
        mbox.get(pkt_len);
        if (pkt_len == 0) break;
        pkt = new [pkt_len];
        for (int i=0; i<pkt_len; i++) begin
            slave_agent.monitor.item_collected_port.get(rd_transaction);
            pkt[i] = rd_transaction.get_data_beat();
            last = rd_transaction.get_last();
            if (last) $display("pkt_len = %d", pkt_len);
        end
        pv_dump_pkt(phandle, pkt.size, pkt, $time);
    end
    pv_shutdown(phandle);
    repeat(5) @(negedge aclk); 
endtask
endprogram

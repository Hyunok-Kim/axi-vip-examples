`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 08:00:58 AM
// Design Name: 
// Module Name: AxisRRArbiter_tb
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

module AxisRRArbiter_tb();
bit aclk=0;
bit aresetn = 0;
always #5ns aclk = ~aclk;
design_1_wrapper DUT
(
    .aclk(aclk),
    .aresetn(aresetn)
);

test t1(aclk, aresetn);
endmodule

import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;
import design_1_axi4stream_vip_1_0_pkg::*;
import design_1_axi4stream_vip_2_0_pkg::*;
import design_1_axi4stream_vip_3_0_pkg::*;
import design_1_axi4stream_vip_4_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn);
initial begin
    fork
        master0();
        master1();
        master2();
        master3();
        slave();
    join
end
task master0();
    design_1_axi4stream_vip_0_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master0 vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    wait (aresetn == 1);
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i);
        if (i == 7 || i == 15) wr_transaction.set_last(1);
        else wr_transaction.set_last(0);
        master_agent.driver.send(wr_transaction);
    end
endtask

task master1();
    design_1_axi4stream_vip_1_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master1 vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    wait (aresetn == 1);
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i<<8);
        if (i == 7 || i == 15) wr_transaction.set_last(1);
        else wr_transaction.set_last(0);
        master_agent.driver.send(wr_transaction);
    end
endtask

task master2();
    design_1_axi4stream_vip_2_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master2 vip agent", DUT.design_1_i.axi4stream_vip_2.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    wait (aresetn == 1);
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i<<16);
        if (i == 7 || i == 15) wr_transaction.set_last(1);
        else wr_transaction.set_last(0);
        master_agent.driver.send(wr_transaction);
    end
endtask

task master3();
    design_1_axi4stream_vip_3_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master3 vip agent", DUT.design_1_i.axi4stream_vip_3.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    wait (aresetn == 1);
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i<<24);
        if (i == 7 || i == 15) wr_transaction.set_last(1);
        else wr_transaction.set_last(0);
        master_agent.driver.send(wr_transaction);
    end
endtask

task slave();
    bit [31:0] data;
    bit last;
    int ret = 0;
    design_1_axi4stream_vip_4_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave vip agent", DUT.design_1_i.axi4stream_vip_4.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    slave_agent.start_slave();
    
    repeat(5) @(negedge aclk);
    aresetn = 1;
    
    slave_agent.driver.send_tready(ready_gen);
    
    forever begin
        slave_agent.monitor.item_collected_port.get(rd_transaction);
        data = rd_transaction.get_data_beat();
        last = rd_transaction.get_last();
        $display("data = 0x%x", data);
        if (last) ret++;
        if (ret == 8) break;
    end
    repeat(5) @(negedge aclk);
endtask
endprogram

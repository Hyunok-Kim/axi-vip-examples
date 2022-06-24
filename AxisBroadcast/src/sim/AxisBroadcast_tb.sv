`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2022 04:10:13 PM
// Design Name: 
// Module Name: AxisBroadcast_tb
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

module AxisBroadcast_tb();
bit aclk=0;
bit aresetn = 0;
always #5ns aclk = ~aclk;

design_1_wrapper DUT(.*);
test t1(.*);
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
        master();
	slave0();
	slave1();
	slave2();
	slave3();
    join
end
task master();
    design_1_axi4stream_vip_0_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    repeat(5) @(negedge aclk);
    aresetn = 1;
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i);
        if (i == 7 || i == 15) wr_transaction.set_last(1);
        else wr_transaction.set_last(0);
        master_agent.driver.send(wr_transaction);
    end
    
    repeat(10) @(negedge aclk);
endtask

task slave0();
    design_1_axi4stream_vip_1_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave0 vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    //ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);
endtask

task slave1();
    design_1_axi4stream_vip_2_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave1 vip agent", DUT.design_1_i.axi4stream_vip_2.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    //ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);

endtask

task slave2();
    design_1_axi4stream_vip_3_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave2 vip agent", DUT.design_1_i.axi4stream_vip_3.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    //ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);

endtask

task slave3();
    design_1_axi4stream_vip_4_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave3 vip agent", DUT.design_1_i.axi4stream_vip_4.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    //ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);
endtask
endprogram

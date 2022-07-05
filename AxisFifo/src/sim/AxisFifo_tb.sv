`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2022 01:23:41 PM
// Design Name: 
// Module Name: AxisFifo_tb
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


module AxisFifo_tb();
bit aclk = 0, aresetn = 0;
always #5ns aclk = ~aclk;
design_1_wrapper DUT(.*);

test t1(.*);
endmodule

import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;
import design_1_axi4stream_vip_1_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn);
mailbox mbox;
initial begin
    mbox = new();
    fork
        driver();
        receiver();
    join
end
task driver();
    int temp;
    design_1_axi4stream_vip_0_0_mst_t driver_agent;
    axi4stream_transaction wr_transaction;
    driver_agent = new("driver vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    driver_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    driver_agent.set_agent_tag("Driver VIP");
    //receiver_agent.set_verbosity(400)
    wr_transaction = driver_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
    
     driver_agent.start_master();
     
    repeat(5) @(negedge aclk);
     
    aresetn = 1;
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i);
        //wr_transaction.set_last(1);
        driver_agent.driver.send(wr_transaction);
    end
    
    repeat(5) @(negedge aclk);
    mbox.put(16);
    
endtask

task receiver();
    int n;
    design_1_axi4stream_vip_1_0_slv_t receiver_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    receiver_agent = new("receiver vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);    
    receiver_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    receiver_agent.set_agent_tag("Receiver VIP");
    //receiver_agent.set_verbosity(400);
    ready_gen = receiver_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    mbox.get(n);
    receiver_agent.start_slave();
    receiver_agent.driver.send_tready(ready_gen);
    
    for (int i=0; i<n; i++) begin
        receiver_agent.monitor.item_collected_port.get(rd_transaction);
    end
    
    repeat(5) @(negedge aclk);
    
endtask
endprogram

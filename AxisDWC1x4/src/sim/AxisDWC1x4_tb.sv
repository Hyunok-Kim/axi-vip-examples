`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 11:19:26 AM
// Design Name: 
// Module Name: AxisDWC1x4_tb
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

module AxisDWC1x4_tb();
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

program automatic test(input bit aclk, output bit aresetn);
initial begin
    fork
        master();
        slave();
    join_any
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

    @(negedge aclk);

    for (int i = 0; i<8; i++) begin
        wr_transaction.set_data_beat(i);
        wr_transaction.set_keep_beat(1);
        if (i == 4 || i == 7)
            wr_transaction.set_last(1);
        else 
            wr_transaction.set_last(0);            
        master_agent.driver.send(wr_transaction);          
    end    

    repeat(5) @(negedge aclk);
    $finish;
endtask

task slave();
    bit [31:0] data_rd;
    bit [3:0] data_keep;
    bit data_last;
    design_1_axi4stream_vip_1_0_slv_t slave_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    slave_agent = new("slave vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);
    
    forever begin
        slave_agent.monitor.item_collected_port.get(rd_transaction);
        data_rd = rd_transaction.get_data_beat();
        data_keep = rd_transaction.get_keep_beat();
        data_last = rd_transaction.get_last();
        $display("data_rd = 0x%x, data_keep = 0x%x, data_last = 0x%x", data_rd, data_keep, data_last);
    end
endtask
endprogram

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 11:10:42 PM
// Design Name: 
// Module Name: AxisAddOne_tb
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

import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;
import design_1_axi4stream_vip_1_0_pkg::*;

module AxisAddOne_tb();
bit aclk=0;
bit aresetn = 0;
bit [31:0] data_wr, data_rd;
bit [7:0] tmp0, tmp1, tmp2, tmp3;
int i,j;
always #5ns aclk = ~aclk;

design_1_wrapper DUT
(
    .aclk(aclk),
    .aresetn(aresetn)
);

design_1_axi4stream_vip_0_0_mst_t master_agent;
axi4stream_transaction wr_transaction;

design_1_axi4stream_vip_1_0_slv_t slave_agent;
axi4stream_ready_gen ready_gen;
axi4stream_transaction rd_transaction;


initial begin
    master_agent = new("master vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
     
    master_agent.start_master();
    
    for (i=0; i<5; i++)
    @(negedge aclk);
     
    aresetn = 1;

    @(negedge aclk);
    
    for (i=0; i<256; i++) begin
        data_wr[7:0] = i*4;
        data_wr[15:8] = i*4+1;
        data_wr[23:16] = i*4+2;
        data_wr[31:24] = i*4+3;
        wr_transaction.set_data_beat(data_wr);
        wr_transaction.set_keep_beat(4'hf);
        master_agent.driver.send(wr_transaction);
        
    end
    
    for (i=0; i<5; i++)
    @(negedge aclk);
    
    $finish;
    
end

initial begin
    slave_agent = new("slave vip agent", DUT.design_1_i.axi4stream_vip_1.inst.IF);    
    slave_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    slave_agent.set_agent_tag("Slave VIP");
    //slave_agent.set_verbosity(400);
    ready_gen = slave_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    slave_agent.start_slave();
    
    wait (aresetn == 1);
    
    slave_agent.driver.send_tready(ready_gen);
    
    j=0;
    forever begin
         slave_agent.monitor.item_collected_port.get(rd_transaction);
         data_rd = rd_transaction.get_data_beat();
         tmp0 = j+1; tmp1 = j+2; tmp2 = j+3; tmp3 = j+4;
         if ((data_rd[7:0] != tmp0) || (data_rd[15:8] != tmp1) || (data_rd[23:16] != tmp2) || (data_rd[31:24] != tmp3))
            $display("no matched data: data_rd = 0x%02x%02x%02x%02x, data_rd = 0x%x", tmp3, tmp2, tmp1, tmp0, data_rd);
         j = j+4;
    end
    
end


endmodule

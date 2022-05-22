`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 09:32:51 PM
// Design Name: 
// Module Name: AxiMM2STest_tb
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

import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;
import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;

module AxiMM2STest_tb();
bit aclk=0;
bit aresetn = 0;
bit [31:0] addr_reg = 32'h4000_0000, addr_bram = 32'hC000_0000, addr_bram2 = 32'hD000_0000;
bit [31:0] data_wr, data_rd, data_rd2;
int i;
always #5ns aclk = ~aclk;

design_1_wrapper DUT
(
    .aclk(aclk),
    .aresetn(aresetn)
);


design_1_axi_vip_0_0_mst_t master_agent;
xil_axi_resp_t resp;
design_1_axi4stream_vip_0_0_slv_t slave_agent;
axi4stream_ready_gen ready_gen;
axi4stream_transaction rd_transaction;

initial begin
    master_agent = new("master vip agent",DUT.design_1_i.axi_vip_0.inst.IF);  
    master_agent.set_agent_tag("Master VIP");  
    //master_agent.set_verbosity(400);   
    master_agent.start_master();
    
    for (i=0; i<5; i++)
    @(negedge aclk);
    
    aresetn = 1;

    #20ns 
    for (i=0; i<256; i++) begin
        data_wr[7:0] = i*4;
        data_wr[15:8] = i*4+1;
        data_wr[23:16] = i*4+2;
        data_wr[31:24] = i*4+3;
        master_agent.AXI4LITE_WRITE_BURST(addr_bram2+i*4, 0, data_wr, resp);
        
    end
 
/*  
    for (i=0; i<256; i++) begin    
        master_agent.AXI4LITE_READ_BURST(addr_bram2+i*4, 0, data_rd, resp);
        $display("data_rd = 0x%x", data_rd);
        
    end
*/
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h010, 0, addr_bram + 7, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h014, 0, 6, resp);   
    master_agent.AXI4LITE_WRITE_BURST(addr_reg, 0, 1, resp);
    
    data_rd = 0;
    while(data_rd != 1) begin
        master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_rd, resp);
    end
    
    for (i=0; i<5; i++)
    @(negedge aclk);
    $finish;
        
end

initial begin
    slave_agent = new("slave vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);    
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
        data_rd2 = rd_transaction.get_data_beat();
        $display("data_rd2 = 0x%x", data_rd2);
    end

end

endmodule

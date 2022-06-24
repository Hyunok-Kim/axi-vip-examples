`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 06:41:04 AM
// Design Name: 
// Module Name: AxiS2MMTest_tb
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

module AxiS2MMTest_tb();
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

import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;
import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn);
bit start = 0;
initial begin
    fork
        master0();
        master1();
    join
    $finish;
end
task master0();
    bit [31:0] addr_reg = 32'h4000_0000, addr_bram = 32'hC000_0000, addr_bram2 = 32'hD000_0000;
    bit [31:0] data_rd;
    design_1_axi_vip_0_0_mst_t master_agent;
    xil_axi_resp_t resp;
    master_agent = new("master vip agent",DUT.design_1_i.axi_vip_0.inst.IF);  
    master_agent.set_agent_tag("Master VIP");  
    //master_agent.set_verbosity(400); 
    master_agent.start_master();
    
    repeat(5) @(negedge aclk);
    
    aresetn = 1;

    @(negedge aclk);
    
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h010, 0, addr_bram + 7, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h014, 0, 6, resp);   
    master_agent.AXI4LITE_WRITE_BURST(addr_reg, 0, 1, resp);
    start = 1;
    
    data_rd = 0;
    while(data_rd != 1) begin
        master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_rd, resp);
    end
    
    for (int i=0; i<10; i++) begin    
        master_agent.AXI4LITE_READ_BURST(addr_bram2+i*4, 0, data_rd, resp);
        $display("data_rd = 0x%x", data_rd);     
    end
    
    repeat(5) @(negedge aclk);
endtask

task master1();
    bit [31:0] data_wr;
    design_1_axi4stream_vip_0_0_mst_t master_agent;
    axi4stream_transaction wr_transaction;
    master_agent = new("master2 vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);
    master_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);
    master_agent.set_agent_tag("Master2 VIP");
    //master_agent.set_verbosity(400)
    wr_transaction = master_agent.driver.create_transaction("wr_transaction");
    wr_transaction.set_delay(0);
    master_agent.start_master();
    
    wait (aresetn == 1);
    wait (start == 1);
    
    data_wr = 32'h07060504;
    wr_transaction.set_data_beat(data_wr);
    wr_transaction.set_keep_beat(4'h8);
    master_agent.driver.send(wr_transaction);
    
    data_wr = 32'h0b0a0908;
    wr_transaction.set_data_beat(data_wr);
    wr_transaction.set_keep_beat(4'hf);
    master_agent.driver.send(wr_transaction);
    
    data_wr = 32'h0f0e0d0c;
    wr_transaction.set_data_beat(data_wr);
    wr_transaction.set_keep_beat(4'h1);
    master_agent.driver.send(wr_transaction);
endtask
endprogram

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2022 07:50:10 PM
// Design Name: 
// Module Name: AxiMasterTest_tb
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


module AxiMasterTest_tb();
bit aclk = 0;
bit aresetn = 0;
bit wr_done = 0, rd_done = 0;
bit [31:0] addr_reg = 32'h4000_0000, addr_bram = 32'hC000_0000, addr_bram2 = 32'hD000_0000;
bit [31:0] data_wr1 = 32'h01234567, data_wr2 = 32'h89ABCDEF, data_wr3 = 32'h76543210, data_wr4 = 32'hFEDCBA98;
bit [31:0] data_rd1, data_rd2, data_rd3, data_rd4;
bit [31:0] data_done;
int i;
always #5ns aclk = ~aclk;

design_1_wrapper DUT
(
    .aclk(aclk),
    .aresetn(aresetn),
    .wr_done(wr_done),
    .rd_done(rd_done)
);

design_1_axi_vip_0_0_mst_t master_agent;
xil_axi_resp_t resp;

initial begin
    master_agent = new("master vip agent",DUT.design_1_i.axi_vip_0.inst.IF);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400);
    master_agent.start_master();
    
    for (i=0; i<5; i++) 
    @(negedge aclk);

    aresetn = 1;
    
    @(negedge aclk);

    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h018, 0, data_wr1, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h01C, 0, data_wr2, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h020, 0, data_wr3, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h024, 0, data_wr4, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h010, 0, addr_bram, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h000, 0, 1, resp);
    
    $display("****** Before wait wr_done ******");
    wait(wr_done == 1)
    $display("****** After wait wr_done ******");

    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_done, resp);
    $display("data_done = 0x%x", data_done);
   
   /* 
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h014, 0, addr_bram, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h000, 0, 2, resp);
    
    $display("****** Before wait rd_done ******");
    wait(rd_done == 1)
    $display("****** After wait rd_done ******");
        
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h028, 0, data_rd1, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h02C, 0, data_rd2, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h030, 0, data_rd3, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h034, 0, data_rd4, resp);
    */
    
    master_agent.AXI4LITE_READ_BURST(addr_bram2, 0, data_rd1, resp);
    master_agent.AXI4LITE_READ_BURST(addr_bram2+32'h04, 0, data_rd2, resp);
    master_agent.AXI4LITE_READ_BURST(addr_bram2+32'h08, 0, data_rd3, resp);
    master_agent.AXI4LITE_READ_BURST(addr_bram2+32'h0C, 0, data_rd4, resp);
    
    $display("1st data_rd1 = %x, data_rd2 = %x, data_rd3 = %x, data_rd4 = %x", data_rd1, data_rd2, data_rd3, data_rd4);
    if ((data_wr1 == data_rd1) && (data_wr2 == data_rd2) && (data_wr3 == data_rd3) && (data_wr4 == data_rd4))
        $display("Data match, test succeeded");
    else
        $display("Data do not match, test failed");
    
   /* 
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h018, 0, data_wr1, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h01C, 0, data_wr2, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h020, 0, data_wr3, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h024, 0, data_wr4, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h010, 0, addr_bram+32'h04, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h000, 0, 1, resp);
    
    $display("****** Before wait wr_done ******");
    wait(wr_done == 1)
    $display("****** After wait wr_done ******");

    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_done, resp);
    $display("data_done = 0x%x", data_done);
    */
    
    master_agent.AXI4LITE_WRITE_BURST(addr_bram2+32'h04, 0, data_rd1, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_bram2+32'h08, 0, data_rd2, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_bram2+32'h0C, 0, data_rd3, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_bram2+32'h10, 0, data_rd4, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h014, 0, addr_bram+32'h04, resp);

    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h000, 0, 2, resp);
    
    $display("****** Before wait rd_done ******");
    wait(rd_done == 1)
    $display("****** After wait rd_done ******");

    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_done, resp);
    $display("data_done = 0x%x", data_done);
        
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h028, 0, data_rd1, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h02C, 0, data_rd2, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h030, 0, data_rd3, resp);
    master_agent.AXI4LITE_READ_BURST(addr_reg+32'h034, 0, data_rd4, resp);
    
    $display("2nd data_rd1 = %x, data_rd2 = %x, data_rd3 = %x, data_rd4 = %x", data_rd1, data_rd2, data_rd3, data_rd4);
    if ((data_wr1 == data_rd1) && (data_wr2 == data_rd2) && (data_wr3 == data_rd3) && (data_wr4 == data_rd4))
        $display("Data match, test succeeded");
    else
        $display("Data do not match, test failed");    
        
    for (i=0; i<5; i++) 
    @(negedge aclk);
    $finish;
end

endmodule

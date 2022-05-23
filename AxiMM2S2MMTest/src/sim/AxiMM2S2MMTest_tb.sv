`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 08:14:44 PM
// Design Name: 
// Module Name: AxiMM2S2MMTest_tb
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

module AxiMM2S2MMTest_tb();
bit aclk=0;
bit aresetn = 0;
bit [31:0] addr_reg = 32'h4000_0000, addr_bram = 32'hC000_0000, addr_bram2 = 32'hD000_0000;
bit [31:0] data_wr, data_rd;
int i,j;
always #5ns aclk = ~aclk;

design_1_wrapper DUT
(
    .aclk(aclk),
    .aresetn(aresetn)
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

    j = 4;
    for (i=0; i<256*j; i++) begin
        data_wr[7:0] = i*4;
        data_wr[15:8] = i*4+1;
        data_wr[23:16] = i*4+2;
        data_wr[31:24] = i*4+3;
        master_agent.AXI4LITE_WRITE_BURST(addr_bram2+i*4, 0, data_wr, resp);
        
    end
 

    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h010, 0, addr_bram + 32'h0, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h014, 0, addr_bram + 32'h400*j, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg+32'h018, 0, 1024*j, resp);
    master_agent.AXI4LITE_WRITE_BURST(addr_reg, 0, 1, resp);
    
    data_rd = 0;
    while(data_rd != 3) begin
        master_agent.AXI4LITE_READ_BURST(addr_reg+32'h004, 0, data_rd, resp);
    end
    
    
    for (i=0; i<256*j; i++) begin    
        master_agent.AXI4LITE_READ_BURST(addr_bram2+ 32'h400*j+i, 0, data_rd, resp);
        $display("data_rd = 0x%x", data_rd);
        
    end

    
    for (i=0; i<5; i++)
    @(negedge aclk);
    $finish;   
    
    
end

endmodule

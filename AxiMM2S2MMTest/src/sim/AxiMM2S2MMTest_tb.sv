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


module AxiMM2S2MMTest_tb();
bit aclk=0;
bit aresetn = 0;
always #5ns aclk = ~aclk;

design_1_wrapper DUT(.*);
test t1(.*);
endmodule

import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn);
initial begin
    bit [31:0] addr_reg = 32'h4000_0000, addr_bram = 32'hC000_0000, addr_bram2 = 32'hD000_0000;
    bit [31:0] data_wr, data_rd, data_ret;
    bit not_matched;
    int i,j;
    design_1_axi_vip_0_0_mst_t master_agent;
    xil_axi_resp_t resp;
    master_agent = new("master vip agent",DUT.design_1_i.axi_vip_0.inst.IF);  
    master_agent.set_agent_tag("Master VIP");  
    //master_agent.set_verbosity(400);   
    master_agent.start_master();
    
    repeat(5) @(negedge aclk);
    
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
    
    not_matched = 0;
    for (i=0; i<256*j; i++) begin
        data_ret[7:0] = i*4+1;
        data_ret[15:8] = i*4+2;
        data_ret[23:16] = i*4+3;
        data_ret[31:24] = i*4+4;    
        master_agent.AXI4LITE_READ_BURST(addr_bram2+ 32'h400*j+i*4, 0, data_rd, resp);
        if (data_rd != data_ret) begin
            $display("%d not matched : data_rd = 0x%x, data_ret = 0x%x", i, data_rd, data_ret);
            not_matched = 1;
        end
        
    end
    
    if (not_matched)
        $display("Data do not match, test failed");
    else
        $display("Data match, test succeeded");
    
    repeat(5) @(negedge aclk);
end
endprogram

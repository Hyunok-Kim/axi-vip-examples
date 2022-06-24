`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2022 01:19:14 PM
// Design Name: 
// Module Name: AXILiteSlave_tb
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

module AXILiteSlave_tb();
bit aclk = 0, aresetn = 0;
bit[7:0] led_0, sw_0;
always #5ns aclk = ~aclk;

design_1_wrapper UUT(.*);
test t1(.*);
endmodule

import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

program automatic test(input bit aclk, output bit aresetn, output bit sw_0);
initial begin
    bit[31:0] addr, data, base_addr = 32'h4000_0000, sw_state;
    design_1_axi_vip_0_0_mst_t master_agent;
    xil_axi_resp_t resp;
    master_agent = new("master vip agent", UUT.design_1_i.axi_vip_0.inst.IF);
    master_agent.set_agent_tag("Master VIP");
    //master_agent.set_verbosity(400);
    master_agent.start_master();
    
    repeat(5) @(negedge aclk);

    aresetn = 1;
    
    @(negedge aclk);
    addr = 0;
    data = 8'h55;
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
    
    addr = 0;
    data = 8'hAA;
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
    
    sw_0 = 8'h44;
    addr = 4;
    master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
    
    sw_0 = 8'hBB;
    addr = 4;
    master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);

    repeat(5) @(negedge aclk);
end 
endprogram

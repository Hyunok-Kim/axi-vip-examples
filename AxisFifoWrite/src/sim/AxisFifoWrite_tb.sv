`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2022 09:50:59 AM
// Design Name: 
// Module Name: AxisFifoWrite_tb
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


module AxisFifoWrite_tb();
bit aclk = 0, aresetn = 0;
always #5ns aclk = ~aclk;
design_1_wrapper DUT(.*);

test t1(.*);
endmodule

import axi4stream_vip_pkg::*;
import design_1_axi4stream_vip_0_0_pkg::*;
import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

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
    bit[31:0] base_addr = 32'h4000_0000, data, n, j;
    design_1_axi_vip_0_0_mst_t driver_agent;
    xil_axi_resp_t resp;
    driver_agent = new("driver vip agent", DUT.design_1_i.axi_vip_0.inst.IF);
    driver_agent.set_agent_tag("Driver VIP");
    //driver_agent.set_verbosity(400);
    driver_agent.start_master();  
    
    repeat(5) @(negedge aclk);
    aresetn = 1;
       
    j = 0;
    forever begin
        if (j >= 32) break;
        driver_agent.AXI4LITE_READ_BURST(base_addr, 0, data, resp);
        $display("data available = 0x%x", data);
        if (data == 0) continue;
        driver_agent.AXI4LITE_READ_BURST(base_addr + 32'h004, 0, data, resp);
        n = 512 - data;
        $display("n = %d", n);
        for (int i=0; i<8; i++) begin
            driver_agent.AXI4LITE_WRITE_BURST(base_addr + 32'h008, 0, j, resp);
            j++;
        end
        if (j == 16) mbox.put(j);    
    end
    repeat(5) @(negedge aclk);
endtask

task receiver();
    int tmp;
    design_1_axi4stream_vip_0_0_slv_t receiver_agent;
    axi4stream_ready_gen ready_gen;
    axi4stream_transaction rd_transaction;
    receiver_agent = new("receiver vip agent", DUT.design_1_i.axi4stream_vip_0.inst.IF);    
    receiver_agent.vif_proxy.set_dummy_drive_type(XIL_AXI4STREAM_VIF_DRIVE_NONE);    
    receiver_agent.set_agent_tag("Receiver VIP");
    //receiver_agent.set_verbosity(400);
    ready_gen = receiver_agent.driver.create_ready("ready_gen");
    ready_gen.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    
    mbox.get(tmp);
    
    receiver_agent.start_slave();   
    receiver_agent.driver.send_tready(ready_gen);
endtask
endprogram
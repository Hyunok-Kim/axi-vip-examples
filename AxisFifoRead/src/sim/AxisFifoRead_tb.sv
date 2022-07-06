`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 03:40:06 PM
// Design Name: 
// Module Name: AxisFifoRead_tb
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


module AxisFifoRead_tb();
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
initial begin
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
     
    wait (aresetn == 1);
    
    for (int i=0; i<16; i++) begin
        wr_transaction.set_data_beat(i);
        driver_agent.driver.send(wr_transaction);
        if (i%4 == 3 && i != 15) repeat(50) @(negedge aclk);
    end
    
endtask

task receiver();
    bit[31:0] base_addr = 32'h4000_0000, data, n, j;
    design_1_axi_vip_0_0_mst_t receiver_agent;
    xil_axi_resp_t resp;
    receiver_agent = new("receiver vip agent", DUT.design_1_i.axi_vip_0.inst.IF);
    receiver_agent.set_agent_tag("Receiver VIP");
    //receiver_agent.set_verbosity(400);
    receiver_agent.start_master();  
    
     repeat(5) @(negedge aclk);
     aresetn = 1;
       
    j = 0;
    forever begin
        if (j >= 16) break;
        receiver_agent.AXI4LITE_READ_BURST(base_addr, 0, data, resp);
        $display("data available = 0x%x", data);
        if (data == 0) continue;
        receiver_agent.AXI4LITE_READ_BURST(base_addr + 32'h004, 0, data, resp);
        $display("data count = 0x%x", data);
        n = data;
        for (int i=0; i<n; i++) begin
            receiver_agent.AXI4LITE_READ_BURST(base_addr + 32'h008, 0, data, resp);
            $display("data = 0x%x", data);
            j++;
        end    
    end
    repeat(5) @(negedge aclk);
endtask
endprogram

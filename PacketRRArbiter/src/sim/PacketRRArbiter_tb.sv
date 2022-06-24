`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2022 11:32:12 AM
// Design Name: 
// Module Name: PacketRRArbiter_tb
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


module PacketRRArbiter_tb();
bit clock=0, reset=1;
bit [3:0] req, fin, grant;
bit ready=1;
always #50ns clock = ~clock;

PacketRRArbiter DUT(.*);

initial begin
    repeat(5) @(negedge clock);
    reset = 0;
    repeat(5) @(negedge clock);
    for (int i=0; i<4; i++) begin
        fork
            automatic int j = i;
            my_thread(j);
        join_none
    end
    
    repeat(4) begin
        wait(|fin == 1);
        @(negedge clock);
    end
    repeat(5) @(negedge clock);
    $finish;
    
end

task automatic my_thread(int i);
    @(negedge clock);
    req[i] = 1;
    //@(negedge clock);
    //req[i] = 0; 
    wait (grant[i] == 1);
    repeat(5) @(negedge clock);
    fin[i] = 1;
    req[i] = 0;
    @(negedge clock);
    fin[i] = 0;
    
endtask

endmodule

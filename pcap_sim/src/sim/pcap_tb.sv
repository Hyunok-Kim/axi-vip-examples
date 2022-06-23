`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2022 12:37:47 PM
// Design Name: 
// Module Name: pcap_tb
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

// Regitser DPI-C routines
import "DPI-C" function void pv_register ();

//  Create a new dumper (port)
import "DPI-C" function void pv_open (
           output int         phandle,   // handler or port number of new dumper
           input  string      pcap_file, // filename  
           input  int         pcap_type = 0);// 0 -> writting, 1 -> reading

//  Dump a packet to an active dumper
import "DPI-C" function void pv_dump_pkt (
           input  int         phandle,   // active handler (port) to dump pkt
           input  int         pkt_len,   // length of packet
           input  bit [7:0]   in_pkt[],  // Packet array
           input  bit [63:0]  nstime);   // simulation time in ns

//  Dump a packet to an active dumper
import "DPI-C" function void pv_get_pkt (
           input  int         phandle,   // active handler (port) to dump pkt
           output int         pkt_len,   // length of packet
           output bit [7:0]   in_pkt[],  // Packet array
           output bit [63:0]  nstime);   // simulation time in ns

//  Shutdown a dumper after use
import "DPI-C" function void pv_shutdown (
           input  int         phandle);  // active handler (port) to shutdown 

module pcap_tb();
// local defines
int phandle, phandle2, pkt_len;
bit [7:0]    pkt [2000];
bit [7:0]    p_pkt [];
bit [63:0]   sm_time;
int          i = 0;

  initial
  begin // {
    // register pcap handle
    pv_register ();

    // open pcap handle for reading
    pv_open (phandle, "sample-capture.pcap", 1);
    
    // open pcap handle for writting
    pv_open (phandle2, "sample-dump.pcap", 0);
    

    // get first pkt from phandle
    pv_get_pkt (phandle, pkt_len, pkt, sm_time);
    while (pkt_len != 0)
    begin // {
	// new pktlib for unpack
        p_pkt = new [pkt_len] (pkt);

        // display hdr and pkt content
        $display("%0t : INFO    : TEST      : Unpack Pkt %0d", sm_time, i+1);
        display_array8 (p_pkt, "", "NO", 1);
        i++;
        
        // dump pcap 
        pv_dump_pkt (phandle2, p_pkt.size, p_pkt, sm_time);

        // get all pkt from phandle
        pv_get_pkt (phandle, pkt_len, pkt, sm_time);
    end // }
    // end simulation
    pv_shutdown (phandle2);
    $finish ();
  end // }

  task display_array8 (bit [7:0]        data [],
                       string           hname       = "", // string literals
                       string           usr_comment = "NO",
                       int              mode        = 0,
                       int              n_atend     = 1); // {
    $sformat (hname, "%16s", hname); 
    for (int i = 0; i < 16 ; i++)
    begin // {
        if (i % 16 == 0)
            $write ("%s :       %2d ", hname, i);
        else if (i % 16 == 7)
            $write ("%3d |", i);
        else if (i % 16 == 15)
            $write ("%3d\n", i);
        else
            $write ("%3d", i);
    end // }
    $write ("%s :        ~~~~~~~~~~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~~~~~~~\n", hname);
    for (int i = 0; i < data.size(); i++)
    begin
        if (i % 16 == 0)
            $write ("%s : %4d : ", hname, i);
        $write ("%x ", data[i]);
        if (i % 16 == 7)
            $write ("| ");
        if (i % 16 == 15)
            $write ("\n");
    end
    if (data.size() % 16 !== 0)
        $write ("\n");
    $write ("%s :        ~~~~~~~~~~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~~~~~~~\n", hname);
    if (mode)
        $write ("%s : (Total Len  = %0d)\n", hname, data.size());
    repeat (n_atend)
       $write ("\n");
  endtask : display_array8 // }
  
endmodule

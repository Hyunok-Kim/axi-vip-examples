all:
	xsc pcap_dpi.c pcap_dump.c -o pcap_dpi --gcc_link_options "-lpcap"
	@rm -fr xsc.* xsim.dir

clean:
	@rm -f pcap_dpi.so

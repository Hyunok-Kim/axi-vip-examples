set scripts_vivado_version "2021.2"
set current_vivado_version [version -short]

# Uncomment the line below to generate the final project
#set final 1
 
if { [string first $current_vivado_version $scripts_vivado_version] == -1 } {
   puts "The version $current_vivado_version is not supported. Supported versions are $scripts_vivado_version"
   return 1
}

 if {[info exists final]} {
	set file_path final
} else {
	set file_path src
}

# Configuration - Can be modified by the user
set project_name 				pcap_sim
set BD_name                                     design_1

# Create a new project
create_project $project_name ./$project_name -part xc7z020clg484-1
set_property target_language Verilog [current_project]

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
# Add hdl files
#add_files -fileset sources_1 -norecurse -scan_for_includes ./$file_path/hdl
#import_files -fileset sources_1 -norecurse ./$file_path/hdl
#import_files -norecurse ./$file_path/others/*

# Create 'constrs_1' fileset (if not found)
#if {[string equal [get_filesets -quiet constrs_1] ""]} {
#  create_fileset -constrset -quiet constrs_1
#}

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}
set_property -name {xsim.elaborate.xelab.more_options} -value {-sv_lib pcap_dpi} -objects [get_filesets sim_1]
# Add simulation files
add_files -fileset sim_1 -norecurse -scan_for_includes ./$file_path/sim
import_files -fileset sim_1 -norecurse ./$file_path/sim
import_files -fileset sim_1 -norecurse [glob -nocomplain ./src/others/*]
import_files -fileset sim_1 -norecurse ../common/pcap_dpi/pcap_dpi.so ../common/pcap_dpi/pcap_dpi.sv


set design_name         $BD_name

# Build the Block Design
if { [string first $current_vivado_version "2021.2"] != -1 } {
        source ./$file_path/tcl/bd.tcl
}

# Validate the BD
regenerate_bd_layout
validate_bd_design
save_bd_design

#Generate the wrapper
make_wrapper -files [get_files ${BD_name}.bd] -top

# Add the wrapper to the fileset
set obj [get_filesets sources_1]
set files [list "[file normalize [glob "./$project_name/$project_name.gen/sources_1/bd/$BD_name/hdl/${BD_name}_wrapper.v"]]"]
add_files -norecurse -fileset $obj $files

set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1
set_property top pcap_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1


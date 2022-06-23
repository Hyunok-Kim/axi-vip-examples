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

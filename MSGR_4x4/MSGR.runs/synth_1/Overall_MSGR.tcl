# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Vivado_Projects/MSGR/MSGR.cache/wt [current_project]
set_property parent.project_path D:/Vivado_Projects/MSGR/MSGR.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:arty-z7-20:part0:1.0 [current_project]
set_property ip_output_repo d:/Vivado_Projects/MSGR/MSGR.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/IAM.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/MSGR.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/boundary_cell.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/bs_boundary_cell.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/bs_internal_cell.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/internal_cell.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/reg.vhd
  D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/new/Overall_MSGR.vhd
}
read_ip -quiet D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter/Counter.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter/Counter_ooc.xdc]

read_ip -quiet D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_ADDER/FP_ADDER.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_ADDER/FP_ADDER_ooc.xdc]

read_ip -quiet D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_MULT/FP_MULT.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_MULT/FP_MULT_ooc.xdc]

read_ip -quiet d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter_6/Counter_6.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter_6/Counter_6_ooc.xdc]

read_ip -quiet d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter_13/Counter_13.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/Counter_13/Counter_13_ooc.xdc]

read_ip -quiet D:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_DIVIDE/FP_DIVIDE.xci
set_property used_in_implementation false [get_files -all d:/Vivado_Projects/MSGR/MSGR.srcs/sources_1/ip/FP_DIVIDE/FP_DIVIDE_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Overall_MSGR -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Overall_MSGR.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Overall_MSGR_utilization_synth.rpt -pb Overall_MSGR_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

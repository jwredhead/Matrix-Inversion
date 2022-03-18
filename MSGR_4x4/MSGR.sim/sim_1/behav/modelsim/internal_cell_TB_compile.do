######################################################################
#
# File name : internal_cell_TB_compile.do
# Created on: Tue Apr 02 20:30:18 -0500 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_9
vlib modelsim_lib/msim/axi_utils_v2_0_5
vlib modelsim_lib/msim/xbip_pipe_v3_0_5
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_5
vlib modelsim_lib/msim/xbip_dsp48_multadd_v3_0_5
vlib modelsim_lib/msim/xbip_bram18k_v3_0_5
vlib modelsim_lib/msim/mult_gen_v12_0_14
vlib modelsim_lib/msim/floating_point_v7_1_7
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_9 modelsim_lib/msim/xbip_utils_v3_0_9
vmap axi_utils_v2_0_5 modelsim_lib/msim/axi_utils_v2_0_5
vmap xbip_pipe_v3_0_5 modelsim_lib/msim/xbip_pipe_v3_0_5
vmap xbip_dsp48_wrapper_v3_0_4 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_5 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_5
vmap xbip_dsp48_multadd_v3_0_5 modelsim_lib/msim/xbip_dsp48_multadd_v3_0_5
vmap xbip_bram18k_v3_0_5 modelsim_lib/msim/xbip_bram18k_v3_0_5
vmap mult_gen_v12_0_14 modelsim_lib/msim/mult_gen_v12_0_14
vmap floating_point_v7_1_7 modelsim_lib/msim/floating_point_v7_1_7
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -64 -93 -work xbip_utils_v3_0_9  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work axi_utils_v2_0_5  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_pipe_v3_0_5  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_dsp48_wrapper_v3_0_4  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_dsp48_addsub_v3_0_5  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_dsp48_multadd_v3_0_5  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_bram18k_v3_0_5  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work mult_gen_v12_0_14  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -64 -93 -work floating_point_v7_1_7  \
"../../../../MSGR.ip_user_files/ipstatic/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -64 -93 -work xil_defaultlib  \
"../../../../MSGR.srcs/sources_1/ip/FP_DIVIDE/sim/FP_DIVIDE.vhd" \
"../../../../MSGR.srcs/sources_1/ip/FP_ADDER/sim/FP_ADDER.vhd" \
"../../../../MSGR.srcs/sources_1/ip/FP_MULT/sim/FP_MULT.vhd" \
"../../../../MSGR.srcs/sources_1/new/internal_cell.vhd" \
"../../../../MSGR.srcs/sources_1/new/reg.vhd" \
"../../../../MSGR.srcs/sim_1/new/internal_cell_TB.vhd" \

quit -force


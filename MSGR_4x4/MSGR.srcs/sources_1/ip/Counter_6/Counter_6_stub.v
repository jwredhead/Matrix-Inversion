// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 21:14:20 2019
// Host        : Isengard running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top Counter_6 -prefix
//               Counter_6_ COUNTER_6_stub.v
// Design      : COUNTER_6
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.3" *)
module Counter_6(CLK, CE, SCLR, THRESH0, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,THRESH0,Q[2:0]" */;
  input CLK;
  input CE;
  input SCLR;
  output THRESH0;
  output [2:0]Q;
endmodule

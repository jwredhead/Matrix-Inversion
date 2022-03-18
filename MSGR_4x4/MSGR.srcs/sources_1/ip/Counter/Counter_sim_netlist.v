// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Apr  3 14:29:24 2019
// Host        : Isengard running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Counter -prefix
//               Counter_ Counter_sim_netlist.v
// Design      : Counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Counter,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module Counter
   (CLK,
    CE,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "111" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "111" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_c_counter_binary_v12_0_12 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "111" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "111" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Counter_c_counter_binary_v12_0_12
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [3:0]L;
  output THRESH0;
  output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "111" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "111" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_c_counter_binary_v12_0_12_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
INaBf8vh5mCmDzf2yp77pxZAxQdyEQiT/vG2dEgvrFjseUnGc6ldwH4JvdnpZSpdf/ihioPyMNjl
u6ooyzv5TA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
S5XIZZtuFR/MZffuhwdnvE3H9oRWM4uXoaGZTa/Dyk62O+Wa0v41pjmZELCiR7uodZPFQfykZ6K9
2ZDMu8dB3afQRMs5lnd/53M1b9ke+MNEeZ/wzjUcsJghubnEAwzdWeW/0tlqST1WD9B/KCxYqwH5
Gj6IZTTFHAXcaVhnCT8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CM6IcdzP0PbD6yMSqylmi4JE2qpmxiNeI+prjGwJiD8e3Xsynu3PbGKJAOpOxtR1hT/3mpBcx1Rz
Fkz0QBh4wtE8fiziv1i+xi8T6cqC8ClamjrpZ//sn6dh7NvwSYik14MlwVuei4DZoZJZF63aoPUn
RXkQ13wtK+MkYKBcPVSZMFZmaCU6jMMBYclXzvRG1JqqZoa7mWFTeFZePUTXG7Wo12QaZ8GUi0AV
UIshoN25yn5e2Xr3FyuEtm5AvsZb+iLsgLeHBtKBnsVaHQphicgqwgwv6MQQF6ZNBgU/aACfibDS
3+n/mMMm8k1cj2bW6VCi7a+c8LmCf81NlJuLww==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ehl0CusS7+JNGq6HfhyaBMy68nccIdIGqixoEztEZfkCpXuUYsdqw6G9MIJdWdu0Ck2acV7K6IVg
rzb8/bNaDDVWp48kupToegTkOdwDkCejEqppido4BkJ+iEkjPniz+aJHlOlOwmauETy2hCMuuC57
oWDprzGWlsqbCjqzKrXmPYm6fNdcOa2DiOYstQaMFNbPU2ccrbLJAiYMHNDqtPNqWxKBsD67kiGf
2eOneDOmdmy7YkNsL+cx8MJc3BVUsYBrpAEsGyFMkmX8a8nYz8R/wlFQFGQAd/t5XrfxFNI58mj1
AHXbcAMhGKVq9YdKeU/vSXY/NwMqp12xJ1nUaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
h/qRAwiPuqY/Zg/QWqbaYm8xWTi9SshYuPzyL0UME9ZDDF+C2CyGAugh9HzMdD0kZmT94TKmBgLR
dKP28nlE8VCCU5rvbjKxfn/wNtNKHCvZ1hns8CF7+pGuelhxGvXNmYKFw5co8+4grYFaDXeoZZR6
S5sjvhqtSVD3+qq4vYWRjT2Y/yes7L9dRsLq2D3iZ4xjgVHuIbOQLT/EUKW+9iYudT9Uy6YTwB+5
mSb0QK3YfZdGwZyXB4S3mdF9vNQHdW/rnACq3yngF+lprNkh3ooQKdGqtxtz8KSQxNZOAFE+koOw
h00o7AKpvDAp3uNguLvnNJH3rugOhh95b8Jatw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
TsA04vIYHDZne2CBj5bWCBFH4MtNoFDCn/3DNEi0BwutuUf+X+lD9kAO3kl352WHjQbF79Ssm+PT
fCYpODgWdxSVbzaHFpITxCQ4HcIJhUeW5PC5tw09Tand68D6eg84qRguH+llbb5jdGJkJeTCf+Mx
pupkkLiDvNyTYWe+nqw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rx9hgQkvaJJTJJcTjGFW1DrrWiT+xanrcMvFn0Z3KRXlZvf+SE7IQgGCiP7ZDA6T5z1Zv5nzS4h5
cVi+CvwC9UMZRWmLDAjzASJ2nx1g9BjbYe2vHAUmyurIiR6LSigTeM/9TlMv+fFwJbqwuH6FJ3/z
Vl4tIMk4NrqkMn/riOG87SjhesepM6kcQOBgDGzLTG14z3qeZG8OPzxgApfyubmX4qdD1oTgGm2u
Q4mQfFxEye6Jqkn4Rzjhifs/ieNYomHlK7R2/72QJj5j0WyYBIhvO+09izz299Z54ZP2ZXaRMfDT
lU4lQNqQU14PX9Yk9p7sy2PnK4vTwwF0CFIgSQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bahp29vEByAEKWJ5LsM9dGzvW7qiirUrPhSL5koPBadyxfqxshv9gCR6V/NKWVBUVCieBEEjMUTJ
stDJJi3zzZbx/i8UjEGP2qQ7ldzXtUSHH/OfIh4x4Pn/x7W/x7Dc44234zmpTPQALe+lf2KmPdXL
5O+aPwN3bfw9+P21giqVa0eGLYSqA3/sLxTUoN28Fhg0AU5vjWzNHvZkj9DNRUaUg8v/FcHkaBMC
Y52pngk9svA63KN87KXFbkrL0uImbyrdsyGRZbaclw5ZLTn8T+OTqjHBofgiZbeoI/31fZWtcnVF
rsaDc92zWf3Em3wGw4fCWooQsramYhK+xOn/eQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rxbdFG1xdbWfx/HYgogDF0WaFnHFTcCbbmaE9E00Q2GVGvgkoHUau44OP/Z84hr3snoPoBRsXQph
CrtT7dWFJwcJ1rrOiKIR2DsvgWfLb6KuTYs4rtT89QGcjAVsVTZ2WezxG0wstQz1uij9LLe6q8Yj
iM2mTr4sbpoiALiUKGrlHwdRY7MjWYQ/+ZGPdTGKgtFCANR5vUP9v2Qb86wg9YNPIsc4fVr17bQ7
pSu3Ea4hQJdZmy5VXGR8+rSIARXP9NgojjORZwOZSw+2ZuFLO7jNLBgnXd47n5uuJ7fR7KP3+Haj
M5HrmZHZcauj2StO7yxg9mL8JNi3Ci/wck7PWg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6096)
`pragma protect data_block
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
HVbEoFCRQcDgT2c8
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 21:06:23 2019
// Host        : Isengard running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Counter_13 -prefix
//               Counter_13_ Counter_11_sim_netlist.v
// Design      : Counter_11
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Counter_11,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module Counter_13
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
  (* c_count_to = "1101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_13_c_counter_binary_v12_0_12 U0
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
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1101" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1101" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Counter_13_c_counter_binary_v12_0_12
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
  (* c_count_to = "1101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_13_c_counter_binary_v12_0_12_viv i_synth
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
rF7t0ZvTiF2Vv8HdnAjJVxNXm6Iw/6IsjXip4Nzro8g+NR7467nj/jU1BS3P6rqYXDTF4ZvYWLEC
LylNGSF0xnc0+OXXNoab0jVoL4kV9DfBzffcmJHNNIPs+JF7kdJyDuzvkra6AdcpiWBkNAFgUwD6
YCB9kpBSGZ6dpdr24DApYlhxstiFQAuS0RncyLjp4B07j5sEvW+csn5L/jM14iboIwcXGHuFH6a9
NvoVrXdaLN4BhAqdqO9CJcuv3e9lUOCVef5jTws8d/+6bkdVaPX76bIqvBohGjzr4V3sjXSJwnDD
fnlw7x110lz5mmxp1DajF7TrUpaQ2w34FbyLlg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u+4yIfjMTaB5JDaWtUmNUhpWQQ7ptFNQqr+JITsd2Vpu5TiDjaYxoZhJb2jf6hmwpK/uhy2WANX+
iWPhwpiMdsyQYkBkUVXUk3GbTiCXl6wqQv+TEYyEGHF3Sv4ptCRCATNK602ThyuT3ZDqrpB7cdHm
6HLd6r5br2Jp/tJ6C7lPoLG0LfwJg6QMUVL9PLPL46mlE9lSVZ6TUGTbdLFvPkg1EayJf8dRf7BR
sX5L8jSL0Gp8owaj8JUBJ0MjfIW/w/BuQPzBhmeWS5BTjn2O6ZEtlt/kUGVq/IZm3qaAFWtZjGba
70vKfWIip5NsCWmueN4akjaWWdJknA+Cas9+Kw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6096)
`pragma protect data_block
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
Md3x
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

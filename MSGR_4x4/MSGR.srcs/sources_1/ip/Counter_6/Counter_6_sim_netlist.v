// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 21:14:20 2019
// Host        : Isengard running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Counter_6 -prefix
//               Counter_6_ COUNTER_6_sim_netlist.v
// Design      : COUNTER_6
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "COUNTER_6,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module Counter_6
   (CLK,
    CE,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [2:0]Q;

  wire CE;
  wire CLK;
  wire [2:0]Q;
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
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "110" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "110" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_6_c_counter_binary_v12_0_12 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "110" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "110" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "3" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Counter_6_c_counter_binary_v12_0_12
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
  input [2:0]L;
  output THRESH0;
  output [2:0]Q;

  wire CE;
  wire CLK;
  wire [2:0]Q;
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
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "110" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "110" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Counter_6_c_counter_binary_v12_0_12_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0}),
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
aD4qytgPPSnaAt2ZVDEww+ZcQs60pyj+NjgXPCDc4mt0bGzomXio3A4OPg8LJiqH+9K4Low0cEAT
pprSss9eA49Rc8WZZVb6FDBV3tvIQyn1W2vWo4pwnbYas70KFFX5kkDLc8sztsT7ccX0iPAasUcy
+FKArbZDvgbvVPZ5A32MO6VhlifuT4CvcY5Lqama78YBSrg8seIJYrmoqfzlAW3qUoJQc4DNmCkJ
I7M0Kk40QjU1Tk+Nwobm9BLi0aq9V+3VjC4q19YHkRh9NXYr2PR+ZeBOYPqmfY0MBXl5RQmpZg+R
2PtWXZG9xVWXuo7LGDGZpLVn9XfJ2W4pQklcjA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZpJ2NyZz7IsYEa+5yixeBHO2pcu7RiX1T/MtW3PutWTDMcLZZY3L1uHKiaxKKnwoYqj5mPKPtodQ
W+/FLU+vQCTR8YxgWsrmD80Yqo5je+pYgMLkaMvTOVWcWnkakzObcwymMjqOUFtMnduPKSjQQURA
XMfyDjh6kliLSU9iLhwekO2zlSyhhHSgR03Ligvox9ark7FyNFmqwyFJMlf8jg9VdiI9s3XBtMgz
nMosLOUuS5hy2yJg14WahuSClI81NwQlvcj/+41Pq8YngZ5hsNOF0WiWjN6+nbLTQEdpJuo6rUkW
d76ici80Yefqp10F/6Y+K69oQdecGlKsb2TabQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6288)
`pragma protect data_block
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
oi1dxWqzUYo=
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

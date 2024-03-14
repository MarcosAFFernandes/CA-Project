////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: PerifericoEntrada_synthesis.v
// /___/   /\     Timestamp: Mon Mar 11 16:58:14 2024
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim PlacaMae.ngc PerifericoEntrada_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: PlacaMae.ngc
// Output file	: C:\Xilinx\14.7\ISE_DS\ISE\CA-Project\netgen\synthesis\PerifericoEntrada_synthesis.v
// # of Modules	: 1
// Design Name	: PlacaMae
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module PlacaMae (
  reset, clock, PIN, POUT
);
  input reset;
  input clock;
  input [7 : 0] PIN;
  output [7 : 0] POUT;
  wire POUT_7_OBUF_0;
  GND   XST_GND (
    .G(POUT_7_OBUF_0)
  );
  OBUF   POUT_7_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[7])
  );
  OBUF   POUT_6_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[6])
  );
  OBUF   POUT_5_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[5])
  );
  OBUF   POUT_4_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[4])
  );
  OBUF   POUT_3_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[3])
  );
  OBUF   POUT_2_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[2])
  );
  OBUF   POUT_1_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[1])
  );
  OBUF   POUT_0_OBUF (
    .I(POUT_7_OBUF_0),
    .O(POUT[0])
  );
endmodule


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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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


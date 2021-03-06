// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri May 10 16:03:56 2019
// Host        : Jhon-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Jhon/Desktop/Prova/Prova.srcs/sources_1/ip/ROMxul/ROMxul_stub.v
// Design      : ROMxul
// Purpose     : Stub declaration of top-level module interface
// Device      : xa7a35tcpg236-1I
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *)
module ROMxul(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[6:0],d[26:0],clk,we,spo[26:0]" */;
  input [6:0]a;
  input [26:0]d;
  input clk;
  input we;
  output [26:0]spo;
endmodule

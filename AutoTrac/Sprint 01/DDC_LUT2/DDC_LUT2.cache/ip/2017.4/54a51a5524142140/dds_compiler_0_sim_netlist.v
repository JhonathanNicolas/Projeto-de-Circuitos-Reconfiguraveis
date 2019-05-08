// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri May  3 14:01:22 2019
// Host        : Jhon-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_15,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    s_axis_config_tvalid,
    s_axis_config_tdata,
    m_axis_phase_tvalid,
    m_axis_phase_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, PHASE 0.000" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_CONFIG, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) input s_axis_config_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TDATA" *) input [15:0]s_axis_config_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_PHASE, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) output m_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TDATA" *) output [15:0]m_axis_phase_tdata;

  wire aclk;
  wire [15:0]m_axis_phase_tdata;
  wire m_axis_phase_tvalid;
  wire [15:0]s_axis_config_tdata;
  wire s_axis_config_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_data_tvalid_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [11:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [11:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [11:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "12" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "0" *) 
  (* C_HAS_M_PHASE = "1" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "1" *) 
  (* C_HAS_SINCOS = "0" *) 
  (* C_HAS_S_CONFIG = "1" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "1" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "16" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "3" *) 
  (* C_PHASE_ANGLE_WIDTH = "3" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "110100011011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_15 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[11:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[11:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[11:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(NLW_U0_m_axis_data_tdata_UNCONNECTED[0]),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(NLW_U0_m_axis_data_tvalid_UNCONNECTED),
        .m_axis_phase_tdata(m_axis_phase_tdata),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule

(* C_ACCUMULATOR_WIDTH = "12" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "1" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "0" *) (* C_HAS_M_PHASE = "1" *) 
(* C_HAS_PHASEGEN = "1" *) (* C_HAS_PHASE_OUT = "1" *) (* C_HAS_SINCOS = "0" *) 
(* C_HAS_S_CONFIG = "1" *) (* C_HAS_S_PHASE = "0" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "1" *) (* C_MEM_TYPE = "2" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "1" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "16" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "2" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "3" *) 
(* C_PHASE_ANGLE_WIDTH = "3" *) (* C_PHASE_INCREMENT = "1" *) (* C_PHASE_INCREMENT_VALUE = "110100011011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_15
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [0:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [15:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [0:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [15:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [11:0]debug_axi_pinc_in;
  output [11:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [11:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire [11:0]\^m_axis_phase_tdata ;
  wire m_axis_phase_tvalid;
  wire [15:0]s_axis_config_tdata;
  wire s_axis_config_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tvalid_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_s_axis_config_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [11:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [11:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [11:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [14:11]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[11] = \<const0> ;
  assign debug_axi_pinc_in[10] = \<const0> ;
  assign debug_axi_pinc_in[9] = \<const0> ;
  assign debug_axi_pinc_in[8] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[11] = \<const0> ;
  assign debug_axi_poff_in[10] = \<const0> ;
  assign debug_axi_poff_in[9] = \<const0> ;
  assign debug_axi_poff_in[8] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[11] = \<const0> ;
  assign debug_phase[10] = \<const0> ;
  assign debug_phase[9] = \<const0> ;
  assign debug_phase[8] = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_config_tlast_missing = \<const0> ;
  assign event_s_config_tlast_unexpected = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_missing = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tdata[0] = \<const0> ;
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_data_tvalid = \<const0> ;
  assign m_axis_phase_tdata[15] = \^m_axis_phase_tdata [11];
  assign m_axis_phase_tdata[14] = \^m_axis_phase_tdata [11];
  assign m_axis_phase_tdata[13] = \^m_axis_phase_tdata [11];
  assign m_axis_phase_tdata[12] = \^m_axis_phase_tdata [11];
  assign m_axis_phase_tdata[11:0] = \^m_axis_phase_tdata [11:0];
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign s_axis_config_tready = \<const1> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ACCUMULATOR_WIDTH = "12" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "0" *) 
  (* C_HAS_M_PHASE = "1" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "1" *) 
  (* C_HAS_SINCOS = "0" *) 
  (* C_HAS_S_CONFIG = "1" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "1" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "16" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "3" *) 
  (* C_PHASE_ANGLE_WIDTH = "3" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "110100011011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "16" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_15_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[11:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[11:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[11:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(NLW_i_synth_m_axis_data_tdata_UNCONNECTED[0]),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(NLW_i_synth_m_axis_data_tvalid_UNCONNECTED),
        .m_axis_phase_tdata({\^m_axis_phase_tdata [11],NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[14:11],\^m_axis_phase_tdata [10:0]}),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata({1'b0,1'b0,1'b0,1'b0,s_axis_config_tdata[11:0]}),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_i_synth_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
R7Su66EFP3j7HdSRwT0ufavHZ21RJuR7GdMa5N1qrx05vZRLzNZT/TrlIe3c6DsFCenpiZCD2noZ
QAoR4Rt+mA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CMEJWch+GbdZ7DIDA14J94rfET0XyGxfytAfvkgCwK+buy8C6yPuTyczckBiUAmLYwq3N0YLZZjn
gsyXn6e48OgTdLuKlj0b1I+R+nOfWP/cHyUHpk91Upohu0q4i+T1Z7YlZ2KevK2O/yOn6S3pNXlM
CA1hIxQSQLLJQcJjXBI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IDWChuOHJQwebqfYcE88tSCCIBnxLv1aLHU6OnUVlxJuAYH1Wr0uPmJkkVb7CXm2iZXQx/jo6XaT
TumCKxTZIL3ET0tLNKmedouL0GaXfUzXVCSzEoTXiWf2gNPQB6+v0sryyUdggn9CbJglWE9UkluW
rCPI7feYIVKqODl/+/XlmC+0ONTNrMlZjktMivGmmfgFiOaVxlj7ZiVhYDRk2pmK7N0SbS8Yhqtp
tu4XIZyivSAfozOEYzRk3aC5YLPqYEODky8fadXC0TifmV1/9ihpE9MdNVbsAfiU6jAuYaPtixy1
eWfPyz8p770Y8aO4Ymmlv6Cov/zwD1Zr7rP3ng==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4tWnXwgYbtbYBATOz3rKT5u236p/210UA0/0NawJUvRuLLRIOY863EXCqmoNKd3cdAJGfRGO/fA
mX3MQnn8fORd5NV0Drcjtq7LVURk4LrUaNUiho8FoaaKgENLoHWz5zN6jL9cfE19cPf5q6X+HSoS
vhMpVULwvEeloyESsidHnjc6Leo2s08QmBHWIJ4gX6Y353OK7qNS3bZaZnw5UMLbMBvsopLT0HMU
QgsF83OsAoA/LETx2kFpFT62GHW7Xr0WQupO68ddkWdncI1pQ1ry5DiS4IAcjHmDYTyo542wmUO5
kUoT65xdo6CgR0mBfndpvcIfOPFrzBLsA3X/8A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TYxxwxeYhuHcZvmvIoDp6PM6jwmqvK/EOpQJuzYEJwksrBgERfR0MxeEKttmbgtW3IAljWYtUY74
488K1yihiHHoprJ33R35ZxUze+TipXVo/GLAiCGp6aVvDPTACRhogMPXLJypmeRU1yO394pPbgS6
wC0P27Oimz3cJkJrwIhG7UV3FbbvFXVTh6Lp9wme459SE3zFnKsJYjUpffIirIVsuN+DETk1csWY
DA9UX9JySwER9tWjcgC7RtzEV1hjIG9WuwYm3zkOqr4FZ/dkK9PLm51AgWpaMXgB/7ws+/P8fkKm
QNdT6izgEuqxwJScjWNpExqD7cRIM9y2FibGuA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Y058Y7qqyKaMCwzJEnFzRJA1mSsdLWRJPV8jeagM24nQRyHL6Of41SQjwa7S6UfHPjaxh3kStD/R
iqFSj7BMeRnjDwKkql9QbQCQ1AEtG8kKMw6X1Sw8vQdkSSWaY8A0qHxlAj9yFFRWps0IUCT20y4r
a1FWV0KSxSpJrwls87U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BkCcTwW7IOFCvnzvt27BUy3KHmy1QJwSQsGYOAQoWdJnp7bpQCB3MV/YrDTHZ6GeuEjTv+Y4jK1+
AUi7wPge8Y2zeEpQSTFjwsHrg0a6KicpWuoUxj9ZsRjp7lihT95V1Q0eAIg8YhlL39mGtTcQ5Vdp
7z8wKvjx++phq/T2pWg3qojhz3yoqaCG4uvKWuNn2R3f0YfPc7K1qQ8cRTBYuIfje99ZizVelHfv
/gPaALzJb7mtbJVe83NohlYy8IyL0cxXXClT+sW1XPYiN9k5NbywIoRmRDobstBVd3O4Ukd5mT3V
p/qjzuZHyCC/I/jJRQFyZvHI5rcbT8On+yp5MA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bTSIRtr5blzcXkHgUo3jseHqpHQcgWFiVxpN36rJQ4q1t4M8NwIVZgUestyh+YMo5q3ZwQQyA4JE
OlpkKYU6/MeekdsrQI/rRgY/EHupluQDRu9psfrXSfE4GOhbkzzpgW6w6pmulhJT3rObiYG5qIvP
yv7ln8FMnB24igiw/jxEtcx1ZqzR/DajZdVXYuGNECiVcZm6vb07OAe1C5iqIUavncjhqPqMknEI
dlRX/bhL45Nd6kS82xVCJZOGpQtKlRQlYRUqIh6pW3c4BpjrwQQR9b8WVIR+8/6x2Ams0x2aqfMR
TS7yczXA1V7QXqaZ9hNDdKDOI+XG9bonDS91/A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
al23iWtmmWEvRuq9s0R5XFb2r1rIioRWkCAj3giltez5/aXJLoOngLflqFi9sCxlHIyw4284moJI
GWeo/GP1NYsd3VtfhYhx/QQbvoM+fdu0q9c9hWHt+1ij8EGors+IoAT50aoGYeXJ5URWpZkXZpkl
o4PBalVqe+JZej1xdpfWDKpmQPk2e2sHb+KPcK/ROj492tuF8dBBkzgZnOjt9Ez4bbwm5a9SPAb4
is9dHAVDsOfz95EIWiw6NPwH+ojNueaqjdiZznrauTN57hyF5rPNRIjgkLkF7u/rFQ/mg2wtRI2p
jEInvEuFsUCw1hrg39WqHBY+FNonZ6B1AbsjDg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20464)
`pragma protect data_block
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
+w==
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

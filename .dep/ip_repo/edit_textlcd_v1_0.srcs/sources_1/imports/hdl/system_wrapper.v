//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Apr  6 17:28:06 2021
//Host        : LAPTOP-GREATHONEY running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    lcd_data_0,
    lcd_en_0,
    lcd_rs_0,
    lcd_rw_0,
    lcdclk_0,
    resetn_0);
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [7:0]lcd_data_0;
  output lcd_en_0;
  output lcd_rs_0;
  output lcd_rw_0;
  input lcdclk_0;
  input resetn_0;

  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [7:0]lcd_data_0;
  wire lcd_en_0;
  wire lcd_rs_0;
  wire lcd_rw_0;
  wire lcdclk_0;
  wire resetn_0;

  system system_i
       (.FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .lcd_data_0(lcd_data_0),
        .lcd_en_0(lcd_en_0),
        .lcd_rs_0(lcd_rs_0),
        .lcd_rw_0(lcd_rw_0),
        .lcdclk_0(lcdclk_0),
        .resetn_0(resetn_0));
endmodule

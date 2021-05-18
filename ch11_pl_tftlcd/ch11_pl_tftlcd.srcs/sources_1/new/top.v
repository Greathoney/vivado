module top (
 // Processor System
 inout [14:0]DDR_addr,
 inout [2:0]DDR_ba,
 inout DDR_cas_n,
 inout DDR_ck_n,
 inout DDR_ck_p,
 inout DDR_cke,
 inout DDR_cs_n,
 inout [3:0]DDR_dm,
 inout [31:0]DDR_dq,
 inout [3:0]DDR_dqs_n,
 inout [3:0]DDR_dqs_p,
 inout DDR_odt,
 inout DDR_ras_n,
 inout DDR_reset_n,
 inout DDR_we_n,
 inout FIXED_IO_ddr_vrn,
 inout FIXED_IO_ddr_vrp,
 inout [53:0]FIXED_IO_mio,
 inout FIXED_IO_ps_clk,
 inout FIXED_IO_ps_porb,
 inout FIXED_IO_ps_srstb,
 input TFTLCD_CLK,
 input TFTLCD_nRESET,
 output TFTLCD_TCLK, // TFT-LCD Clock
 output wire TFTLCD_Hsync, // TFT-LCD HSYNC
 output wire TFTLCD_Vsync, // TFT-LCD VSYNC
 output wire TFTLCD_DE_out, // TFT-LCD Data enable
 output [7:3] TFTLCD_R, // TFT-LCD Red signal
 output [7:2] TFTLCD_G, // TFT-LCD Green signal
 output [7:3] TFTLCD_B, // TFT-LCD Blue signal
 output TFTLCD_Tpower, // TFT-LCD Backlight On signal
 input [1:0] TFTLCD_SW
);
 wire BRAMCLK;
 wire [17:0] BRAMADDRA;
 wire [15:0] BRAMDATA;
 system_wrapper usystem_wrapper (
 .DDR_addr(DDR_addr),
 .DDR_ba(DDR_ba),
 .DDR_cas_n(DDR_cas_n),
 .DDR_ck_n(DDR_ck_n),
 .DDR_ck_p(DDR_ck_p),
 .DDR_cke(DDR_cke),
 .DDR_cs_n(DDR_cs_n),
 .DDR_dm(DDR_dm),
 .DDR_dq(DDR_dq),
 .DDR_dqs_n(DDR_dqs_n),
 .DDR_dqs_p(DDR_dqs_p),
 .DDR_odt(DDR_odt),
 .DDR_ras_n(DDR_ras_n),
 .DDR_reset_n(DDR_reset_n),
 .DDR_we_n(DDR_we_n),
 .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
 .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
 .FIXED_IO_mio(FIXED_IO_mio),
 .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
 .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
 .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb)
 );
 TFTLCDCtrl TFTLCDCtrl_i (
 .CLK(TFTLCD_CLK),
 .nRESET(TFTLCD_nRESET),
 .TCLK(TFTLCD_TCLK),
 .Hsync(TFTLCD_Hsync),
 .Vsync(TFTLCD_Vsync),
 .DE_out(TFTLCD_DE_out),
 .R(TFTLCD_R),
 .G(TFTLCD_G),
 .B(TFTLCD_B),
 .Tpower(TFTLCD_Tpower),
 .SW(TFTLCD_SW),
 .BRAMCLK(BRAMCLK),
 .BRAMADDR(BRAMADDRA),
 .BRAMDATA(BRAMDATA)
 );

 bufferram
 bufferram_i (
 .clka( TFTLCD_CLK ),
 .ena( 1'b1 ),
 .wea( 1'b0 ),
 .addra( BRAMADDRA ),
 .dina( 16'd0 ),
 .douta( BRAMDATA ));
endmodule
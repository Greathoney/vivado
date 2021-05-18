module top(
    input TFTLCD_CLK,
    input TFTLCD_nRESET,
    output TFTLCD_TCLK,
    output wire TFTLCD_Hsync,
    output wire TFTLCD_Vsync,
    output wire TFTLCD_DE_out,
    output [7:3] TFTLCD_R,
    output [7:2] TFTLCD_G,
    output [7:3] TFTLCD_B,
    output TFTLCD_Tpower,
    input [1:0] TFTLCD_SW   );
    
    wire BRAMCLK;
    wire    [17:0]  BRAMADDRA;
    wire    [15:0]  BRAMDATA;
    
    TFTLCDCtrl  TFTLCDCtrl_i (
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
        .BRAMDATA(BRAMDATA)     );
    bufferram
    bufferram_i     (
        .clka( TFTLCD_CLK ),
        .ena( 1'b1 ),
        .wea( 1'b0 ),
        .addra( BRAMADDRA ),
        .dina( 16'd0 ),
        .douta( BRAMDATA ));
endmodule
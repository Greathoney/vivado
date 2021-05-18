module TFTLCDCtrl(
    input CLK,
    input nRESET,
    output TCLK,
    output reg Hsync,
    output reg Vsync,
    output DE_out,
    output [7:3] R,
    output [7:2] G,
    output [7:3] B,
    output Tpower,
    input [1:0] SW,
    output BRAMCLK,
    output [17:0] BRAMADDR,
    input [15:0] BRAMDATA);
    
    wire g2mclk;
    wire hclk;
    wire [9:0] H_COUNT;
    wire [9:0] V_COUNT;
    wire hDE;
    wire vDE;
    wire DEimage;
    wire RESET;
    wire Hsyncimage;
    wire Vsyncimage;
    wire [7:3] BRAM_R;
    wire [7:2] BRAM_G;
    wire [7:3] BRAM_B;
    wire [7:3] BAR_R;
    wire [7:2] BAR_G;
    wire [7:3] BAR_B;
    
    assign RESET = ~nRESET;
    assign Tpower = 1;
    assign TCLK = g2mclk;
    assign DE_out = 1'b1;
    assign DEimage = hDE & vDE;
    
    always@ (posedge g2mclk or posedge RESET)
    begin
        if (RESET)
        begin
            Vsync <= 1'b0;
            Hsync <= 1'b0;
        end
        else
        begin
            Vsync <= Vsyncimage;
            Hsync <= Hsyncimage;
        end
    end
    
    g2m a_g2m
        (
                    .CLK        (CLK),
                    .UP_CLK     (g2mclk),
                    .RESET      (RESET)
                    );
    
    horizontal b_horizontal
        (
                    .CLK        (g2mclk),
                    .UP_CLKa    (hclk),
                    .H_COUNT    (H_COUNT),
                    .Hsync      (Hsyncimage),
                    .hDE        (hDE),
                    .RESET      (RESET)
                    );
                        
    vertical c_vertical
        (
                    .CLK        (g2mclk),
                    .V_COUNT    (V_COUNT),
                    .Vsync      (Vsyncimage),
                    .vDE        (vDE),
                    .RESET      (RESET)
                    );
    
    rgb e_rgb
        (
                    .R          (BAR_R),
                    .G          (BAR_G),
                    .B          (BAR_B),
                    .H_COUNT    (H_COUNT),
                    .V_COUNT    (V_COUNT),
                    .DE         (DEimage),
                    .RESET      (RESET)
                    );
               
    BRAMCtrl f_BRAMCtrl
    (
        .CLK(g2mclk),
        .RESET(RESET),
        .Vsync(Vsyncimage),
        .Hsync(Hsyncimage),
        .DE(DEimage),
        .BRAMCLK(BRAMCLK),
        .BRAMADDR(BRAMADDR),
        .BRAMDATA(BRAMDATA),
        .R(BRAM_R),
        .G(BRAM_G),
        .B(BRAM_B),
        .Reverse_SW(SW[1])
    );

endmodule
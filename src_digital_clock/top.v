module top(
input	wire			resetn,
input	wire			clk,

output	wire	[7:0]	seg_en,
output	wire	[7:0]	seg_data,
output	wire			lcd_rs,
output	wire			lcd_rw,
output	wire			lcd_en,
output	wire	[7:0]	lcd_data
);

wire	[31:0]	segdata;
wire	[31:0]	textdata_a;
wire	[31:0]	textdata_b;
wire	[31:0]	textdata_c;
wire	[31:0]	textdata_d;
wire	[31:0]	textdata_e;
wire	[31:0]	textdata_f;
wire	[31:0]	textdata_g;
wire	[31:0]	textdata_h;


// Coding here!


endmodule


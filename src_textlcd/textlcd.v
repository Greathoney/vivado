module textlcd(
input	wire			resetn,			// reset
input	wire			lcdclk,			// clock
	
output	wire			lcd_rs,			// register selection
output	wire			lcd_rw,			// read / write
output	reg				lcd_en,			// lcd enable
output	wire	[7:0]	lcd_data		// data for CG / DDRAM
);

// data line for printing on text lcd
parameter	[31:0]	reg_a		=	32'h54_65_78_74;	// Text
parameter	[31:0]	reg_b		=	32'h2d_4c_43_44;	// -LCD 
parameter	[31:0]	reg_c		=	32'h20_43_6f_6e;	// Con
parameter	[31:0]	reg_d		=	32'h74_72_6f_6c;	// trol
parameter	[31:0]	reg_e		=	32'h53_75_63_63;	// Succ 
parameter	[31:0]	reg_f		=	32'h65_73_73_20;	// ess
parameter	[31:0]	reg_g		=	32'h53_6f_43_20;	// SoC
parameter	[31:0]	reg_h		=	32'h4c_61_62_20;	// Lab

// define mode
parameter	[3:0]	mode_pwron	=	4'd1;				// power on
parameter	[3:0]	mode_fnset	=	4'd2;				// function set
parameter	[3:0]	mode_onoff	=	4'd3;				// display on / off control
parameter	[3:0]	mode_entr1	=	4'd4;				// 
parameter	[3:0]	mode_entr2	=	4'd5;				// 
parameter	[3:0]	mode_entr3	=	4'd6;				// 
parameter	[3:0]	mode_seta1	=	4'd7;				// set addr 1st line
parameter	[3:0]	mode_wr1st	=	4'd8;				// write 1st line
parameter	[3:0]	mode_seta2	=	4'd9;				// set addr 2nd line
parameter	[3:0]	mode_wr2nd	=	4'd10;				// write 2nd line
parameter	[3:0]	mode_delay	=	4'd11;				// delay

reg		[10:0]	count_lcdclk;		// clock counter
reg		[5:0]	count_mode;			// mode state counter
reg		[3:0]	lcd_mode;			// mode state
reg		[9:0]	set_data;			// set data decoder

// enable signal
always@(posedge lcdclk or negedge resetn)
begin
	if(resetn == 1'b0) begin
		lcd_en <= 1'b0;
	end
	else begin
		//******************** 
		//
		//
		//
		// Coding here!
		//
		//
		//
		//********************
	end
end

// clock counter 
always@(posedge lcdclk or negedge resetn)
begin	
	if(resetn == 1'b0) begin
		count_lcdclk <= 11'd0;
	end
	else begin
		//********************
		// 
		// Coding here!
		//
		//
		//********************
	end
end

// mode state counter
always@(posedge lcdclk or negedge resetn)
begin
	if(resetn == 1'b0) begin
		count_mode <= 6'd0;
	end
	else begin
		//********************
		//
		//
		//
		//
		// Coding here!
		//
		//
		//
		//
		//********************		
	end
end

// mode state
always@(posedge lcdclk or negedge resetn)
begin
	if(resetn == 1'b0) begin
		lcd_mode <= mode_pwron;
	end
	else begin
		// mode change
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
end

// assign output
assign lcd_rs	=	set_data[9];
assign lcd_rw	=	set_data[8];
assign lcd_data	=	set_data[7:0];

// set data decoder 
always @(lcd_mode or count_mode or reg_a or reg_b or reg_c or reg_d or reg_e or reg_f or reg_g or reg_h)
begin 
	case(lcd_mode)
		mode_pwron	:	set_data = {2'b00, 8'h38};
		mode_fnset	:	set_data = {2'b00, 8'h38};
		mode_onoff	:	// Coding here!
		mode_entr1	:	// Coding here!
		mode_entr2	:	// Coding here!
		mode_entr3	:	// Coding here!
		mode_seta1	:	// Coding here!
		mode_wr1st	:
		begin
		
		
		
		 
		 
		
		
		 
		 
		
		
		 
		 
		
		
		
		
		
		end
		mode_seta2	:	set_data = {2'b00, 8'ha8};
		mode_wr2nd	: 
		begin
		
	
















		end
		default		:	set_data = {2'b00, 8'h02};
	endcase
end

endmodule


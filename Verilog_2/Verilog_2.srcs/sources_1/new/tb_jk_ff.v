`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/14 00:15:43
// Design Name: 
// Module Name: tb_jk_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_jk_ff();

reg     [2:0]   i;

reg             clk;
reg             rst_n;
reg             j;
reg             k;

wire            q;
wire            q_b;

parameter       PERIOD_100MHZ   =   10;
always begin
    #(PERIOD_100MHZ/2);
    clk <= ~clk;
end

jk_ff   jk_ff_u0    (   .clk(clk),
                        .rst_n(rst_n),
                        .j(j),
                        .k(k),
                        
                        .q(q),
                        .q_b(q_b)   );
 
 initial begin
    i       =   3'd0;
    clk     =   1'b0;
    rst_n   =   1'b0;
    j       =   1'b0;
    k       =   1'b0;
    #(PERIOD_100MHZ*2);
    rst_n   =   1'b1;
    
    for(i = 3'd0; i <= 3'd3; i = i + 3'd1) begin
        j   =   i[1];
        k   =   i[0];
        #PERIOD_100MHZ;
    end
    
    #PERIOD_100MHZ;
    
    rst_n   =   1'b0;
    #(PERIOD_100MHZ*2);
    
    $stop;

end

endmodule

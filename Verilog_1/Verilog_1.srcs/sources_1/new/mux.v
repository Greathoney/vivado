`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/11 16:54:51
// Design Name: 
// Module Name: mux
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


module mux(
input   wire    a,
input   wire    b,
input   wire    sel,

output  reg     out
);

always @(a or b or sel)
begin
    case(sel)
        1'b0    : out = a;
        1'b1    : out = b;
    endcase
end

endmodule

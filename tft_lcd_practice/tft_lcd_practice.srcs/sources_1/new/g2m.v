`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/29 16:58:36
// Design Name: 
// Module Name: g2m
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


module g2m(
    input CLK,
    input RESET,
    output reg UP_CLK
    );
    
    always@ (posedge RESET or posedge CLK)
    begin
        if (RESET == 1)
            UP_CLK <= 0;
        else
            UP_CLK <= ~UP_CLK;
    end
endmodule

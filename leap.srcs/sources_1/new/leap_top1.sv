`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 10:55:53
// Design Name: 
// Module Name: leap_top1
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


module leap_top1(
    input logic [15:0] SW,
    input logic CLK100MHZ,
    output logic [7:0] AN,
    output logic [6:0] A2G,
    output logic [15:0] LED,
    output logic LED16_R,
    output logic LED16_G
    );
    
    assign LED=SW;
    
    leap1 l1(.sw(SW),
             .red(LED16_R),
             .green(LED16_G)  );
             
    x7seg x1(.sw(SW),
             .clr(0),
             .clk(CLK100MHZ),
             .a2g(A2G),
             .an(AN),
             .dp(DP));
endmodule

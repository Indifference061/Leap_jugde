`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 10:58:36
// Design Name: 
// Module Name: Hex7Seg
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


module Hex7Seg(
    input   logic [3:0] x,
    output  logic [6:0] a2g ); 
 
    assign AN = 8'b00000000;
    assign DP = 1;     
    
    always_comb
        case (x) 
            'h0: a2g = 7'b0000001; 
            'h1: a2g = 7'b1001111; 
            'h2: a2g = 7'b0010010; 
            'h3: a2g = 7'b0000110; 
            'h4: a2g = 7'b1001100; 
            'h5: a2g = 7'b0100100; 
            'h6: a2g = 7'b0100000; 
            'h7: a2g = 7'b0001111; 
            'h8: a2g = 7'b0000000; 
            'h9: a2g = 7'b0000100; 
        default: a2g = 7'b1111111; 
        endcase 
endmodule

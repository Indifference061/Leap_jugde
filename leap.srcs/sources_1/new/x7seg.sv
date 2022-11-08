`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 10:58:16
// Design Name: 
// Module Name: x7seg
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


module x7seg( 
              input logic [15:0] sw,
              input logic         clr,
              input  logic        clk,
              output logic [6:0]  a2g,
              output logic [7:0]  an, 
              output logic        dp ); 
    
    logic [1:0] s;     
    logic [3:0] digit;
    logic [19:0] clkdiv;
    
    assign dp = 1;           
    assign s = clkdiv[19:18];  
    
    always_comb
        case(s)
            0:digit=sw[15:12];
            1:digit=sw[11:8];
            2:digit=sw[7:4];
            3:digit=sw[3:0];
            default: digit = 4'b0000;
        endcase
    
    //8个数码管的使能
    always_comb
        case(s)
            0: an=8'b1111_0111;
            1: an=8'b1111_1011;
            2: an=8'b1111_1101;
            3: an=8'b1111_1110;
            default: an = 8'b1111_1111;
        endcase
    
    // 时钟分频器（20位二进制计数器）
    always @(posedge clk)
      if(clr == 1) clkdiv<=0;
      else       clkdiv<=clkdiv+1;
    
    //实例化 7段数码管
    Hex7Seg s7(.x(digit), .a2g(a2g));    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 10:57:01
// Design Name: 
// Module Name: leap1
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


module leap1(
    input logic [15:0] sw,
    output logic red,
    output logic green
    );

    logic [15:0] sum;
    
    always_comb
        begin

            sum=sw[3:0]+sw[7:4]*10+sw[11:8]*100+sw[15:12]*1000;
            red=0;
            green=0;
            if((sum%400==0)||(sum%100!=0&&sum%4==0)) 
                begin
                    red=0;
                    green=1;
                end
            else 
                begin
                    red=1;
                    green=0;
                end
         end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 10:57:42
// Design Name: 
// Module Name: leap2
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


module leap2(
    input logic [15:0] sw,
    output logic red,
    output logic green
    );
    logic ans;
    logic D4;
    logic D100;
    logic D400;
    
    always_comb
        begin
            D4=((~sw[4])&(~sw[1])&(~sw[0]))|(sw[4]&sw[1]&(~sw[0]));
            D100=(~sw[7])&(~sw[6])&(~sw[5])&(~sw[4])&(~sw[3])&(~sw[2])&(~sw[1])&(~sw[0]);
            D400=D100&(((~sw[12])&(~sw[9])&(~sw[8]))|(sw[12]&sw[9]&(~sw[8])));
            ans=(D4&(~D100))|D400;
            case(ans)
                1'b1:
                    begin
                        red=0;
                        green=1;
                    end
                1'b0:
                    begin
                        red=1;
                        green=0;
                    end
                 default:
                    begin
                        red=0;
                        green=0;
                    end
            endcase
        end
endmodule

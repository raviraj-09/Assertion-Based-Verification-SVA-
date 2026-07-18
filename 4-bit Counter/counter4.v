`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 08:23:57 AM
// Design Name: 
// Module Name: counter4
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


module counter4(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
    );
    
    always @(posedge clk)
    begin
        if(reset)
            count <= 4'd0;
            
        else if(enable)
            count <= count + 1;
        
        else
            count <= count;
    end
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 08:27:26 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    
    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;
    
    counter4 dut (clk, reset, enable, count);
    counter4_assertion sva( clk, reset, enable, count);

    always #5 clk = ~clk;
    
    initial
    begin
    clk = 0;
    reset = 1;
    enable = 0;
    
    #10; reset = 0;
         enable = 1;
         
    #200; enable = 0;
    
    #30; 
    $finish;
    end
    
  
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 08:45:02 AM
// Design Name: 
// Module Name: counter4_assertion
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


module counter4_assertion(
    input clk,
    input reset,
    input enable,
    input [3:0] count
    );
    
    property RESET_CHECK;
        @(posedge clk)
        reset |=> (count == 0);
    endproperty
    
    assert property (RESET_CHECK)
        $display("Asserrtion 'RESET_CHECK' passed at time %0t.",$time);
    else
        $error("Assertion 'RESET_CHECK' Failed at time %0t.",$time);
        
        
    property INCREMENT_CHECK;
        @(posedge clk) 
        disable iff (reset)
      /*  enable |=> (count == (($past(count) == 4'd15) ?
                                 4'd0 : $past(count) +1)) ; */
        enable |=> count == $past(count) + 1;
        
    endproperty
    
    assert property(INCREMENT_CHECK)
        $display("Asserrtion 'INCREMENT_CHECK' passed at time %0t.",$time);
    else
        $error("Assertion 'INCREMENT_CHECK' Failed at time %0t.",$time);
    
    property HOLD_CHECK;
        @(posedge clk)
        disable iff (reset)
        !enable |=> count == $past(count);
    endproperty
    
    assert property (HOLD_CHECK)
        $display("Asserrtion 'HOLD_CHECK' passed at time %0t.",$time);
    else
        $error("Assertion 'HOLD_CHECK' Failed at time %0t.",$time);
    
    property OVERFLOW_CHECK;
        @(posedge clk)
        disable iff(reset)
        (count==15 && enable) |=> count == 0;
    endproperty

    assert property(OVERFLOW_CHECK)
        $display("Asserrtion 'OVERFLOW_CHECK' passed at time %0t.",$time);
    else
        $error("Assertion 'OVERFLOW_CHECK' Failed at time %0t.",$time);

    property ENABLE_CHECK;
        @(posedge clk)
        disable iff(reset)
        (count!=$past(count)) |-> $past(enable);
    endproperty

    assert property(ENABLE_CHECK)
        $display("Asserrtion 'ENABLE_CHECK' passed at time %0t.",$time);
    else
        $error("Assertion 'ENABLE_CHECK' Failed at time %0t.",$time);
    
    
endmodule

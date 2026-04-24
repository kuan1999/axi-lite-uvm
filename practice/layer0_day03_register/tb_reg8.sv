`timescale 1ns/1ps

module tb_reg8;
    logic       clk, rst_n, en;
    logic [7:0] d, q;
    
    reg8 dut (.clk(clk), .rst_n(rst_n), .en(en), .d(d), .q(q));
    
    // Clock: 10ns period
    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_reg8);
        
        // Init
        clk = 0; rst_n = 0; en = 0; d = 8'hAA;
        #12;  // Hold reset for > 1 clock
        $display("After reset:        q=%h (expect 00)", q);
        
        // Release reset, en=0, d=AA → q should stay 0
        rst_n = 1; en = 0; #10;
        $display("rst_n=1, en=0:      q=%h (expect 00, en disabled)", q);
        
        // Enable write: d=AA → q should become AA
        en = 1; d = 8'hAA; #10;
        $display("en=1, d=AA:         q=%h (expect AA)", q);
        
        // Disable, change d: q should hold AA
        en = 0; d = 8'h55; #10;
        $display("en=0, d=55:         q=%h (expect AA, hold)", q);
        
        // Enable again: q should become 55
        en = 1; #10;
        $display("en=1, d=55:         q=%h (expect 55)", q);
        
        // Sync reset test: pull rst_n low, q clears on next clock edge
        rst_n = 0; #10;
        $display("rst_n=0 (sync):     q=%h (expect 00)", q);
        
        $finish;
    end
endmodule

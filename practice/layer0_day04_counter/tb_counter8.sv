`timescale 1ns/1ps

module tb_counter8;
    logic       clk, rst_n, en, clr;
    logic [7:0] cnt;
    
    counter8 dut (.clk(clk), .rst_n(rst_n), .en(en), .clr(clr), .cnt(cnt));
    
    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter8);
        
        clk = 0; rst_n = 0; en = 0; clr = 0;
        #12;
        $display("After async reset:     cnt=%3d (expect 0)", cnt);
        
        rst_n = 1; en = 1; clr = 0; #30;
        $display("After 3 clks with en:  cnt=%3d (expect 3)", cnt);
        
        en = 0; #20;
        $display("After 2 clks en=0:     cnt=%3d (expect 3, hold)", cnt);
        
        en = 1; #50;
        $display("After 5 more clks:     cnt=%3d (expect 8)", cnt);
        
        clr = 1; #10;
        $display("After sync clr:        cnt=%3d (expect 0)", cnt);
        clr = 0;
        
        #40;
        $display("After 4 clks:          cnt=%3d (expect 4)", cnt);
        
        // Async reset: pull rst_n low, give time for propagation
        #3 rst_n = 0;
        #1;
        $display("Async reset mid-clk:   cnt=%3d (expect 0, no clock needed)", cnt);
        
        // Release reset, count from 0
        rst_n = 1; #1;
        en = 1;
        #10;
        $display("After 1 clk post-rst:  cnt=%3d (expect 1)", cnt);
        
        $finish;
    end
endmodule

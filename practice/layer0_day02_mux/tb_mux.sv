`timescale 1ns/1ps

module tb_mux;
    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y_case, y_ifelse;
    
    mux_case    dut_a (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .y(y_case));
    mux_ifelse  dut_b (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .y(y_ifelse));
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux);
        
        // Initialize inputs
        d0 = 8'hAA; d1 = 8'hBB; d2 = 8'hCC; d3 = 8'hDD;
        
        sel = 2'b00; #10;
        $display("sel=%b: y_case=%h y_ifelse=%h (expect AA)", sel, y_case, y_ifelse);
        
        sel = 2'b01; #10;
        $display("sel=%b: y_case=%h y_ifelse=%h (expect BB)", sel, y_case, y_ifelse);
        
        sel = 2'b10; #10;
        $display("sel=%b: y_case=%h y_ifelse=%h (expect CC)", sel, y_case, y_ifelse);
        
        sel = 2'b11; #10;
        $display("sel=%b: y_case=%h y_ifelse=%h (expect DD)", sel, y_case, y_ifelse);
        
        $finish;
    end
endmodule

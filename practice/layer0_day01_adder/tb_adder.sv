`timescale 1ns/1ps

module tb_adder;
    logic [3:0] a, b;
    logic       cin;
    logic [3:0] sum_a, sum_b;
    logic       cout_a, cout_b;
    
    adder_assign      dut_a (.a(a), .b(b), .cin(cin), .sum(sum_a), .cout(cout_a));
    adder_alwayscomb  dut_b (.a(a), .b(b), .cin(cin), .sum(sum_b), .cout(cout_b));
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_adder);
        
        a = 4'd3; b = 4'd5; cin = 0; #10;
        $display("3+5+0:   sum_a=%2d cout_a=%b | sum_b=%2d cout_b=%b", sum_a, cout_a, sum_b, cout_b);
        
        a = 4'd15; b = 4'd1; cin = 0; #10;
        $display("15+1+0:  sum_a=%2d cout_a=%b | sum_b=%2d cout_b=%b", sum_a, cout_a, sum_b, cout_b);
        
        a = 4'd15; b = 4'd15; cin = 1; #10;
        $display("15+15+1: sum_a=%2d cout_a=%b | sum_b=%2d cout_b=%b", sum_a, cout_a, sum_b, cout_b);
        
        a = 4'd0; b = 4'd0; cin = 0; #10;
        $display("0+0+0:   sum_a=%2d cout_a=%b | sum_b=%2d cout_b=%b", sum_a, cout_a, sum_b, cout_b);
        
        $finish;
    end
endmodule

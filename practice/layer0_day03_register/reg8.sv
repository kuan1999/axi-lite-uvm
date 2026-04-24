module reg8(
    input logic clk,
    input logic rst_n, en,
    input logic [7:0]d,
    output logic [7:0]q
);
    always_ff @(posedge clk) begin
        if (!rst_n) q <= 8'd0;
        else if(en==1) q <= d;
    end
endmodule
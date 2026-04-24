module counter8 (
    input  logic       clk,
    input  logic       rst_n,   // async
    input  logic       en,
    input  logic       clr,     // sync
    output logic [7:0] cnt
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt <= 8'd0;
        else if (clr) cnt <= 8'd0;
        else if (en) cnt <= cnt + 8'd1;
    end
endmodule
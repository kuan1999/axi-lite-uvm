module adder_alwayscomb (
    input logic [3:0]a, b, 
    input logic  cin,
    output logic [3:0]sum, 
    output logic cout
);
    always_comb begin 
        {cout, sum} = a + b + cin;
    end
endmodule
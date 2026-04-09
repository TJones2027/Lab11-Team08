module dff(
    input D,
    input clk,
    output reg Q,
    output Q_n
);
    initial begin
        Q <= 0;
    end

    always @(posedge clk) begin
        Q <= D;
    end

    assign Q_n = ~Q;

endmodule
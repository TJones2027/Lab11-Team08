module tff(
    input T,
    input clk,
    output reg Q,
    output Q_n
);
    initial begin
        Q <= 0;
    end

    always @(posedge clk) begin
        if (T) begin
            Q <= ~Q;
        end
        else begin
            Q <= Q;
        end
    end

    assign Q_n = ~Q;

endmodule

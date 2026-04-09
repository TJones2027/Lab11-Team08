module full_adder (
    input A, B, CIN,
    output CO, Y
);

assign Y = A ^ B ^ CIN;
assign CO = ( A & B) | (CIN & (A ^ B));

endmodule

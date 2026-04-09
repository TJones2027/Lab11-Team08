
module top (
    input btnC,        // Clock
    input btnU,        // Reset
    output [6:0] led   
);

    wire q0_n, q1_n, q2_n;
    tff stage1 (.T(1'b1), .clk(btnC),   .Q(led[0]), .Q_n(q0_n));
    tff stage2 (.T(1'b1), .clk(led[0]), .Q(led[1]), .Q_n(q1_n));
    tff stage3 (.T(1'b1), .clk(led[1]), .Q(led[2]), .Q_n(q2_n));

    wire [2:0] current_state;
    wire [2:0] next_val;
    wire [2:0] sum;
    wire [2:0] co_junk; 
    wire is_five, combined_reset;

    full_adder add0 (.A(current_state[0]), .B(1'b1), .CIN(1'b0), .Y(sum[0]), .CO(co_junk[0]));
    full_adder add1 (.A(current_state[1]), .B(1'b0), .CIN(co_junk[0]), .Y(sum[1]), .CO(co_junk[1]));
    full_adder add2 (.A(current_state[2]), .B(1'b0), .CIN(co_junk[1]), .Y(sum[2]), .CO(co_junk[2]));

    assign is_five = (current_state[2] & ~current_state[1] & current_state[0]);
    assign combined_reset = btnU | is_five;
    assign next_val = combined_reset ? 3'b000 : sum;

    dff state0 (.D(next_val[0]), .clk(btnC), .Q(current_state[0]), .Q_n());
    dff state1 (.D(next_val[1]), .clk(btnC), .Q(current_state[1]), .Q_n());
    dff state2 (.D(next_val[2]), .clk(btnC), .Q(current_state[2]), .Q_n());

    tff mod_out_inst (.T(is_five), .clk(btnC), .Q(led[6]), .Q_n());

    assign led[5:3] = current_state;

endmodule
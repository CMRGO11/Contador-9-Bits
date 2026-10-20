module signed_counter_fsm (
    input wire clk,
    input wire reset,
    input wire pause_pulse,
    input wire inc_pulse,
    input wire dec_pulse,
    input wire tick,
    output reg signed [8:0] count,
    output reg [1:0] state
);
    localparam [1:0] S_PAUSE = 2'd0;
    localparam [1:0] S_UP = 2'd1;
    localparam [1:0] S_DOWN = 2'd2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_PAUSE;
            count <= 9'sd0;
        end else begin
            if (pause_pulse) begin
                state <= S_PAUSE;
            end else if (inc_pulse) begin
                state <= S_UP;
            end else if (dec_pulse) begin
                state <= S_DOWN;
            end

            if (tick) begin
                if (state == S_UP) begin
                    count <= count + 9'sd1;
                end else if (state == S_DOWN) begin
                    count <= count - 9'sd1;
                end
            end
        end
    end
endmodule

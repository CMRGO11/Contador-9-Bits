module signed_display_9bit (
    input wire signed [8:0] value,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3
);
    wire [8:0] abs_value;
    wire is_neg;
    wire [3:0] dig0, dig1, dig2;

    assign is_neg = (value < 0);
    assign abs_value = is_neg ? -value : value;

    assign dig0 = abs_value % 10;
    assign dig1 = (abs_value / 10) % 10;
    assign dig2 = (abs_value / 100) % 10;

    function [6:0] seg7;
        input [3:0] digit;
        begin
            case(digit)
                4'd0: seg7 = 7'b1000000;
                4'd1: seg7 = 7'b1111001;
                4'd2: seg7 = 7'b0100100;
                4'd3: seg7 = 7'b0110000;
                4'd4: seg7 = 7'b0011001;
                4'd5: seg7 = 7'b0010010;
                4'd6: seg7 = 7'b0000010;
                4'd7: seg7 = 7'b1111000;
                4'd8: seg7 = 7'b0000000;
                4'd9: seg7 = 7'b0010000;
                default: seg7 = 7'b1111111;
            endcase
        end
    endfunction

    always @(*) begin
        HEX0 = seg7(dig0);
        HEX1 = seg7(dig1);
        HEX2 = seg7(dig2);
        if (is_neg)
            HEX3 = 7'b0111111;
        else
            HEX3 = 7'b1111111;
    end
endmodule

module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    reg [15:0] count;

    assign q = count;

    assign ena[1] = (count[3:0] == 4'd9);

    assign ena[2] = (count[3:0] == 4'd9) &&
                    (count[7:4] == 4'd9);

    assign ena[3] = (count[3:0] == 4'd9) &&
                    (count[7:4] == 4'd9) &&
                    (count[11:8] == 4'd9);

    always @(posedge clk) begin
        if (reset) begin
            count <= 16'd0;
        end
        else begin
            if (count[3:0] == 4'd9)
                count[3:0] <= 4'd0;
            else
                count[3:0] <= count[3:0] + 1'b1;
            if (ena[1]) begin
                if (count[7:4] == 4'd9)
                    count[7:4] <= 4'd0;
                else
                    count[7:4] <= count[7:4] + 1'b1;
            end
            if (ena[2]) begin
                if (count[11:8] == 4'd9)
                    count[11:8] <= 4'd0;
                else
                    count[11:8] <= count[11:8] + 1'b1;
            end
            if (ena[3]) begin
                if (count[15:12] == 4'd9)
                    count[15:12] <= 4'd0;
                else
                    count[15:12] <= count[15:12] + 1'b1;
            end

        end
    end

endmodule
